set -e
flutter clean
flutter pub get
flutter pub run build_runner watch --delete-conflicting-outputs
flutter pub run build_runner build --enable-experiment=enhanced-enums --delete-conflicting-outputs
