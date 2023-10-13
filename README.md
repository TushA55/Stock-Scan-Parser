# Stock Scan Parser

Fitpage case study for parsing stock scans.

## Demo

https://github.com/TushA55/Stock-Scan-Parser/assets/49338787/10f0be6f-cca6-4cc4-ae02-22c26795f5e1

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

