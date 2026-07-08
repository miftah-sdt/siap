package com.example.siap.security

import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.time.Instant
import java.util.concurrent.ConcurrentHashMap

/**
 * Bridge AppSealing threat callback → Flutter EventChannel.
 *
 * Panggil [onThreatDetected] dari listener AppSealing SDK (Applying Guide ADC).
 */
object AppSealingThreatBridge {
    private const val KILL_DELAY_MS = 3_000L

    private var eventSink: EventChannel.EventSink? = null
    private val mainHandler = Handler(Looper.getMainLooper())
    private val acknowledged = ConcurrentHashMap.newKeySet<Int>()

    fun setEventSink(sink: EventChannel.EventSink?) {
        eventSink = sink
    }

    fun onThreatDetected(
        code: Int,
        message: String,
        category: String,
        willKillApp: Boolean,
        extra: Map<String, Any?> = emptyMap(),
    ) {
        val payload = linkedMapOf<String, Any?>(
            "code" to code,
            "message" to message,
            "category" to category,
            "platform" to "android",
            "will_kill_app" to willKillApp,
            "detected_at" to Instant.now().toString(),
            "extra" to extra,
        )

        mainHandler.post {
            eventSink?.success(payload)
        }

        if (willKillApp) {
            scheduleKillAfterAck(code)
        }
    }

    fun acknowledgeThreat(code: Int, reported: Boolean): Boolean {
        acknowledged.add(code)
        return true
    }

    fun isAppSealingActive(): Boolean {
        return try {
            Class.forName("com.inka.appsealing.AppSealingAlertDialog")
            true
        } catch (_: ClassNotFoundException) {
            false
        }
    }

    fun handleMethodCall(call: MethodChannel.MethodCall, result: MethodChannel.Result) {
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

    private fun scheduleKillAfterAck(code: Int) {
        mainHandler.postDelayed({
            if (!acknowledged.contains(code)) {
                android.os.Process.killProcess(android.os.Process.myPid())
            }
        }, KILL_DELAY_MS)
    }
}
