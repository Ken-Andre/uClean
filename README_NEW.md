# uClean Kim 🧹

**uClean Kim** is an open-source Flutter application designed to help administrators manage and export data for school cleaning tasks.

## ✨ Features

- **Task Management**: Create, edit, and track cleaning tasks
- **Data Export**: Export cleaning task data for reporting
- **User-Friendly Interface**: Clean and intuitive admin dashboard
- **Offline Support**: Works without internet connectivity
- **Multi-language Support**: Available in multiple languages

## 🚀 Getting Started

This section guides you through downloading, installing, and running the uClean Kim application.

### Prerequisites

* **Flutter**: Download and install Flutter from the official website: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
* **Code Editor**: Choose your preferred code editor like Visual Studio Code (VS Code) or Android Studio.
* **Version**: Dart SDK Version 3.0.0 or greater. Flutter SDK Version 3.24.0 or greater.

### Installation Steps

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Ken-Andre/uClean.git
   cd uClean
   ```

2. **Install Dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the App:**
   ```bash
   flutter run
   ```

## 📱 Deployment

### Android Play Store

See [PLAY_STORE_DEPLOYMENT_GUIDE.md](PLAY_STORE_DEPLOYMENT_GUIDE.md) for detailed instructions on publishing to Google Play Store.

## 🛠️ Development

### Project Structure

```
.
├── android                         - Android platform files
├── assets                          - Images, fonts, and animations
├── ios                             - iOS platform files
├── lib                             - Main application code
│   ├── core                        - Core utilities and services
│   ├── data                        - Data models and repositories
│   ├── presentation                - UI screens and widgets
│   ├── routes                      - Navigation configuration
│   ├── theme                       - App styling and themes
│   └── widgets                     - Reusable UI components
├── .github                         - GitHub workflows and templates
└── README.md                       - Project documentation
```

### Libraries and Tools Used

- **Flutter Bloc**: State management
- **Dio**: HTTP client for API calls
- **Shared Preferences**: Local data storage
- **Permission Handler**: Runtime permissions
- **Cached Network Image**: Image caching
- **Flutter SVG**: SVG support
- **Lottie**: Animation support

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you have any problems or questions, go to our Discord channel: https://discord.gg/ccHnFFCYur

## 📋 Changelog

### Version 1.0.19
- Updated dependencies to latest versions
- Improved Android API target to 35
- Enhanced build configuration
- Added CI/CD pipeline
- Prepared for Google Play Store deployment

---

Made with ❤️ by the uClean Kim team
