package com.example.siap

import com.example.siap.security.AppSealingThreatRegistrar
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Rollback: hapus 2 baris di bawah + folder security/
        AppSealingThreatRegistrar.register(flutterEngine)
        AppSealingThreatRegistrar.registerAppSealingCallback()
    }
}
