# Stock Scan Parser

Fitpage case study for parsing stock scans.

## Demo

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

