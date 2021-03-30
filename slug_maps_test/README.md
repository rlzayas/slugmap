# Slug Maps

## Motivation
Our project was developed with the intention of helping students, families, and others at the University of California, Santa Cruz navigate around the beautiful college campus in the most efficient way! This application takes into consideration the United Nations' Sustainable Development Goals of 2021, goals that were designed towards a sustainable and better future for our planet. With that being said, there are map markers for sustainable resources such as water filters, EV charging stations, public transportation (bus stops), and much more! This project is a submission to the Google Solution Challenge 2021 and developed by a team at the UCSC Google Developers Student Club

## The Team
* Rey Zayas
* Albert Castro
* Michelle Sheu
* Abhi Raghuraman
* Yojhan Salazar Flores

## Technology Stack
* Figma (UI/UX Design)
* Flutter Framework (development)
* Android Studio (IDE)
* Google Maps API (back-end routing data)
  - Google Maps for Android
  - Google Maps for IOS
* Firebase (Database)

## Getting Started
To get started with using our application, please be sure to follow the steps outlined below. These steps are written to be used with the Android Studio IDE and often assuming no errors took place during the process.

  1) Click "Open an Existing Project"
  2) Navigate to the directory with our Slug Maps Repository and Open it
  3) Make sure Android Studio is configured correctly (Flutter/Dart Plugin installed and working properly)
  4) Click <no devices> at the top to find a list of device emulators to open, or open the AVD Manager (top right) to manually boot a device emulator.
  5) Wait for the emulator to successfully boot up or be running properly.
  6) Open "pubspec.yaml" by double-clicking the file under "Projects". Remain viewing this file.
  7) Either click "pub get" which should appear at the top, or run "flutter pub get" in the Android Studio Console. This should fetch all dependencies for the application.
  8) If you are running an IOS emulator (i.e Iphone) and you ran into any errors, try running "flutter clean" and repeating step 7.
  9) If there are no error messages, you can now either run "flutter run" or click the green arrow button at the top to "run main.dart". This should launch the application in        the device emulator you are currently using. You are now free to use the application!

## Navigation
Follow the steps below to navigate successfully within the application

  1) The application starts at the title screen, where you must click "Lets Go" to enter the map
  2) Once the map loads up, you can scroll anywhere in the world (initially centered at the University of California, Santa Cruz campus)
  3) You may use the Search Bar at the top to search for a campus resource (i.e Earth and Marine Sciences Building) and use the search result to be directed to that resource on      the map itself.
  4) The button on the right is a filter button, which provides options presenting the user with a number of groups of markers (Colleges, Dining Halls, etc)
  5) Clicking on one of these filters brings the user to a new maps screen, where markers are placed on the map where each filter resource is located. The image carousel at the      bottom lets users scroll through and select a resource to be directed to. Users may also scroll around the map and locate the resources themselves if need be.
  6) If a filter button was clicked, users may navigate back to the map main page with the slug logo at the top left of the screen (next to the search bar feature).

### Where everything can be downloaded
* Figma: https://www.figma.com/
* Flutter Framework: https://flutter.dev/
* Android Studio: https://developer.android.com/studio
* Google Cloud Platform: https://console.cloud.google.com/
  - Google Maps API (Android/IOS)
  - Firebase
