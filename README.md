# Sandwich Shop

This is a simple Flutter app that allows users to order sandwiches.
The app is built using Flutter and Dart, and it is designed primarily to be run in a web
browser.

## Install the essential tools

1. **Terminal**:

    - **macOS** – use the built-in Terminal app by pressing **⌘ + Space**, typing **Terminal**, and pressing **Return**.
    - **Windows** – open the start menu using the **Windows** key. Then enter **cmd** to open the **Command Prompt**. Alternatively, you can use **Windows PowerShell** or **Windows Terminal**.

2. **Git** – verify that you have `git` installed by entering `git --version`, in the terminal.
    If this is missing, download the installer from [Git's official site](https://git-scm.com/downloads?utm_source=chatgpt.com).

3. **Package managers**:

    - **Homebrew** (macOS) – verify that you have `brew` installed with `brew --version`; if missing, follow the instructions on the [Homebrew installation page](https://brew.sh/).
    - **Chocolatey** (Windows) – verify that you have `choco` installed with `choco --version`; if missing, follow the instructions on the [Chocolatey installation page](https://chocolatey.org/install).

4. **Flutter SDK** – verify that you have `flutter` installed and it is working with `flutter doctor`; if missing, install it using your package manager:

    - **macOS**: `brew install --cask flutter`
    - **Windows**: `choco install flutter`

5. **Visual Studio Code** – verify that you have `code` installed with `code --version`; if missing, use your package manager to install it:

    - **macOS**: `brew install --cask visual-studio-code`
    - **Windows**: `choco install vscode`

## Get the code

### If this is your first time working on this project

Enter the following commands in your terminal to clone the repository and
open it in Visual Studio Code.
You may want to change directory (`cd`) to the directory where you want to clone the
repository first.

```bash
git clone --branch 8 https://github.com/manighahrmani/sandwich_shop
cd sandwich_shop
code .
```

### If you have already cloned the repository

Enter the following commands in your terminal to switch to the correct branch.
Remember to `cd` to the directory where you cloned the repository first.

```bash
git fetch origin
git checkout 8
```


## Run the app on a real iPhone

You can run the app on your own iPhone using a free Apple ID for development purposes:

1. Open the project in Xcode (`ios/Runner.xcworkspace`).
2. Connect your iPhone to your Mac.
3. In Xcode, select your device as the build target.
4. Go to the Runner target > Signing & Capabilities, select your Apple ID/team, and let Xcode manage signing.
5. Build and run the app on your device. You may need to trust the developer profile in your iPhone's Settings > General > Device Management.

**Note:** With a free Apple ID, the app can only be installed on your device, and you may need to re-sign it every 7 days. This does not allow distribution to other users or the App Store.

## Creating a release build (iOS)

You can create a release build using:

```bash
flutter clean
flutter pub get
flutter build ios --release
```

This generates a release build in `build/ios/iphoneos/Runner.app`.

**Limitations:**

- Without a paid Apple Developer account, you cannot create a signed IPA for distribution or upload to the App Store/TestFlight.
- The release build cannot be installed on real devices or distributed to others.
- You can still provide screenshots or the build artifact as evidence for coursework.

## Run the app normally

Open the integrated terminal in Visual Studio Code by first opening the Command
Palette with **⌘ + Shift + P** (macOS) or **Ctrl + Shift + P** (Windows) and
typing **Terminal: Create New Terminal** then pressing **Enter**.

In the terminal, run the following commands to install the dependencies and run
the app in your web browser:

```bash
flutter pub get
flutter run
```


## Testing

You can test the app using Flutter's built-in testing tools:

- **Widget and unit tests:**

    Run all widget and unit tests in the `test/` directory with:
    ```bash
    flutter test
    ```

- **Integration tests:**

    Run integration tests in the `integration_test/` directory on an emulator, simulator, or real device with:
    ```bash
    flutter test integration_test
    ```
    Or, to run on a real iPhone:
    1. Connect your device and trust your developer profile.
    2. Run:
         ```bash
         flutter test integration_test/
         ```
    (You may need to create a `test_driver/integration_test.dart` file if it does not exist.)

## Get support

Use [the dedicated Discord channel](https://discord.com/channels/760155974467059762/1370633732779933806)
to ask your questions and get help from the community.
Please provide as much context as possible, including the error messages you are seeing and
screenshots (you can open Discord in your web browser).
