# Bilal The Muezzin

A comprehensive mobile application designed to enhance Islamic spiritual practice through innovative technology, connecting to smart speakers and providing prayer times, Quranic content, and dhikr reminders.

## Features

- 🕌 Prayer time calculation based on user location
- 🔊 Connect to Google Cast and Amazon Alexa devices
- 📖 Quran recitation scheduling
- 📿 Morning and evening azkar reminders
- 🌙 Islamic (Hijri) date display
- 🔔 Prayer time notifications
- 👥 Multiple speaker group management
- 🎛️ Personalized sound profiles for azaan

## Building the App

### Local Build
1. Make sure you have Flutter installed and set up.
2. Clone this repository.
3. Navigate to the project directory: `cd islamic_prayer_app`
4. Get dependencies: `flutter pub get`
5. Build the APK: `flutter build apk --release`
6. The APK will be available at: `build/app/outputs/flutter-apk/app-release.apk`

### Using the Build Script
1. Make the build script executable: `chmod +x ../build_android_apk.sh`
2. Run the build script: `../build_android_apk.sh`
3. Follow the instructions to download the APK.

### Using Codemagic
This project includes a `codemagic.yaml` configuration file for building with Codemagic CI/CD.

## Development Notes

### Plugin Dependencies
Some audio plugins have been temporarily removed to fix Android v1 embedding issues:
```yaml
# Audio plugins removed to fix Android v1 embedding issue
# just_audio: ^0.9.35
# audio_service: ^0.18.10
```

These will be re-integrated when we implement the actual audio functionality.

### Current Limitations
- Audio playback to smart speakers is currently mocked
- Actual Google Cast and Alexa SDK integration is pending
- Notification functionality is implemented as placeholders

## License
This project is licensed under the MIT License.

## Credits
- Islamic design elements: Various Islamic art and architecture sources
- Prayer time calculations: Adapted from various Islamic prayer time calculation algorithms