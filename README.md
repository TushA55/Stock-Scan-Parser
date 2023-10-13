# Stock Scan Parser

Fitpage case study for parsing stock scans.

## Demo

https://github.com/TushA55/Stock-Scan-Parser/assets/49338787/10f0be6f-cca6-4cc4-ae02-22c26795f5e1

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/TushA55/Stock-Scan-Parser.git
```

### 2. Install the dependencies

```bash
flutter pub get
```

### 3. Run the app

```bash
flutter run
```

## Running the tests

```bash
flutter test
```

## Project Structure

This project follows the Clean Architecture principles and is separated in the following modules:

```
lib/
  config/
    routes/
    theme/
  core/
    constants/
    resources/
    usecases/
    util/
  features/
    dashboard/
      data/
        data_sources/
        models/
        repository/
      domain/
        entities/
        repository/
        usecases/
      presentation/
        bloc/
        pages/
        widgets/
injection_container.dart
main.dart
```

## Dependencies

- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Flutter Widgets that make it easy to implement the BLoC (Business Logic Component) design pattern.

- [equatable](https://pub.dev/packages/equatable) - Being able to compare objects in `Dart` often involves having to override the `==` operator. This is tedious and error-prone. `Equatable` helps to simplify this process.

- [get_it](https://pub.dev/packages/get_it) - This is a simple `Service Locator` for `Dart` and `Flutter` projects.

- [retrofit](https://pub.dev/packages/retrofit) - Retrofit is a type-safe HTTP client for `Dart` and `Flutter`. It makes it easy to consume `JSON` or `XML`-based web services in `Dart`.

- [dio](https://pub.dev/packages/dio) - A powerful `Dart` Http client for `Dart`, which supports Interceptors, Global configuration, FormData, Request Cancellation, File downloading, Timeout etc.

## Built With
- [Flutter](https://flutter.dev/) - Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.