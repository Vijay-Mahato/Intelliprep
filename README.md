# IntelliPrep 📚🚀

**IntelliPrep** is a Flutter-based interview preparation app that helps students and job seekers master **Data Structures**, **Algorithms**, and **System Design**. It also provides guidance from experienced mentors to accelerate learning.

![Banner](screenshots/banner.png)

---

## 🚀 Features

- 🔹 150+ curated interview questions with answers
- 🔹 Categorized by topic and company (Google, Amazon, etc.)
- 🔹 DSA and System Design questions with explanations and code
- 🔹 Mentor section to connect with industry professionals
- 🔹 Firebase Authentication and Firestore Database
- 🔹 Gamification: Points system and rewards
- 🔹 Particle animations and custom theming
- 🔹 Clean UI with reusable widgets and modular code

---

## 🧑‍🏫 Mentor Section

The **Mentor Section** allows users to:

- Browse mentor profiles
- View their specialties and availability
- Contact mentors for personalized help
- Stored and managed using Firebase

---

## 📸 Screenshots

> Add your app screenshots in the `screenshots/` folder in your repo and link them here.

![Home Screen](screenshots/home.png)
![Question Detail](screenshots/detail.png)
![Mentor Section](screenshots/mentor.png)

---

## 🛠️ Tech Stack

- **Flutter**
- **Dart**
- **Firebase Authentication**
- **Cloud Firestore**
- **Provider/Riverpod** (state management)
- **Clean Architecture**

---

## 📁 Folder Structure

lib/
├── core/ # Constants, utilities, global configs
├── features/
│ ├── dsa/ # DSA question screens & models
│ ├── system_design/ # System design section
│ ├── mentor/ # Mentor UI and logic
│ └── home/ # Dashboard and landing screens
├── shared/
│ ├── theme/ # App theme and colors
│ └── widgets/ # Custom widgets
└── main.dart
