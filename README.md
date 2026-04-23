# posts_app

A new Flutter project.

## Technologies Used

- **Flutter:** The UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.
- **Riverpod:** A state management and dependency injection solution that simplifies provider management.
- **Dio:** A powerful HTTP client for Dart, used for making network requests to the backend API.
- **GoRouter:** A declarative routing package for Flutter, simplifying navigation.
- **JSON Serializable/Annotation:** For automatic JSON serialization and deserialization of Dart objects.

## Getting Started

### Prerequisites

- Flutter SDK: `^3.41.4`
- Dart SDK: `^3.11.1`

### Prerequisites

- Flutter SDK installed
- Dart SDK installed

### Installation

1.  Clone the repository:

    ```bash
    git clone https://github.com/DinoZenka/posts_app.git
    cd posts_app
    ```

2.  Install project dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

To run the application on a connected device or emulator, you need to perform the following steps:

1.  **Generate code:** Run the build runner to generate necessary code for Riverpod and JSON serialization.

    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

    For development, you can use `watch` to automatically regenerate code when files change:

    ```bash
    flutter pub run build_runner watch
    ```

2.  **Run the app:**
    ```bash
    flutter run
    ```

This will build and launch the app.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
