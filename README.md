
# Sandwich Shop App

A small Flutter demo app for counting and configuring sandwich orders. The app demonstrates a simple stateful UI with quantity controls, sandwich size toggle (six-inch / footlong), bread selection, and an order note input.

> Note: This project was scaffolded for learning/demo purposes. It focuses on UI/state handling and does not include backend persistence or payment flows.

## Key Features

- Increment and decrement sandwich quantity with max/min limits.
- Toggle between six-inch and footlong sandwich sizes.
- Choose a bread type from a dropdown (white, wheat, wholemeal).
- Add an order note (example: "no onions").
- Simple visual display of sandwiches using emoji and live-updating UI.

## Installation & Setup

Prerequisites

- Flutter SDK (>= stable channel). See: https://flutter.dev/docs/get-started/install
- Platform tools for your target (Android SDK, Xcode for iOS, or desktop toolchains for Windows/macOS/Linux).
- Git

Clone the repository

```powershell
git clone https://github.com/WoodhouseA/sandwich_shop.git
cd sandwich_shop
```

Install dependencies

```powershell
flutter pub get
```

Run the app

- Run on an available device (Android emulator, iOS simulator, or desktop):

```powershell
flutter run
```

- To run on Windows (desktop):

```powershell
flutter run -d windows
```

Notes about configuration

- The visible maximum order quantity is set at app startup. In `lib/main.dart` the `OrderScreen` is instantiated with `maxQuantity: 5`. You can adjust that number or rely on the default `OrderScreen(maxQuantity)` parameter.

## How to Use

Open the app and you'll see:

- Current order display (quantity, bread type, sandwich size and notes).
- A size toggle (six-inch / footlong) implemented with a `Switch`.
- A dropdown to select bread type.
- A notes text field for order notes.
- `Add` and `Remove` buttons to change quantity (subject to min/max limits).

Typical flows

- Increase quantity: press the green Add button until the maximum (configurable) is reached.
- Decrease quantity: press Remove until the quantity reaches 0.
- Change size: flip the Switch between "six-inch" and "footlong".
- Change bread: select from the dropdown menu.
- Add a note: type into the notes field; it updates the order display live.

Running tests

This repo contains a `test/` folder. Run all tests with:

```powershell
flutter test
```

## Project Structure

Top-level layout (important files/folders):

- `lib/main.dart` — The main app entry. Contains `OrderScreen`, UI widgets, and wiring. (Key: `OrderScreen(maxQuantity: 5)`).
- `lib/repositories/order_repository.dart` — Simple repository that manages the order quantity and max limit.
- `lib/views/app_styles.dart` — Shared text styles used by the UI.
- `pubspec.yaml` — Flutter project manifest and dependency list.
- `test/` — Unit tests (if present) for repositories and views.

You can inspect and extend these files to add new behavior, persistence, or network-backed order submission.

## Technologies & Dependencies

- Flutter (Dart)
- Uses core Flutter widgets only (no third-party packages required in current codebase).

## Known Limitations & Future Improvements

- No persistence: orders are kept in memory and lost on restart.
- No backend: there's no order submission, authentication, or payment flow.
- Basic styling: the UI is intentionally simple and intended for demonstration.

Planned / suggested improvements

- Persist orders locally (SQLite / shared_preferences).
- Add an order confirmation screen and submit to a backend API.
- Add images for bread types and better visual design.
- Add integration tests and widget tests for UI flows.

## Contribution

Contributions are welcome. Suggested workflow:

1. Fork the repository.
2. Create a feature branch (e.g., `feature/persistent-orders`).
3. Add tests for new behavior.
4. Open a pull request describing your changes.

Please follow the existing code style and add unit tests where appropriate.

## Contact

- Owner: WoodhouseA (GitHub) — https://github.com/WoodhouseA