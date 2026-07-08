import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    // Rollback: hapus 2 baris di bawah + folder Runner/Security/
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "AppSealingThreat") {
      AppSealingThreatRegistrar.register(with: registrar)
      AppSealingThreatRegistrar.registerAppSealingCallback()
    }
  }
}
