---
description: Generate Freezed models for Flutter
allowed-tools: Bash
---

Generate Freezed model code for Flutter.

This command runs build_runner to generate:
- `.freezed.dart` files for immutable models
- `.g.dart` files for JSON serialization

```bash
cd /media/muhammad/Work/Identity/BM/MERIDIEN/frontend
flutter pub run build_runner build --delete-conflicting-outputs
```

Watch mode (auto-regenerate on changes):
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

After generation, verify no errors:
```bash
flutter analyze
```
