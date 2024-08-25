# StanceTest

Workout App
Overview
The Workout App is an iOS application built with Swift and SwiftUI that helps users track and visualize workout data. The app retrieves workout data from a remote API, displays it in a user-friendly manner, and provides insightful visualizations using charts. The app also features robust error handling and a clean, modular architecture that facilitates testing and further development.

Features
Data Fetching: Retrieves workout data from a remote API.
Data Visualization: Displays workout data using line charts, showing metrics like speed and intensity.
Error Handling: Gracefully handles API errors and displays relevant error messages to the user.
Unit Testing: Includes unit tests for the WorkoutViewModel and WorkoutAPI to ensure reliable functionality.
Tech Stack
Swift
SwiftUI: For building the user interface.
Charts Framework: For data visualization.
XCTest: For unit testing.
Project Structure
plaintext
Copy code
.
├── WorkoutApp/              # Main application directory
│   ├── Models/              # Data models
│   ├── ViewModels/          # ViewModels managing app logic
│   ├── Views/               # SwiftUI Views
│   ├── API/                 # API related classes and protocols
│   └── WorkoutAppApp.swift  # Application entry point
└── Tests/                   # Unit tests for the project
Key Components
Models: Contains data models like Workout, Set, and Rep that represent the structure of the workout data.
ViewModels: Contains the WorkoutViewModel responsible for fetching and managing workout data.
Views: Contains SwiftUI views like LineChartView for displaying the workout data.
API: Contains the WorkoutAPI class responsible for fetching data from the remote API.
Getting Started
Prerequisites
Xcode 14 or later
iOS 16 or later (for Charts framework support)
Setup Instructions
Clone the Repository:

bash
Copy code
git clone https://github.com/dbrown11/StanceTest.git
cd WorkoutApp
Open in Xcode:

Open the project in Xcode by double-clicking the WorkoutApp.xcodeproj file.
Build and Run:

Select a simulator or a connected device in Xcode and hit the Run button (Cmd + R) to build and launch the app.
API Configuration
The app fetches workout data from a predefined API endpoint. No additional configuration is needed, but you can update the API URL in the WorkoutAPI class if required.

Test Questions.

Detailed build and run instructions: Simply open the app, and an onAppear call will pull the workout data.

A summary of your implementation decisions: I decided to implement a list view for all the Sets, showing the speed and intensity of each rep. This allows the user to visually see how their performance is changing from set to set.

Total time spent on the project: 2 hours.


