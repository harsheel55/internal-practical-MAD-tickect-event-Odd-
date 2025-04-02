# Event Ticketing App

A Flutter-based Event Ticketing Application with QR code generation and scanning capabilities. This app allows users to purchase, manage, and transfer event tickets with offline validation support.

## Features

- **QR Code Generation**: Dynamic QR codes for each ticket with unique event IDs
- **Ticket Validation**: Offline ticket validation via cached data
- **Ticket Transfer**: Transfer tickets to other users via deep links
- **Firebase Integration**: Secure ticket storage and management
- **Camera Support**: QR code scanning for ticket validation
- **Offline Support**: Access tickets without internet connection
- **Modern UI**: Material Design 3 with responsive layout

## Screenshots

[Add your app screenshots here]

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Firebase account and project setup
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone https://github.com/harsheel55/internal-practical-MAD-tickect-event-Odd-.git
```

2. Navigate to the project directory:
```bash
cd internal-practical-MAD-tickect-event-Odd-
```

3. Install dependencies:
```bash
flutter pub get
```

4. Configure Firebase:
   - Create a new Firebase project
   - Add your Android/iOS app to the Firebase project
   - Download and add the configuration files:
     - `google-services.json` for Android
     - `GoogleService-Info.plist` for iOS

5. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── screens/              # App screens
│   ├── home_screen.dart
│   ├── event_details_screen.dart
│   ├── ticket_screen.dart
│   ├── qr_scanner_screen.dart
│   ├── ticket_transfer_screen.dart
│   └── profile_screen.dart
└── widgets/              # Reusable widgets
    └── event_card.dart
```

## Features Implementation

### QR Code Generation
- Uses `qr_flutter` package for QR code generation
- Each ticket has a unique QR code containing ticket and event information

### Offline Storage
- Implements local storage using `shared_preferences` and `sqflite`
- Caches ticket data for offline validation

### Ticket Transfer
- Supports multiple transfer methods:
  - Email transfer
  - QR code transfer
  - Deep link sharing

### Firebase Integration
- Stores ticket data in Cloud Firestore
- Handles user authentication
- Manages ticket transactions

## Dependencies

- `firebase_core`: ^2.24.2
- `firebase_auth`: ^4.15.3
- `cloud_firestore`: ^4.13.6
- `qr_flutter`: ^4.1.0
- `qr_code_scanner`: ^1.0.1
- `shared_preferences`: ^2.2.2
- `sqflite`: ^2.3.0
- `uni_links`: ^0.5.1
- `share_plus`: ^7.2.1
- `permission_handler`: ^11.1.0

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Author

- **Your Name** - [GitHub Profile](https://github.com/harsheel55)

## Acknowledgments

- Flutter team for the amazing framework
- Firebase for backend services
- All package contributors
