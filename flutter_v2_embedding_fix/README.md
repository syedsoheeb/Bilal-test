# Flutter V2 Embedding Fix for Bilal The Muezzin

This package contains files to fix the "Build failed due to use of deleted Android v1 embedding" error.

## Instructions

1. Replace your `android/app/src/main/java/com/bilalthemuezzin/app/MainActivity.kt` file with the one provided
2. Replace your `android/app/build.gradle` file with the one provided
3. Replace your `android/app/src/main/AndroidManifest.xml` file with the one provided
4. Replace your `android/app/src/main/res/values/styles.xml` file with the one provided
5. Replace your `android/build.gradle` and `android/settings.gradle` files with the ones provided

These changes will update your Flutter app to use the V2 embedding, which is required for recent Flutter versions.

## What's Changed

- Updated MainActivity to extend FlutterActivity (V2 embedding)
- Added flutterEmbedding meta-data in AndroidManifest.xml
- Updated Gradle configuration for V2 embedding
- Updated theme configuration
