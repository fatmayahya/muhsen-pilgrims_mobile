# Muhsen Pilgrims – Mobile Application

## Overview

**Project name:** `muhsen-pilgrims_mobile`

Muhsen Pilgrims is a mobile application designed to support **Hajj pilgrims throughout their entire journey**.  
The app provides itinerary guidance, service ordering, support ticketing, and structured feedback, ensuring **clear communication, reliable assistance, and a smooth pilgrimage experience** from arrival until completion.

The application is built with scalability, maintainability, and clarity in mind using modern Flutter best practices.

---

## Supported Platforms
- Android
- iOS

---

## Tech Stack

- **Framework:** Flutter
- **Flutter Version:**
Flutter 3.38.5 • channel stable
Dart 3.10.4

markdown
Copy code
- **State Management:** BLoC (`flutter_bloc`)
- **Architecture:** Clean Architecture (feature-first)
- **Networking:** Dio
- **Routing:** go_router
- **Dependency Injection:** get_it
- **Testing:** flutter_test, bloc_test
- **CI/CD:** GitHub Actions

---

## Architecture

The project follows **Clean Architecture** with a **feature-first structure** to ensure long-term scalability, testability, and separation of concerns.

### Architectural Principles
- UI contains **no business logic**
- BLoCs depend only on **use cases**
- Use cases depend on **repository contracts**
- Data layer implements repositories using APIs or local sources
- Shared logic lives in `core`

---

## BLoC Guidelines

- One BLoC **per screen or business flow**
- Events represent **user or system intent**
- States represent **UI states only**
- No API or platform calls inside BLoCs
- Shared/global BLoCs (e.g. session, app state) belong in `core`

---

## Git Workflow

- **Main branch:** `main`
- All work is done on **feature branches**
- Pull Requests are required before merging into `main`
- `main` is always stable and buildable

---

## CI/CD Overview

CI/CD is configured for validation and artifact generation only.

### Pull Requests to `main`
- Flutter analyze
- Flutter test

### Push / Merge to `main`
- Flutter analyze
- Flutter test
- Build artifacts:
  - Android APK
  - Android AAB
  - iOS build (without code signing)

---

## Running the Project Locally

### Prerequisites
- Flutter SDK installed
- Android Studio / Xcode configured
- Emulator or physical device

### Install dependencies
```bash
flutter pub get
```

### Run the app
```bash
flutter run
```

### Testing
```bash
flutter test
```

---

## License & Usage

This project is private and confidential.
All rights are reserved to the project stakeholders.
Unauthorized use, distribution, or modification is not permitted.