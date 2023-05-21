#A script helps you build iOS Apps Faster


#define EnvironmentVar

device='iPhone 14'
platform='iOS Simulator'
DIR=$(PWD)
APP_NAME=$(basename "$PWD")
SCHEME='DigitalInkRecognitionExample'

#install dependcy
pod install

# Build App using xcodebuild without sign
xcodebuild clean build -workspace "$APP_NAME".xcworkspace -scheme  \
-configuration Debug build-for-testing -destination "platform=$platform,name=$device" CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO \
-archivePath "$APP_NAME".xcarchive archive

#Export App
rm -rf Payload
mkdir Payload
mv "$APP_NAME".xcarchive/Products/Applications/"$APP_NAME".app Payload
zip -r "$APP_NAME".zip Payload/
rm -rf Payload
