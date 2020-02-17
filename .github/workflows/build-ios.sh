#!/usr/bin/env bash

set -e

BUILD_FLAVOR=$1

echo "Create dummy GoogleService-Info.plist file required by Firestore at build time"

mv ios/Runner/GoogleService-Info.dummy ios/Runner/GoogleService-Info.plist

echo "Build Android"

flutter build ios --profile --flavor=$BUILD_FLAVOR --target=lib/main_$BUILD_FLAVOR.dart --no-codesign