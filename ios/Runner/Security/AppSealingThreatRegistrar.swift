import Flutter

/// Rollback: hapus folder Security/ + pemanggilan di AppDelegate.
enum AppSealingThreatRegistrar {
    static let channelName = "com.siap/appsealing_threats"

    static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()

        let methodChannel = FlutterMethodChannel(
            name: channelName,
            binaryMessenger: messenger
        )
        methodChannel.setMethodCallHandler { call, result in
            AppSealingThreatBridge.shared.handleMethodCall(call, result: result)
        }

        let eventChannel = FlutterEventChannel(
            name: channelName,
            binaryMessenger: messenger
        )
        eventChannel.setStreamHandler(AppSealingThreatStreamHandler())
    }

    static func registerAppSealingCallback() {
        // Sesuaikan dengan callback API AppSealing iOS (Xcode Guide Part IV):
        // AppSealing.shared.setHackDetectHandler { code, message, category, willKill in
        //     AppSealingThreatBridge.shared.onThreatDetected(
        //         code: code, message: message,
        //         category: category, willKillApp: willKill
        //     )
        // }
    }
}
