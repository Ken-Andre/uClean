# ucleankim

**uClean** is an open-source Flutter application designed to help a school to collect trips related to their for carbon footprint evaluation.

### Table of contents
- [Getting Started](#getting-started)
- [System requirements](#prerequisites)
- [Application structure](#application-structure)
- [Libraries and tools used](#libraries-and-tools-used)
- [Support](#support)
### Getting Started

This section guides you through downloading, installing, and running the ucleankimAdmin application.

### Prerequisites:

* **Flutter**: Download and install Flutter from the official website: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
* **Code Editor**: Choose your preferred code editor like Visual Studio Code (VS Code) or Android Studio.
* **Version**:Dart SDK Version 3.3.0 or greater. Flutter SDK Version 3.3.0 or greater.
* **Steps:**

1. **Clone the Repository:**
   Open your terminal and navigate to your desired project directory. Then, clone the ucleankimAdmin repository using the following command:

    ```bash
    git clone https://github.com/Ken-Andre/uclean.git
    ```


2. **Install Dependencies:**
   Navigate to the project directory using the `cd` command in your terminal. Then, run the following command to install the required dependencies:

    ```bash
    flutter pub get
    ```

3. **Run the App:**
   Connect your device or start an emulator. Finally, run the application using the following command:

    ```bash
    flutter run
    ```

**Additional Notes:**

* Ensure your device or emulator is connected and configured properly with Flutter.
* Refer to the Flutter documentation for detailed setup instructions: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
* If you encounter any issues during installation or running the app, consult the project's troubleshooting guide (if available) or seek help from the Flutter community forums.

[//]: # (### Features)

[//]: # ()
[//]: # (* **Task Creation and Management:** Add, edit, and delete tasks with detailed descriptions, priorities, and deadlines.)

[//]: # (* **Progress Tracking:** Mark tasks as completed and track your progress over time.)

[//]: # (* **Categories and Filters:** Organize your tasks by categories and use filters to display the most important tasks.)

[//]: # (* **Reminders and Notifications:** Receive notifications for upcoming tasks and never miss a deadline.)

[//]: # (* **Customizable Themes:** Personalize the application's appearance with different themes.)

### Application Structure

```
.
├── android                         - It contains files required to run the application on an Android platform.
├── assets                          - It contains all images and fonts of your application.
├── ios                             - It contains files required to run the application on an iOS platform.
├── lib                             - Most important folder in the application, used to write most of the Dart code..
    ├── main.dart                   - Starting point of the application
    ├── core
    │   ├── app_export.dart         - It contains commonly used file imports
    │   ├── constants               - It contains static constant class file
    │   └── utils                   - It contains common files and utilities of the application
    ├── presentation                - It contains widgets of the screens 
    ├── routes                      - It contains all the routes of the application
    └── theme                       - It contains app theme and decoration classes
    └── widgets                     - It contains all custom widget classes
```

### Libraries and Tools Used

- BLoC - State management
  https://bloclibrary.dev
- cached_network_image - For storing internet image into cache
  https://pub.dev/packages/cached_network_image

### Support

If you have any problems or questions, go to our Discord channel, where we will help you as quickly as possible: https://discord.gg/ccHnFFCYur

### Contributions

See the [contributions.md](contributions.md). If you want too to contribute, make a pull request and maintainers will see and make a decision.
