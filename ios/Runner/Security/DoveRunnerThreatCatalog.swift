import Foundation

/// DoveRunner threat code mapping (Android RASP v3.2.0.0+ parity).
enum DoveRunnerThreatCatalog {
    struct ThreatInfo {
        let threatCode: String
        let category: String
        let message: String
        let severity: String
    }

    private static let catalog: [String: ThreatInfo] = [
        "D10001": ThreatInfo(threatCode: "D10001", category: "rooted_device", message: "Root access detected", severity: "critical"),
        "D10002": ThreatInfo(threatCode: "D10002", category: "rooted_device", message: "Root access detected", severity: "critical"),
        "D10003": ThreatInfo(threatCode: "D10003", category: "rooted_device", message: "Root access detected", severity: "critical"),
        "D14001": ThreatInfo(threatCode: "D14001", category: "rooted_device", message: "Root access detected", severity: "critical"),
        "D11001": ThreatInfo(threatCode: "D11001", category: "android_emulator", message: "Emulator environment detected", severity: "medium"),
        "D12001": ThreatInfo(threatCode: "D12001", category: "app_cloning", message: "App cloning environment detected", severity: "medium"),
        "D13001": ThreatInfo(threatCode: "D13001", category: "usb_debugging", message: "USB debugging enabled", severity: "low"),
        "D13002": ThreatInfo(threatCode: "D13002", category: "usb_debugging", message: "USB debugging enabled", severity: "low"),
        "D20002": ThreatInfo(threatCode: "D20002", category: "debugging", message: "Debugging tools or frameworks detected", severity: "medium"),
        "D40001": ThreatInfo(threatCode: "D40001", category: "code_modification", message: "Code modification detected", severity: "critical"),
        "D50001": ThreatInfo(threatCode: "D50001", category: "repackaged_app", message: "Repackaged application detected", severity: "critical"),
    ]

    static func resolve(_ threatCode: String) -> ThreatInfo {
        let normalized = threatCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if let info = catalog[normalized] {
            return info
        }
        return ThreatInfo(
            threatCode: normalized,
            category: "unknown",
            message: "DoveRunner threat \(normalized)",
            severity: "unknown"
        )
    }

    static func parseNumericCode(_ threatCode: String) -> Int {
        let normalized = threatCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if normalized.hasPrefix("D"), let value = Int(normalized.dropFirst()) {
            return value
        }
        return Int(normalized) ?? 0
    }
}
