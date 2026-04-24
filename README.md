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
    dart run build_runner build --delete-conflicting-outputs
    ```

    For development, you can use `watch` to automatically regenerate code when files change:

    ```bash
    dart run build_runner watch
    ```

2.  **Run the app:**

    You can run the app using simple command:

    ```bash
    flutter run
    ```

    > **Note for Reviewers:** To simplify the evaluation process, the `BASE_URL` is configured with a **default fallback value** (pointing to the dev API). While using `--dart-define-from-file` is the best practice for managing environment-specific configurations (Production/Staging), the app will work out-of-the-box for this review.

    If you wish to test with specific environment files:

    Create files at the project root:

    ```json
    // dev.json
    { "BASE_URL": "https://api.example.com" }
    ```

    ```json
    // prod.json
    { "BASE_URL": "https://api.example.com" }
    ```

    **Development:**

    ```bash
    flutter run --dart-define-from-file=dev.json
    ```

    **Production:**

    ```bash
    flutter run --dart-define-from-file=prod.json
    ```

    #### Environment Variables
    - `BASE_URL`: The base URL for the REST API endpoint.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
