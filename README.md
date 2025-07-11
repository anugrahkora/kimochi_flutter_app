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
git clone https://github.com/anugrahkora/kimochi_flutter_app.git
cd kimochi_flutter_app
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
├── app/
│   ├── main_app.dart             
│   └── router.dart                
│
├── core/
│   ├── constants/
│   │   └── app_constants.dart     
│   └── providers/
│       └── providers.dart         
│
├── services/
│   └── network_service.dart     
│
├── features/
│   ├── details/
│   │   └── view/
│   │       └── details_view.dart 
│   └── home/
│       ├── view/
│       │   └── home_view.dart   
│       └── view_model/
│           └── home_view_model.dart  
│
├── models/
│   └── university.dart           
│
├── repositories/
│   └── university_repository.dart 
│
└── main.dart                 

app/ – App initialization logic (router, root widget)

core/ – Common constants and providers used app-wide

services/ – App-level services like API/network

features/ – Feature-specific views and logic (e.g., home, details)

models/ – Data model classes

repositories/ – Data abstraction and communication layer

main.dart – App entry point

## Security & Error Handling
- Input validation for country search
- error messages for failed network calls
- Null-safety enabled across the project