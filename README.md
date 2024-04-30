# ChatLite

ChatLite is a messaging application developed using Flutter. It provides users with the ability to exchange text messages and supports mobile (android and ios) platforms.

## Screenshots (light/dark mode)

### Login Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/93b3efc2-fe9a-46a3-b85e-92c015b2f236" width="300" />
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/65c1625b-76bb-49f2-b47f-f8ed6397a8ce" width="300" />
</div>

### Register Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/f85f65f7-182d-4440-8717-47be0a978be0" width="300" />
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/e0f06ce6-c78c-4282-a7ef-c6843b7f9b94" width="300" />
</div>

### Home Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/74005d0f-8256-4ef8-b2b2-e2072b864de4" width="300" />
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/e1b57995-2749-486b-9524-76e6359ca58f" width="300" />
</div>

### Chat Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/7528c572-cf05-4678-878f-f76fe7b2b0ef" width="300" />
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/ac1c0c25-59c3-48c4-a818-4b7f0da30040" width="300" />
</div>

### Drawer:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/adf72efe-e8d1-4990-a8ac-3dd2a19779af" width="300" />
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/639c143c-f8f7-4acc-9c28-77430223ff3b" width="300" />
</div>

## Features

- User Authentication: Users can sign in and sign up using email and password.
- Real-time Messaging: Users can exchange text messages in real-time.
- Dark Mode Support: Offers a dark mode for improved user experience in low-light environments.

## Libraries & Tools Used

- [Provider](https://github.com/rrousselGit/provider): For state management.
- [Firebase Core](https://firebase.google.com/docs/flutter/setup): For Firebase services initialization.
- [Firebase Authentication](https://firebase.google.com/docs/auth): For user authentication.
- [Firebase Firestore](https://firebase.google.com/docs/firestore): For real-time database to store messages.
- [Firebase Storage](https://firebase.google.com/docs/storage): For storing user profile images.

## Project Structure Overview
 
 Now, let's dive into the lib folder which has the main code for the application.

### components

This directory contains reusable UI components that can be used across multiple screens or views. It helps in maintaining consistency and reusability in the UI.

### constants

The constants directory holds various constants used throughout the application, such as app themes, colors, fonts, API endpoints, and other configuration-related values.

### controllers

In the controllers directory, you'll find classes responsible for handling business logic related to specific features or functionalities of your application. These controllers often interact with services, models, and views to manage data flow and application behavior.

### models

The models directory contains data models used to represent entities within your application. These models typically define the structure of data fetched from APIs or stored locally, making it easier to work with data in a structured manner.

### services

Services in the services directory encapsulate functionality related to external services, such as Firebase services, API clients, database interactions, authentication, and more. They provide a clean abstraction layer for interacting with external dependencies.

### themes

The themes directory houses theme-related configurations, such as light mode, dark mode, font styles, and other visual settings. Keeping theme-related code separate helps maintain a consistent look and feel across the application and facilitates easy theming adjustments.

### views

Views in the views directory represent the various screens or pages of your application. Each view typically corresponds to a specific user interface and functionality, encapsulating the layout, widgets, and user interactions for that particular screen.

### firebase_options.dart

This file contains configurations and options required for initializing Firebase services in your application, such as Firebase Core and Firestore.

### main.dart

The main.dart file serves as the entry point for your Flutter application. It initializes the app, configures routes, and sets up any required dependencies or configurations before running the app's main widget.


## Getting Started

To run this application locally:

1. Clone this repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Run the app using `flutter run`.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the ChatApp project.
