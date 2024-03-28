# multiplatform_app_crud

### 1. Application Usage

Flutter CRUD application a user data resource in Accurate

##### Viewing User List

- Open the application and go to the main page.
- On the main page, you will see a list of users who have been registered.
- Scroll down to see the entire list of users.

##### Searching for a Desired User

- On the main page, you will see a search bar at the top or bottom of the user list.
- Type the name or part of the user's name you want to search for.
- The user list will automatically filter according to the keyword you entered.

##### Sorting Users by Name

- On the main page, find the button or icon indicating sorting (such as an arrow pointing up or down).
- Tap the button or icon to sort the user list by name, from A-Z or Z-A.

##### Filtering Users by City

- On the main page, click the button in the top right corner to select filters that leads to the dropdown list of cities.
- Tap the menu or button, then click apply
- Select the city you want from the list of available cities.
- The user list will automatically filter based on the city you selected.

##### Adding a New User

- On the main page, tap the user_add icon in the bottom right corner, then fill in the available form with the new user's information (name, address, email, phone number, city).
- After filling out the form, press the Submit button to add the new user to the list.

### 2. Technology dependency used

A few resources to get you started if this is your first Flutter project:

- [bloc_concurrency](https://pub.dev/packages/bloc_concurrency): ^0.2.0
  This package is used to manage concurrency in BLoC (Business Logic Component) in Flutter applications. It allows for better control over how and when a command is executed in the BLoC.
- [cupertino_icons](https://pub.dev/packages/cupertino_icons): ^1.0.2
  This package contains icons used in the Cupertino (iOS) design style for Flutter. It provides easy access to icons commonly used in iOS applications.
- [dartz](https://pub.dev/packages/dartz): ^0.10.0-nullsafety.2
  This package provides tools and utilities for functional programming in Dart. It enables the use of concepts such as Either, Option, and Try to manage potentially empty values or possible failed results.
- [equatable](https://pub.dev/packages/equatable): ^2.0.3
  This package provides the Equatable abstract class, which makes it easier to compare objects based on their values. It is useful in implementing the == and hashCode methods for objects to be used in data structures requiring value comparison
- [flutter_bloc](https://pub.dev/packages/flutter_bloc): ^8.0.0
  This package is the BLoC implementation for Flutter. It provides the structure and tools needed to implement the BLoC architecture in Flutter applications, including the Bloc and BlocProvider classes.
- [get_it](https://pub.dev/packages/get_it): ^7.2.0
  This package is a service locator for Flutter and Dart. It allows for the central registration and retrieval of services and objects in a Flutter application, which is useful for dependency management.
- [http](https://pub.dev/packages/http): ^0.13.4
  This package is an HTTP client for Flutter. It allows Flutter applications to make HTTP requests to servers to fetch or send data.
- [lottie](https://pub.dev/packages/lottie): ^1.2.1
  This package provides support for Lottie animations in Flutter applications. Lottie is a JSON file format that allows for the use of complex vector animations in applications.
- [provider](https://pub.dev/packages/provider): ^6.0.1
  This package is a simple status management package designed for Flutter. It provides an easy way to share and access status across the application.
- [responsive_sizer](https://pub.dev/packages/responsive_sizer): ^3.1.1
  This package provides utilities for making Flutter applications responsive to screen sizes. It allows for the use of responsive unit sizes, such as sp and h, to measure UI elements.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### 3. Why the design is like that
