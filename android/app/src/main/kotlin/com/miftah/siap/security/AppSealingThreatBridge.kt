package com.miftah.siap.security

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.time.Instant
import java.util.concurrent.ConcurrentHashMap

/**
 * Bridge DoveRunner threat broadcast → Flutter EventChannel → Dio → REST API.
 */
object AppSealingThreatBridge {
    private var eventSink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper())
    private val acknowledged = ConcurrentHashMap.newKeySet<Int>()
    private val recentBroadcastKeys = ConcurrentHashMap.newKeySet<String>()

    fun setEventSink(sink: EventChannel.EventSink?) {
        eventSink = sink
    }

    /**
     * Entry point dari [ThreatReceiver] sesuai DoveRunner Monitoring Mode.
     * Broadcast hanya mengirim threat_code + timestamp; app tidak di-kill.
     */
    fun onDoveRunnerThreatDiscovered(threatCode: String, timestampMillis: Long) {
        val info = DoveRunnerThreatCatalog.resolve(threatCode)
        val numericCode = DoveRunnerThreatCatalog.parseNumericCode(info.threatCode)
        val detectedAtMillis = if (timestampMillis > 0L) timestampMillis else System.currentTimeMillis()

        // DoveRunner mendeteksi berkala (~5 detik). Dedup per bucket 5 detik.
        val dedupeKey = "${info.threatCode}-${detectedAtMillis / 5_000L}"
        if (!recentBroadcastKeys.add(dedupeKey)) {
            return
        }

        val payload = linkedMapOf<String, Any?>(
            "threat_code" to info.threatCode,
            "code" to numericCode,
            "message" to info.message,
            "category" to info.category,
            "severity" to info.severity,
            "platform" to "android",
            "will_kill_app" to false,
            "detected_at" to Instant.ofEpochMilli(detectedAtMillis).toString(),
            "extra" to mapOf(
                "source" to "doverunner_broadcast",
                "raw_threat_code" to threatCode,
                "timestamp_millis" to detectedAtMillis,
            ),
        )

        mainHandler.post {
            eventSink?.success(payload)
        }
    }

    fun acknowledgeThreat(code: Int, reported: Boolean): Boolean {
        acknowledged.add(code)
        return true
    }

    fun isAppSealingActive(): Boolean {
        return isDoveRunnerSealed() || isLegacyAppSealingPresent()
    }

    private fun isDoveRunnerSealed(): Boolean {
        return try {
            Class.forName("com.doverunner.aos.security.AppSealingAlertDialog")
            true
        } catch (_: ClassNotFoundException) {
            false
        }
    }

    private fun isLegacyAppSealingPresent(): Boolean {
        return try {
            Class.forName("com.inka.appsealing.AppSealingAlertDialog")
            true
        } catch (_: ClassNotFoundException) {
            false
        }
    }

    fun handleMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "acknowledgeThreat" -> {
                val code = call.argument<Int>("code") ?: 0
                val reported = call.argument<Boolean>("reported") ?: false
                result.success(acknowledgeThreat(code, reported))
            }
            "isAppSealingActive" -> result.success(isAppSealingActive())
            else -> result.notImplemented()
        }
    }
}
