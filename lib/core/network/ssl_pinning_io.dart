import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';
import 'package:siap/core/network/ssl_pinning_validator.dart';

void configureSslPinning(
  Dio dio,
  SslPinningConfig config, {
  String? burpProxy,
}) {
  final proxy = burpProxy?.trim();
  final useProxy = proxy != null && proxy.isNotEmpty;
  final usePinning = config.enabled;

  if (!useProxy && !usePinning) return;

  dio.httpClientAdapter = IOHttpClientAdapter(
    createHttpClient: useProxy
        ? () {
            final client = HttpClient();
            client.findProxy = (_) => 'PROXY $proxy';
            if (!usePinning) {
              client.badCertificateCallback = (_, _, _) => true;
            }
            return client;
          }
        : null,
    validateCertificate: usePinning
        ? (certificate, host, port) {
            return isCertificatePinned(
              der: certificate?.der,
              host: host,
              config: config,
            );
          }
        : null,
  );
}
