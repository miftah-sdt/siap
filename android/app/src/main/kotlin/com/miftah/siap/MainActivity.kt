package com.miftah.siap

import com.miftah.siap.security.AppSealingThreatRegistrar
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Rollback: hapus baris di bawah + folder security/ + ThreatReceiver di manifest
        AppSealingThreatRegistrar.register(flutterEngine)
    }
}
