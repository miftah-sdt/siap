import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:siap/core/network/ssl_pinning_config.dart';
import 'package:siap/core/network/ssl_pinning_validator.dart';

void configureSslPinning(Dio dio, SslPinningConfig config) {
  if (!config.enabled) return;

  dio.httpClientAdapter = IOHttpClientAdapter(
    validateCertificate: (certificate, host, port) {
      return isCertificatePinned(
        der: certificate?.der,
        host: host,
        config: config,
      );
    },
  );
}
