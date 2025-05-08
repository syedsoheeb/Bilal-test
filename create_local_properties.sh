#!/bin/bash

# This script creates local.properties file for Flutter Android builds on AppCircle

# Print directory contents to debug
echo "Listing repository contents:"
ls -la 

# Check if android directory exists
if [ ! -d "android" ]; then
  echo "Creating android directory since it doesn't exist..."
  mkdir -p android
fi

# Get Flutter SDK path
FLUTTER_PATH=`which flutter | xargs dirname | xargs dirname`
echo "Detected Flutter SDK path: $FLUTTER_PATH"

# Create local.properties
echo "Creating local.properties file..."
echo "flutter.sdk=$FLUTTER_PATH" > android/local.properties
echo "sdk.dir=/Users/appcircle/android-sdk-linux" >> android/local.properties

# Verify file contents
echo "Local properties file created with content:"
cat android/local.properties

# If you need to check settings.gradle
if [ -f "android/settings.gradle" ]; then
  echo "Current settings.gradle content:"
  cat android/settings.gradle
  
  # Create a backup of the original file
  cp android/settings.gradle android/settings.gradle.bak
  
  # Create a simpler settings.gradle file
  echo "Creating a simpler settings.gradle file..."
  cat > android/settings.gradle << 'SETTINGS'
// This is a simple settings.gradle file that works with Flutter
include ':app'

def flutterProjectRoot = rootProject.projectDir.parentFile.toPath()
def properties = new Properties()

def localPropertiesFile = new File(flutterProjectRoot.toFile(), "local.properties")
assert localPropertiesFile.exists(), "❌ Create a local.properties file with flutter.sdk=/path/to/flutter"
localPropertiesFile.withReader("UTF-8") { reader -> properties.load(reader) }

def flutterSdkPath = properties.getProperty("flutter.sdk")
assert flutterSdkPath != null, "❌ flutter.sdk not set in local.properties"

apply from: "$flutterSdkPath/packages/flutter_tools/gradle/app_plugin_loader.gradle"
SETTINGS

  echo "New settings.gradle content:"
  cat android/settings.gradle
else
  echo "settings.gradle not found in android directory"
fi

# Fix for common build issues
echo "Performing additional setup for Android build..."

# Create build.gradle if it doesn't exist
if [ ! -f "android/build.gradle" ]; then
  echo "Creating android/build.gradle..."
  cat > android/build.gradle << 'BUILDGRADLE'
buildscript {
    ext.kotlin_version = '1.9.0'
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:7.4.2'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

rootProject.buildDir = '../build'
subprojects {
    project.buildDir = "${rootProject.buildDir}/${project.name}"
}
subprojects {
    project.evaluationDependsOn(':app')
}

tasks.register("clean", Delete) {
    delete rootProject.buildDir
}
BUILDGRADLE
fi

# Create app/build.gradle if it doesn't exist
if [ ! -d "android/app" ]; then
  mkdir -p android/app
fi

if [ ! -f "android/app/build.gradle" ]; then
  echo "Creating android/app/build.gradle..."
  cat > android/app/build.gradle << 'APPBUILDGRADLE'
plugins {
    id "com.android.application"
    id "kotlin-android"
    id "dev.flutter.flutter-gradle-plugin"
}

def localProperties = new Properties()
def localPropertiesFile = rootProject.file('local.properties')
if (localPropertiesFile.exists()) {
    localPropertiesFile.withReader('UTF-8') { reader ->
        localProperties.load(reader)
    }
}

def flutterVersionCode = localProperties.getProperty('flutter.versionCode')
if (flutterVersionCode == null) {
    flutterVersionCode = '1'
}

def flutterVersionName = localProperties.getProperty('flutter.versionName')
if (flutterVersionName == null) {
    flutterVersionName = '1.0'
}

android {
    namespace "com.bilalthemuezzin.app"
    compileSdk 35
    ndkVersion flutter.ndkVersion

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_8
        targetCompatibility JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = '1.8'
    }

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }

    defaultConfig {
        applicationId "com.bilalthemuezzin.app"
        minSdkVersion flutter.minSdkVersion
        targetSdkVersion flutter.targetSdkVersion
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
    }

    buildTypes {
        release {
            signingConfig signingConfigs.debug
        }
    }
}

flutter {
    source '../..'
}

dependencies {}
APPBUILDGRADLE
fi

echo "Setup complete!"
