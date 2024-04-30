# ChatLite

ChatLite is a messaging application developed using Flutter + Firebase. It provides users with the ability to exchange text messages and supports mobile (android and ios) platforms.

## Screenshots (light/dark mode)

### Login Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/93b3efc2-fe9a-46a3-b85e-92c015b2f236" width="300" />ㅤㅤ
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/65c1625b-76bb-49f2-b47f-f8ed6397a8ce" width="300" />
</div>

### Register Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/f85f65f7-182d-4440-8717-47be0a978be0" width="300" />ㅤㅤ
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/e0f06ce6-c78c-4282-a7ef-c6843b7f9b94" width="300" />
</div>

### Home Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/74005d0f-8256-4ef8-b2b2-e2072b864de4" width="300" />ㅤㅤ
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/e1b57995-2749-486b-9524-76e6359ca58f" width="300" />
</div>

### Chat Page:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/7528c572-cf05-4678-878f-f76fe7b2b0ef" width="300" />ㅤㅤ
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/ac1c0c25-59c3-48c4-a818-4b7f0da30040" width="300" />
</div>

### Drawer:
<div>
  <img src="https://github.com/DenisGrudin1n/ChatApp/assets/157652311/adf72efe-e8d1-4990-a8ac-3dd2a19779af" width="300" />ㅤㅤ
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
 
The project follows a MVC+S structure, organized into various directories:

### components

This directory contains reusable UI components that can be used across multiple screens or views. It helps in maintaining consistency and reusability in the UI:

- **build_user_list.dart:** The `BuildUserList` component retrieves and displays a list of users, allowing interaction for initiating chats.
- **message_bubble.dart:** The `MessageBubble` component displays a chat message bubble with customizable appearance based on the current user.
- **my_default_button.dart:** The `MyDefaultButton` component is a customizable button widget with text and onTap callback.
- **my_drawer.dart:** The `MyDrawer` component represents the application drawer, providing navigation options and logout functionality.
- **my_home_appbar.dart:** The `MyHomeAppbar` component defines the custom app bar used in the home screen, displaying the application title.
- **my_login_upperpart_ui.dart:** The `LoginUpperUI` component displays the upper part of the login screen, featuring the application logo and title.
- **my_textfield.dart:** The `MyTextField` component is a customized text field widget with configurable hint text, obscuring text functionality, and a controller.
- **user_tile.dart:** The `UserTile` component represents a clickable container displaying user-related information.
  
### constants

The constants directory holds various constants used throughout the application, such as app themes, colors, fonts, API endpoints, and other configuration-related values:

- **constants.dart:** This file contains various color constants used throughout the application, including white, light blue, and light purple for light mode, and black, dark blue, and dark purple for dark mode. It also defines constants for medium and bold font weights.

### controllers

In the controllers directory, you'll find classes responsible for handling business logic related to specific features or functionalities of your application. These controllers often interact with services, models, and views to manage data flow and application behavior:

- **auth_controller.dart:** The `AuthController` class manages the authentication state of the application, providing methods to set and retrieve the login status.

- **login_or_register_controller.dart:** The `LoginOrRegisterController` class toggles between the login and register pages, facilitating navigation between these authentication screens.

- **theme_controller.dart:** The `ThemeController` class manages the theme state of the application, allowing users to toggle between light and dark modes.

### models

The models directory contains data models used to represent entities within your application. These models typically define the structure of data fetched from APIs or stored locally, making it easier to work with data in a structured manner:

- **message_model.dart:** The `Message` model represents a chat message, containing information such as sender ID, sender email, receiver ID, message content, and timestamp. It also provides a method to convert message data to a map for Firestore storage.

### services

Services in the services directory encapsulate functionality related to external services, such as Firebase services, API clients, database interactions, authentication, and more. They provide a clean abstraction layer for interacting with external dependencies:

- **auth:** This directory contains authentication-related services and functionalities:

  - **auth_gate.dart:** The `AuthGate` widget determines whether the user is authenticated or not and redirects them accordingly. If the user is logged in, it navigates to the home page; otherwise, it displays the login or register page.

  - **auth_manager.dart:** The `AuthManager` class provides methods for user authentication, including sign-up, sign-in, and sign-out functionalities. It also handles navigation and displays loading dialogs during authentication processes.

  - **auth_service.dart:** The `AuthService` class manages user authentication using Firebase Authentication. It includes methods for sign-up, sign-in, sign-out, and username validation, as well as retrieving the current user's information.

- **chat:** This directory contains chat-related services and functionalities:

  - **chat_service.dart:** The `ChatService` class provides methods for sending and receiving messages between users in a chat room. It interacts with Firestore to store and retrieve messages, as well as to get a stream of users for building the user list.

### themes

The themes directory houses theme-related configurations, such as light mode, dark mode, font styles, and other visual settings. Keeping theme-related code separate helps maintain a consistent look and feel across the application and facilitates easy theming adjustments:

- **themes.dart:** This file defines theme data for both light mode and dark mode. It includes colors such as background, primary, secondary, and tertiary colors, as well as primary and highlight colors. These theme data are used throughout the application to maintain consistent styling.

### views

Views in the views directory represent the various screens or pages of your application. Each view typically corresponds to a specific user interface and functionality, encapsulating the layout, widgets, and user interactions for that particular screen:

- **pages:** This directory contains all pages of the application:
  
  - **chat_page.dart:** The `ChatPage` widget displays the chat interface, including messages between users. It provides functionalities for sending and receiving messages, as well as displaying the user input field and message bubbles.

  - **home_page.dart:** The `HomePage` widget represents the home page of the application, where users can view and interact with the list of users. It includes a custom app bar and drawer for navigation.

  - **login_page.dart:** The `LoginPage` widget displays the login interface, allowing users to enter their credentials to sign in to the application. It includes text fields for email and password input, as well as a button to initiate the login process.

  - **register_page.dart:** The `RegisterPage` widget displays the registration interface, allowing new users to create an account. It includes text fields for username, email, and password input, as well as a button to initiate the registration process.

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
