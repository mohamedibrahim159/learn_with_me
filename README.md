

# Project: Learn With Me - Educational App for Kids

## Project Status

-   **Code Refactoring:** All screens in the application have been adjusted to match the new design.
-   **Code Cleanup:** Unnecessary code has been removed.
-   **Firebase Removal:** All Firebase services have been removed.
-   **Backend API Ready:** The application is now ready to work with a backend API without Firebase.
-   **Authentication Screens:** Login, registration, forgot password, and reset password screens have been prepared for integration with a backend API.
-   **App Structure:** The main structure of the application has been built with main sections such as (Home, Letters, Numbers, Animals, Stories, For Parents, For Learners).
-   **Placeholders:** Placeholders for images and audio have been added across different screens.

## Project Description

The **Learn With Me** app is designed to provide educational content for children in an engaging and interactive way. It focuses on teaching fundamental concepts like letters, numbers, animals, and stories. The application is built with a user-friendly interface that caters to both learners and parents, offering content in both Arabic and English.

## Features

-   **Educational Content Sections:**
    -   Letters
    -   Numbers
    -   Animals
    -   Stories
-   **User Sections:** Distinct sections for "For Parents" and "For Learners".
-   **Audio Content:** Ready for integration with external APIs for fetching audio content.
-   **Responsive UI:** Designed to work on all screen sizes (phones, tablets).
-   **Backend Ready:** The application is now ready to work with a backend API without Firebase.
-   **State Management:** Employs BLoC/Cubit for state management.
-   **Clean Architecture:** Adheres to Clean Architecture principles.

## What We Need

-   **Backend API Information:**
    -   API endpoints.
    -   Description of data sent and received for each endpoint.
    -   Authentication method.
-   **Database Information:**
    -   Database schema.

## Getting Started

### Prerequisites

*   Flutter SDK installed.
*   Dart SDK installed.
*   Android Studio or Xcode (for iOS) installed.
*   Firebase project set up.

### Installation

1.  **Clone the Repository:**
    

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