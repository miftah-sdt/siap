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
        let payload: [String: Any] = [
            "code": code,
            "message": message,
            "category": category,
            "platform": "ios",
            "will_kill_app": willKillApp,
            "detected_at": ISO8601DateFormatter().string(from: Date()),
            "extra": extra,
        ]

        DispatchQueue.main.async { [weak self] in
            self?.eventSink?(payload)
        }

        if willKillApp {
            DispatchQueue.main.asyncAfter(deadline: .now() + killDelay) { [weak self] in
                guard let self else { return }
                if !self.acknowledgedCodes.contains(code) {
                    exit(0)
                }
            }
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
