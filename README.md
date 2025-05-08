# AppCircle Script Fix for Flutter

This script is designed to fix the Flutter Android build on AppCircle.

## How to Use

1. Add a "Custom Script" step in AppCircle before the "Flutter Build for Android" step
2. Copy and paste the content of `create_local_properties.sh` into the script field
3. Save and run the build

## What This Script Does

1. Creates the Android directory if it doesn't exist
2. Creates a proper local.properties file with the correct Flutter SDK path
3. Fixes settings.gradle to work with Flutter
4. Creates build.gradle files if they don't exist

This script is designed to be verbose and print diagnostic information to help troubleshoot build issues.
