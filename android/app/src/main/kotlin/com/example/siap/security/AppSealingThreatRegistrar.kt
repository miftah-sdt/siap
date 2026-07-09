package com.example.siap.security

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

/**
 * Registrasi Flutter platform channel.
 * Threat callback DoveRunner ditangani oleh [ThreatReceiver] (broadcast).
 */
object AppSealingThreatRegistrar {
    const val CHANNEL = "com.siap/appsealing_threats"

    fun register(flutterEngine: FlutterEngine) {
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                AppSealingThreatBridge.handleMethodCall(call, result)
            }

        EventChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setStreamHandler(
                object : EventChannel.StreamHandler {
                    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                        AppSealingThreatBridge.setEventSink(events)
                    }

                    override fun onCancel(arguments: Any?) {
                        AppSealingThreatBridge.setEventSink(null)
                    }
                },
            )
    }
}
