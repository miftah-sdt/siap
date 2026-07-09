package com.example.siap.security

/**
 * DoveRunner Threat Detection Callback (Monitoring Mode) — Android RASP v3.2.0.0+
 *
 * Ref: Threat_Detection_Callback_Integration_Guide_Android_v1.0_EN
 */
object DoveRunnerThreatCatalog {
    const val ACTION_THREAT_DISCOVERED =
        "com.doverunner.aos.security.action.THREAT_DISCOVERED"
    const val PERMISSION_RECEIVE_ALERTS =
        "com.doverunner.aos.security.permission.RECEIVE_ALERTS"
    const val EXTRA_THREAT_CODE = "threat_code"
    const val EXTRA_ERROR_CODE = "error_code"
    const val EXTRA_TIMESTAMP = "timestamp"

    data class ThreatInfo(
        val threatCode: String,
        val category: String,
        val message: String,
        val severity: String,
    )

    private val catalog = mapOf(
        "D10001" to ThreatInfo("D10001", "rooted_device", "Root access detected", "critical"),
        "D10002" to ThreatInfo("D10002", "rooted_device", "Root access detected", "critical"),
        "D10003" to ThreatInfo("D10003", "rooted_device", "Root access detected", "critical"),
        "D14001" to ThreatInfo("D14001", "rooted_device", "Root access detected", "critical"),
        "D11001" to ThreatInfo("D11001", "android_emulator", "Emulator environment detected", "medium"),
        "D12001" to ThreatInfo("D12001", "app_cloning", "App cloning environment detected", "medium"),
        "D12002" to ThreatInfo("D12002", "app_cloning", "App cloning environment detected", "medium"),
        "D12101" to ThreatInfo("D12101", "app_cloning", "App cloning environment detected", "medium"),
        "D12201" to ThreatInfo("D12201", "app_cloning", "App cloning environment detected", "medium"),
        "D12102" to ThreatInfo("D12102", "app_cloning", "App cloning environment detected", "medium"),
        "D12202" to ThreatInfo("D12202", "app_cloning", "App cloning environment detected", "medium"),
        "D12203" to ThreatInfo("D12203", "app_cloning", "App cloning environment detected", "medium"),
        "D12204" to ThreatInfo("D12204", "app_cloning", "App cloning environment detected", "medium"),
        "D12301" to ThreatInfo("D12301", "app_cloning", "App cloning environment detected", "medium"),
        "D20002" to ThreatInfo("D20002", "debugging", "Debugging tools or frameworks detected", "medium"),
        "D22001" to ThreatInfo("D22001", "debugging", "Debugging tools or frameworks detected", "medium"),
        "D22002" to ThreatInfo("D22002", "debugging", "Debugging tools or frameworks detected", "medium"),
        "D30001" to ThreatInfo("D30001", "cheat_tool", "Cheat tool detected", "medium"),
        "D30002" to ThreatInfo("D30002", "cheat_tool", "Cheat tool detected", "medium"),
        "D30003" to ThreatInfo("D30003", "cheat_tool", "Cheat tool detected", "medium"),
        "D21001" to ThreatInfo("D21001", "cheat_tool", "Cheat tool detected", "medium"),
        "D21002" to ThreatInfo("D21002", "cheat_tool", "Cheat tool detected", "medium"),
        "D40001" to ThreatInfo("D40001", "code_modification", "Code modification detected", "critical"),
        "D60005" to ThreatInfo("D60005", "code_modification", "Code modification detected", "critical"),
        "D50001" to ThreatInfo("D50001", "repackaged_app", "Repackaged application detected", "critical"),
        "D60001" to ThreatInfo("D60001", "repackaged_app", "Repackaged application detected", "critical"),
        "D60002" to ThreatInfo("D60002", "repackaged_app", "Repackaged application detected", "critical"),
        "D60004" to ThreatInfo("D60004", "repackaged_app", "Repackaged application detected", "critical"),
        "D60006" to ThreatInfo("D60006", "repackaged_app", "Repackaged application detected", "critical"),
        "D21003" to ThreatInfo("D21003", "repackaged_app", "Repackaged application detected", "critical"),
        "D13002" to ThreatInfo("D13002", "usb_debugging", "USB debugging enabled", "low"),
        "D20007" to ThreatInfo("D20007", "tampering", "System tampering or security disabled", "critical"),
        "D60003" to ThreatInfo("D60003", "tampering", "System tampering or security disabled", "critical"),
    )

    fun resolve(threatCode: String): ThreatInfo {
        return catalog[threatCode.uppercase()]
            ?: ThreatInfo(
                threatCode = threatCode.uppercase(),
                category = "unknown",
                message = "DoveRunner threat $threatCode",
                severity = "unknown",
            )
    }

    fun parseNumericCode(threatCode: String): Int {
        val normalized = threatCode.trim().uppercase()
        if (normalized.startsWith("D")) {
            return normalized.drop(1).toIntOrNull() ?: 0
        }
        return normalized.toIntOrNull() ?: 0
    }
}
