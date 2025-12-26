---
description: Run the MERIDIEN Flutter frontend
allowed-tools: Bash
---

Run the MERIDIEN Flutter frontend application.

Steps:
1. Navigate to the frontend directory
2. Get dependencies if needed
3. Run the Flutter web application

Commands:
```bash
cd /media/muhammad/Work/Identity/BM/MERIDIEN/frontend
flutter pub get
flutter run -d chrome
```

For specific device:
- Chrome: `flutter run -d chrome`
- Edge: `flutter run -d edge`
- Android: `flutter run -d android`
- iOS: `flutter run -d ios`
