
# Learn With Me

**Learn With Me** is an engaging educational application built with Flutter, designed specifically for children. Our mission is to provide a fun and interactive learning environment that supports both Arabic and English languages. This app uses Clean Architecture to ensure maintainability and scalability and is integrated with Firebase for user authentication.

## Features

-   Interactive educational content.
-   Support for Arabic and English.
-   Firebase-based user authentication.
-   Clean Architecture for a structured codebase.

## Installation

-   **Clone the Repository:**
    

-   **Domain:** Core business logic and entities.
-   **Data:** Data sources (local, remote) and repository implementations.
-   **Presentation:** UI, state management (BLoC/Cubit), and widgets.

## Dependencies

-   `flutter_bloc`: For BLoC/Cubit state management.
-   `equatable`: For value-based equality in entities.
-   `get_it`: For service location and dependency injection.
-   `firebase_core`: For Firebase integration.
-   `firebase_auth`: For Firebase Authentication.
-   `intl`: For localization.

## Project Structure
```
lib/
├── core/              # Core components (constants, errors, use cases)
├── data/              # Data layer (datasources, models, repositories)
├── domain/            # Domain layer (entities, repositories, use cases)
├── presentation/      # Presentation layer (UI, blocs, widgets)
└── main.dart         # App entry point
test/                 # tests folder
assets/               # assets folder (images, localization)
├── ar
└── en
README.md             # Project documentation
pubspec.yaml          # Project dependencies
```
## Running the Project

1.  **Clone the repository:**
```
bash
    git clone <repository_url>
    
```
2.  **Navigate to the project directory:**
```
bash
    cd learn_with_me
    
```
3. **Install dependencies**:
```
bash
     flutter pub get
    
```
4.  **Run the app:**
```
bash
    flutter run
    
```
## Firebase Setup

1. Create a Firebase project in the Firebase console.
2. Add a new Android app to your project and follow the instructions to add the `google-services.json` file to your project (android/app).
3. Add a new IOS app to your project and follow the instructions to add the `GoogleService-Info.plist` file to your project (ios/Runner).
4. Enable Anonymous authentication in Firebase console.

## Localization

1.  The app supports Arabic (ar) and English (en).
2.  Localization files will be located in `assets/ar` and `assets/en`.

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

[Specify your license here]