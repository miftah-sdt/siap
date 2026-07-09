package com.example.siap.security

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.util.Log

/**
 * Menerima broadcast Monitoring Mode dari DoveRunner sealed app.
 *
 * Action: [DoveRunnerThreatCatalog.ACTION_THREAT_DISCOVERED]
 * Extras: threat_code / error_code, timestamp (epoch millis)
 */
class ThreatReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context, intent: Intent?) {
        if (intent == null || intent.action != DoveRunnerThreatCatalog.ACTION_THREAT_DISCOVERED) {
            return
        }

        val threatCode = intent.getStringExtra(DoveRunnerThreatCatalog.EXTRA_THREAT_CODE)
            ?: intent.getStringExtra(DoveRunnerThreatCatalog.EXTRA_ERROR_CODE)
        if (threatCode.isNullOrBlank()) {
            return
        }

        val timestamp = intent.getLongExtra(DoveRunnerThreatCatalog.EXTRA_TIMESTAMP, 0L)
        Log.d(TAG, "Threat Code: $threatCode | Timestamp: $timestamp")

        AppSealingThreatBridge.onDoveRunnerThreatDiscovered(
            threatCode = threatCode,
            timestampMillis = timestamp,
        )
    }

    companion object {
        private const val TAG = "ThreatTracker"
    }
}
