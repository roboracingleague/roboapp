#!/usr/bin/env bash

set -e

BUILD_FLAVOR=$1

echo "Create dummy google-services.json file required by Firestore at build time"

mv android/app/src/${BUILD_FLAVOR}/google-services.dummy android/app/src/${BUILD_FLAVOR}/google-services.json

echo "Build Android"

flutter build appbundle --profile --flavor=${BUILD_FLAVOR} --target=lib/main_${BUILD_FLAVOR}.dart