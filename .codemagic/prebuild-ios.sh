#!/bin/bash

echo "==Decoding GoogleService-Info.plist File"

echo $GOOGLESERVICE_INFO_PLIST | base64 --decode > $FCI_BUILD_DIR/ios/Runner/GoogleService-Info.plist

echo "==Successfully Decoded GoogleService-Info.plist File"
