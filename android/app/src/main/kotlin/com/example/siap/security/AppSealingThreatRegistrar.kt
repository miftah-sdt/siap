package com.example.siap.security

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

/**
 * Registrasi platform channel. Dipanggil dari [MainActivity].
 * Rollback: hapus file ini + folder security + baris register di MainActivity.
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

    /**
     * Daftarkan callback AppSealing SDK di sini (sesuaikan Applying Guide ADC).
     */
    fun registerAppSealingCallback() {
        // Contoh ilustratif — ganti dengan API resmi AppSealing:
        // AppSealing.setOnHackDetectedListener { code, message, category, willKill ->
        //     AppSealingThreatBridge.onThreatDetected(code, message, category, willKill)
        // }
    }
}
