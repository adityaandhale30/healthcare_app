# Healthcare Appointment Booking App

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Screenshots & Animations](#screenshots--animations)
- [Architecture](#architecture)
- [Folder Structure](#folder-structure)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Usage](#usage)

---

## Overview

A modern, clean, and responsive Healthcare Appointment Booking Mobile App built with Flutter. The app leverages GetX for state management and navigation, follows the MVC architecture, and uses Sqflite for local data persistence. Designed for extensibility, maintainability, and a delightful user experience.

---

## Features

- **Authentication**: Login/Signup screens with simulated (dummy) authentication logic
- **Doctor Directory**: Home screen listing doctors (dummy data)
- **Doctor Profile**: Detailed doctor info with hero animation
- **Appointment Booking**: Select available slots and confirm appointments
- **Confirmation**: Animated booking confirmation using Lottie
- **Local Storage**: User and appointment data saved with Sqflite
- **Responsive Design**: Adapts to all screen sizes
- **Modern UI**: Google Fonts, card-based layout, light theme
- **Reusable Widgets**: Buttons, cards, slots
- **State Indicators**: Loading, success, error
- **GetX Routing**: Centralized, type-safe navigation
- **Bindings**: Lazy loading of controllers

---

## Screenshots & Animations

> _Add your screenshots and Lottie animation GIFs here_

| Login/Signup | Home (Doctors) | Doctor Profile | Booking | Confirmation |
|:------------:|:-------------:|:--------------:|:-------:|:------------:|
| ![Login](screenshots/login.png) | ![Home](screenshots/home.png) | ![Profile](screenshots/profile.png) | ![Booking](screenshots/booking.png) | ![Confirmation](screenshots/confirmation.gif) |

---

## Architecture

- **MVC Pattern**: Clear separation of Models, Views, Controllers for maintainability
- **GetX**: State management, routing, dependency injection, and bindings
- **Sqflite**: Local database for persistent storage
- **Bindings**: Lazy loading of controllers for performance

---

## Folder Structure

```
lib/
  controllers/   # GetX controllers (business logic)
  models/        # Data models (Doctor, User, Appointment)
  views/         # UI screens (login, home, profile, confirmation)
  widgets/       # Reusable UI components (buttons, cards, slots)
  routes/        # Centralized route definitions
  db/            # Database helper and logic
  main.dart      # App entry point
```

---

## Tech Stack

- **Flutter**: UI toolkit for building natively compiled apps
- **GetX**: State management, routing, dependency injection
- **Sqflite**: Local database for persistent storage
- **Lottie**: Smooth, vector-based animations
- **Google Fonts**: Modern, beautiful typography

---

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Android Studio, VS Code, or any preferred IDE
- A device or emulator

### Installation
1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/healthcare_app.git
   cd healthcare_app
   ```
2. **Install dependencies**
   ```bash
   flutter pub get
   ```
3. **Run the app**
   ```bash
   flutter run
   ```

---

## Usage

- **Login/Signup**: Use any dummy credentials to simulate authentication
- **Browse Doctors**: View a list of available doctors
- **View Profile**: Tap a doctor card for detailed info (with hero animation)
- **Book Appointment**: Select a slot and confirm booking
- **Confirmation**: Enjoy a Lottie animation on successful booking
- **Data Persistence**: All user and appointment data is stored locally using Sqflite

---


