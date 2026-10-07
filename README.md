# SEMO Wallet

SEMO Network's edition of the open-source **SEEDS Light Wallet** — a Flutter wallet and explorer for the
SEEDS regenerative economy on the Telos blockchain.

This is a friendly fork of [JoinSEEDS/seeds_light_wallet](https://github.com/JoinSEEDS/seeds_light_wallet)
(MIT). It keeps the SEEDS chain, contracts and token untouched and re-skins the app to the
[SEMO Network](https://semo.network) brand. Learn more about SEEDS on SEMO at
[seeds.semo.network](https://seeds.semo.network).

## What changed from upstream

| Area | Upstream (SEEDS) | SEMO Wallet |
|---|---|---|
| App name | SEEDS Wallet | SEMO Wallet |
| Palette | forest greens (`#0F2617`, `#1F992A`) | SEMO ink / tide / sky / mist (`#0A1C2A`, `#2E9CC7`, `#7FCDEB`, `#CDE9F4`) |
| Typeface | SF Pro Display (bundled) | Roboto (bundled, Apache 2.0) |
| App icons | SEEDS flower | SEMO ring on ink |
| Splash screens | SEEDS lotus | SEMO ring + wordmark (Android + iOS) |
| Login / app bar marks | SEEDS wordmark and flower | SEMO ring and wordmark |
| "Buy Seeds" link | joinseeds.earth | seeds.semo.network/participate |
| CI | Flutter 3.0.1, actions v1 | Flutter 3.24.5, actions v4 |

The colour identifiers in `lib/design/app_colors.dart` keep their upstream names (`green1`, `darkGreen2`, …)
so that the hundreds of call sites did not need to change — only the values are SEMO's. Chain ID, contract
names, endpoints and the SEEDS currency icon are unchanged.

## Getting started

Requirements: **Flutter 3.24.x** (the `pubspec.yaml` SDK constraint is `<3.6.0`, so newer Flutter releases
will refuse to resolve). Install it from https://docs.flutter.dev/release/archive.

```bash
git clone https://github.com/Blaineeey/semo-seeds-wallet.git
cd semo-seeds-wallet
cp .env.example .env        # fill in PAYCPU_SEEDS_KEY and ONBOARDING_SEEDS_KEY
flutter pub get
flutter run
```

Set your editor line length to 120; the remaining rules live in `analysis_options.yaml`.

## Build

```bash
flutter build appbundle     # Android — upload to Google Play
flutter build ios           # iOS — then archive & upload from Xcode as usual
```

## Before publishing under SEMO

The fork still carries the upstream identifiers so that it builds against the existing Firebase config.
To ship it as a separate app you must:

1. **Change the app IDs** — `applicationId` in `android/app/build.gradle` (and the `package` in
   `AndroidManifest.xml`), `PRODUCT_BUNDLE_IDENTIFIER` in `ios/Runner.xcodeproj`, plus
   `androidPacakageName` / `iosBundleId` in `lib/domain-shared/app_constants.dart`.
2. **Create your own Firebase project** and replace `android/app/google-services.json` and
   `ios/Runner/GoogleService-Info.plist`. The app uses Remote Config (chain endpoints and feature flags),
   Cloud Messaging, Firestore, Storage and App Installations.
3. **Invite / deep links** — `domainAppUriPrefix` and the `joinseeds.com` target links in
   `app_constants.dart` are Firebase Dynamic Links owned by JoinSEEDS. Dynamic Links was shut down by
   Google in August 2025, so plan a replacement (App Links / Universal Links on `semo.network`).
4. **Signing** — provide your own Android keystore and iOS provisioning profiles; `upload_android.sh` and
   `upload_ios_build.sh` reference the upstream store accounts.
5. **Privacy policy** — `docs/seeds_privacy_policy.html` is the SEEDS policy; publish a SEMO one.

## Keeping up with upstream

```bash
git remote add upstream https://github.com/JoinSEEDS/seeds_light_wallet.git   # once
git fetch upstream
git merge upstream/master
```

Branding lives in a small set of files (`lib/design/`, `assets/images/login/`, `assets/images/semo_mark.png`,
launcher icons, splash screens, `pubspec.yaml` fonts), so merges are usually clean.

## License

MIT — see [LICENSE](LICENSE). Original work © 2021 SEEDS - Conscious Currency | Regenerative Civilization.
SEMO branding assets © SEMO Network. Roboto is © Google, Apache License 2.0.
