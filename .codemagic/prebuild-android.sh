#!/bin/bash

echo "==Decoding google-services.json File"

echo $GOOGLE_SERVICES_JSON | base64 --decode > $FCI_BUILD_DIR/android/app/src/prod/google-services.json

echo "==Successfully Decoded google-services.json File"