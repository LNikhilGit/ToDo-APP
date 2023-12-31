# SwiftUI To-Do App with Firebase Integration

This repository contains the source code for a To-Do app built using SwiftUI for iOS, with Firebase integration for authentication and data storage. This app allows users to sign in with their email using Firebase Authentication and store their to-do tasks in Firebase Firestore. The tasks are then retrieved and displayed on the home screen of the app.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Xcode installed on your machine.
- An active Firebase project with Firebase Authentication and Firestore enabled.
- CocoaPods installed. If not, you can install it using `sudo gem install cocoapods`.

## Getting Started

To get started with the project, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/swiftui-todo-firebase.git

## Firebase Configuration

1. Open the Firebase Console: Firebase Console.
2. Create a new project or select an existing project.
3. Enable Firebase Authentication and Firestore for your project.
4. Obtain your Firebase configuration file (GoogleService-Info.plist) and replace the existing file in the Xcode project.

## Usage 

1. Build and run the app in Xcode.
2. Sign in with your email using Firebase Authentication.
3. Add , and delete to-do tasks.
4. Tasks are stored in Firebase Firestore and retrieved on the home screen.

## Features
1. Firebase Authentication for user sign-in.
2. Firebase Firestore for storing and retrieving to-do tasks.
3. SwiftUI for building the user interface.
4. CRUD operations for managing tasks.
5. Responsive and user-friendly design.
