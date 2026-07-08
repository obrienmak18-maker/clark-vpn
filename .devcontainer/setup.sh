#!/bin/bash

# Install Flutter
if [ ! -d "/usr/local/flutter" ]; then
    sudo git clone https://github.com/flutter/flutter.git -b stable /usr/local/flutter
    sudo chown -R codespace:codespace /usr/local/flutter
fi

# Add Flutter to PATH
export PATH="$PATH:/usr/local/flutter/bin"
echo 'export PATH="$PATH:/usr/local/flutter/bin"' >> ~/.bashrc

# Pre-download Flutter dependencies
flutter doctor
flutter precache

# Setup Android SDK (if not present)
# Note: The universal image usually has basic Android tools, but we ensure Flutter is ready
flutter config --no-analytics
flutter packages pub get
