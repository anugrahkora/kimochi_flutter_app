#  Global University Search + User Profile App

A simple Flutter application that allows users to search for universities by country, view university details, and access a mock user profile. This project demonstrates modern Flutter development using **MVVM architecture**, **Riverpod** for state management, and **GoRouter** for navigation.

---

##  Features

###  Home Screen
- Mock user profile display (name and icon)
- Country input via TextField
- Search button to fetch universities
- List of universities showing:
  - University name
  - Country flag (using country code)
  - Website (clickable, opens in browser)

### Detail Screen
- Displays university details:
  - Name
  - Country
  - Website (clickable)

---

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code
- Internet connection (for fetching API data)

### 🔧 Setup Instructions
```bash
git clone https://github.com/your-username/university-search-app.git
cd university-search-app
flutter pub get
flutter run
```
#  Tech Stack: 

## Architecture
- **Design Pattern**: MVVM (Model-View-ViewModel)
- **Repository Pattern**: For abstracting data layer

##  State Management
- **Riverpod**: Robust and testable state management with `Provider`, `FutureProvider`, and `StateNotifierProvider`.

##  Routing
- **GoRouter**: Declarative and nested routing setup with deep link support.

## Project Structure
lib/
│
├── models/
│   └── university.dart 
│
├── services/
│   └── network_service.dart
│
├── repositories/
│   └── university_repository.dart
│
│
└── main.dart 

## Security & Error Handling
- Input validation for country search
- Graceful error messages for failed network calls
- Null-safety enabled across the project