# Bilal The Muezzin

A comprehensive Islamic prayer app that plays Azaan (call to prayer) on smart speakers including Google Home and Amazon Alexa devices.

## Features

- Islamic prayer times based on your location
- Beautiful Adhan (call to prayer) audio options
- Schedule Azaan for different prayer times
- Daily Dhikr and Azkar with Arabic text, transliteration, and translation
- Quran surah selection for recitation
- Multiple smart speaker support (Google Cast and Alexa)
- Speaker group management for multiple devices
- Customizable sound profiles
- Morning and Evening Azkar routines
- Nearby mosque finder
- Hijri date display

## Getting Started

### Prerequisites

- Flutter (latest stable version)
- Android SDK for Android builds
- Optional: iOS development setup for iOS builds

### Installation

1. Clone this repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app in debug mode

### Building for Production

To build the release version:

```
flutter build apk --release
```

## How It Works

The app connects to your Google Cast or Alexa devices on your local network and sends audio commands to play Adhan or Quran audio at scheduled times or on-demand.

## Technology

- Flutter for cross-platform mobile development
- Google Cast SDK for Google Home integration
- Alexa Voice Service for Amazon Echo integration
- Prayer times calculation using standard methods
