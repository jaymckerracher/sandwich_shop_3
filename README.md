# Sandwich Shop App

A simple Flutter application for placing sandwich orders, designed as a learning project. Users can select bread type, sandwich size, and quantity, and add notes to their order.

## Features

- Select sandwich type (footlong or not)
- Choose bread type (white, wheat, wholemeal)
- Set sandwich quantity (with max limit)
- Add order notes
- Responsive UI with Material Design
- State management using repository pattern

---

## Installation and Setup

### Prerequisites

- **OS:** macOS, Windows, or Linux
- **Flutter SDK:** >=2.17.0 <4.0.0 ([Install Flutter](https://docs.flutter.dev/get-started/install))
- **Dart SDK:** Included with Flutter
- **Git:** For cloning the repository

### Clone the Repository

```bash
git clone https://github.com/jaymckerracher/sandwich_shop_3
cd sandwich_shop_3
```

### Install Dependencies

```bash
flutter pub get
```

### Run the App

```bash
flutter run
```

---

## Usage

- Launch the app.
- On the main screen, select your sandwich options:
	- **Sandwich Type:** Toggle between footlong and regular.
	- **Bread Type:** Choose from white, wheat, or wholemeal.
	- **Quantity:** Use + and - buttons (up to the max allowed).
	- **Notes:** Add any special instructions.
- Press the order button to place your order.

### Running Tests

```bash
flutter test
```

---

## Project Structure

```
lib/
	main.dart                # App entry point and main UI
	repositories/
		order_repository.dart  # Business logic for order state
	views/
		app_styles.dart        # App-wide text styles
test/
	repositories/
		order_repository_test.dart # Unit tests for order logic
```

### Key Packages

- `flutter`
- `cupertino_icons`
- `flutter_test` (dev)

---

## Known Issues / Future Improvements

- No persistent storage for orders
- No backend integration
- UI is basic; could be improved with images and animations

### Contribution Guidelines

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Open a pull request

---

## Contact Information
- Jay