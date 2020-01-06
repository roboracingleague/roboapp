# Getting Started

For help getting started with Flutter, view the online
[documentation](https://flutter.dev/).

## Running the app

The application can start with different modes :
* __dev__: 
* __qa__: 
* __prod__: will run the application by targeting the production ecosystem 

Note that switching between flavors requires running `flutter clean` to clean the app build files.

### Command line

To run the app use the following command by specifying the `mode` _(dev, qa, prod)_:

```
flutter run --flavor <mode> --target lib/main_<mode>.dart
```

example: `flutter run --flavor dev --target lib/main_dev.dart`

### IntelliJ / Android Studio

The project comes with some runs configuration but if you want to make your own, here's how:

Edit the running configurations for the project and set the values according to the `mode` you want to run _(dev, qa, prod)_:
* Dart entrypoint: the path to the `main_{mode}.dart` file (example: `lib/main_dev.dart`) 
* Build flavor: `{mode}` (example: `dev`)
* Before Launch : `:clean` Gradle task