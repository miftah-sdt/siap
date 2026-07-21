import Flutter
import Foundation

final class AppSealingThreatBridge {
    static let shared = AppSealingThreatBridge()

    private let killDelay: TimeInterval = 3.0
    private var eventSink: FlutterEventSink?
    private var acknowledgedCodes = Set<Int>()

    private init() {}

    func setEventSink(_ sink: FlutterEventSink?) {
        eventSink = sink
    }

    func onThreatDetected(
        code: Int,
        message: String,
        category: String,
        willKillApp: Bool,
        extra: [String: Any] = [:]
    ) {
        emitThreatPayload(
            threatCode: extra["threat_code"] as? String,
            code: code,
            message: message,
            category: category,
            severity: extra["severity"] as? String,
            willKillApp: willKillApp,
            extra: extra
        )

        if willKillApp {
            DispatchQueue.main.asyncAfter(deadline: .now() + killDelay) { [weak self] in
                guard let self else { return }
                if !self.acknowledgedCodes.contains(code) {
                    exit(0)
                }
            }
        }
    }

    func onDoveRunnerThreatDiscovered(threatCode: String, timestampMillis: Int64) {
        let info = DoveRunnerThreatCatalog.resolve(threatCode)
        let numericCode = DoveRunnerThreatCatalog.parseNumericCode(info.threatCode)
        let detectedAtMillis = timestampMillis > 0 ? timestampMillis : Int64(Date().timeIntervalSince1970 * 1000)

        emitThreatPayload(
            threatCode: info.threatCode,
            code: numericCode,
            message: info.message,
            category: info.category,
            severity: info.severity,
            willKillApp: false,
            extra: [
                "source": "doverunner_callback",
                "raw_threat_code": threatCode,
                "timestamp_millis": detectedAtMillis,
            ],
            detectedAtMillis: detectedAtMillis
        )
    }

    private func emitThreatPayload(
        threatCode: String?,
        code: Int,
        message: String,
        category: String,
        severity: String?,
        willKillApp: Bool,
        extra: [String: Any],
        detectedAtMillis: Int64? = nil
    ) {
        let detectedAt: String
        if let millis = detectedAtMillis {
            detectedAt = ISO8601DateFormatter().string(from: Date(timeIntervalSince1970: TimeInterval(millis) / 1000))
        } else {
            detectedAt = ISO8601DateFormatter().string(from: Date())
        }

        var payload: [String: Any] = [
            "code": code,
            "message": message,
            "category": category,
            "platform": "ios",
            "will_kill_app": willKillApp,
            "detected_at": detectedAt,
            "extra": extra,
        ]
        if let threatCode {
            payload["threat_code"] = threatCode
        }
        if let severity {
            payload["severity"] = severity
        }

        DispatchQueue.main.async { [weak self] in
            self?.eventSink?(payload)
        }
    }

    func acknowledgeThreat(code: Int, reported: Bool) -> Bool {
        acknowledgedCodes.insert(code)
        return true
    }

    func isAppSealingActive() -> Bool {
        NSClassFromString("AppSealingCore") != nil
    }

    func handleMethodCall(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "acknowledgeThreat":
            guard let args = call.arguments as? [String: Any],
                  let code = args["code"] as? Int else {
                result(false)
                return
            }
            let reported = args["reported"] as? Bool ?? false
            result(acknowledgeThreat(code: code, reported: reported))

        case "isAppSealingActive":
            result(isAppSealingActive())

        default:
            result(FlutterMethodNotImplemented)
        }
    }
}

final class AppSealingThreatStreamHandler: NSObject, FlutterStreamHandler {
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        AppSealingThreatBridge.shared.setEventSink(events)
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        AppSealingThreatBridge.shared.setEventSink(nil)
        return nil
    }
}
