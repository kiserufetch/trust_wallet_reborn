# Trust Wallet Reborn

A **Flutter** educational UI clone inspired by the [Trust Wallet](https://trustwallet.com/) mobile app. This project focuses on interface patterns, navigation flows, and local architecture — it is **not** an official Trust Wallet product and is **not** affiliated with or endorsed by Trust Wallet.

## Features

- Wallet home screen with token-centric layout
- Onboarding / hello flow
- Create new wallet and restore flows
- PIN entry (BLoC + dedicated widgets)
- Network and token selection
- English and Russian UI (`easy_localization`)
- Material Design 3 theming and custom UI kit components

## Tech stack

| Area        | Choice                                      |
|------------|----------------------------------------------|
| Framework  | Flutter (Dart SDK `^3.7.2`)                  |
| State      | `flutter_bloc` / `bloc`                      |
| DI         | `get_it`                                     |
| HTTP       | `dio`                                        |
| Storage    | `shared_preferences`                         |
| i18n       | `easy_localization`                          |
| UI         | `flutter_svg`, `stylish_bottom_bar`, `pinput`, etc. |

## Requirements

- [Flutter](https://docs.flutter.dev/get-started/install) stable channel matching the project SDK constraint
- Android Studio / Xcode (or respective SDKs) for device emulators
- A physical device with USB debugging (optional)

## Getting started

```bash
git clone <repository-url>
cd trust_wallet_reborn
flutter pub get
flutter run
```

### Run on a specific device

```bash
flutter devices
flutter run -d <device_id>
```

### Analyze and test

```bash
flutter analyze
flutter test
```

## Project structure (high level)

```
lib/
  main.dart              # App entry, localization bootstrap
  di.dart                # GetIt registrations (BLoCs)
  models/                # e.g. token enums
  screens/               # Feature screens (wallet, PIN, restore, …)
  uikit/                 # Shared theme and widgets
assets/
  translations/          # en.json, ru.json
  coins/, svg/, other/   # Images and vectors
```

## Localization

Locales are defined in `main.dart` (`en`, `ru`). Translation files live under `assets/translations/`.

## Disclaimer

**Trust Wallet** is a trademark of its respective owners. This repository is for learning purposes only. Do not use it to manage real funds unless you fully understand the security implications of your own implementation.