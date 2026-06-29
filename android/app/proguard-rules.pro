# Flutter engine & plugins
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.embedding.** { *; }
-keep class io.flutter.plugins.** { *; }
-dontwarn io.flutter.embedding.**

# Gson (used by some Android plugins)
-keepattributes Signature
-keepattributes *Annotation*
-dontwarn sun.misc.**

# Geolocator / Play Services location
-keep class com.baseflow.geolocator.** { *; }
-dontwarn com.google.android.gms.**

# Local notifications
-keep class com.dexterous.** { *; }

# File picker / image picker
-keep class com.mr.flutter.plugin.filepicker.** { *; }
-dontwarn androidx.lifecycle.**

# Keep native methods
-keepclasseswithmembernames class * {
    native <methods>;
}
