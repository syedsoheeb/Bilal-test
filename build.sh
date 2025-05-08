#!/bin/bash

# Build the APK
echo "Building Bilal The Muezzin APK..."
flutter build apk --debug

# Copy the APK to the app.apk directory
cp build/app/outputs/flutter-apk/app-debug.apk app.apk/bilal-muezzin.apk

echo "Build completed. APK file is at app.apk/bilal-muezzin.apk"
