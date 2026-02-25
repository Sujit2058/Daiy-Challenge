# 📱 Daily Challenge App

A Flutter application built using **Clean Architecture + BLoC** that provides users with a daily challenge based on their selected interests.

---

## 🚀 Features

- 🔐 Onboarding with category selection
- 🎯 Daily challenge (locked per day)
- 🔥 Streak tracking
- ✅ Mark challenge as completed
- 📜 Challenge history
- 🌐 Backend integration using Dio
- 🧱 Clean Architecture
- 🧠 BLoC State Management

---

## 🏗 Architecture

The project follows **Clean Architecture** principles.



### Architecture Layers

- **Presentation** → UI + BLoC
- **Domain** → Entities + Repository contracts
- **Data** → API implementation using Dio

---

## 🛠 Tech Stack

- Flutter
- BLoC
- Dio
- Hive (Local storage)
- Mockoon (Backend simulation)

---

## 🌐 API Configuration

All endpoints are defined in:


core/constants/api_constants.dart


Example:

``dart
static const baseUrl = 'http://10.0.2.2:3001/';
static const todayChallenge = 'challenge/today';
static const completeChallenge = 'challenge/complete';
static const challengeHistory = 'challenge/history';
static const streak = 'streak';
Emulator Note

If using Android emulator:

http://10.0.2.2:3001/

If using real device:

http://YOUR_LOCAL_IP:3001/
📦 Installation
1️⃣ Clone the repository
git clone <your_repo_url>
2️⃣ Install dependencies
flutter pub get
3️⃣ Run the app
flutter run
🔥 How Daily Challenge Works

User selects interests during onboarding

App fetches:

Today's challenge

Current streak

When "Mark as Completed" is pressed:

Backend updates completion

UI refreshes

Streak updates

The challenge remains completed until the next date.

## 🧠 State Management

Each feature has its own BLoC:

OnboardingBloc

ChallengeBloc

HistoryBloc

Example state flow:

LoadChallenge → Loading → Loaded(challenge + streak)
📸 Screens

Onboarding Page

Daily Challenge Page

History Page

⚠ Common Issues
API not loading?

Ensure Mockoon is running

Check correct base URL

Check endpoint names

Verify JSON structure matches model

## 📸 Screenshots

### Onboarding Screen
![Onboarding](assets/screenshot01.png)
![Onboarding](assets/screenshot02.png)

### Daily Challenge Screen
![Challenge](assets/screenshot03.png)

### History Screen
![History](assets/screenshot04.png)

## 👨‍💻 Author
## Sujit Ptajaiati

Built as part of internship task using Flutter + Clean Architecture.

## 📄 License

This project is for educational/internship purposes.
