# 🍔 TastyBytes — Modern Flutter Restaurant App

<p align="center">
  <img src="assets/logo/logo.png" width="150" alt="TastyBytes Logo">
</p>

<h1 align="center">🍔 TastyBytes</h1>

<p align="center">
  <strong>Modern Food Ordering Experience Built with Flutter</strong>
</p>

<p align="center">
  A feature-rich restaurant application developed as a
  <strong>Week 7 Flutter Internship Project at Owasoft Technologies</strong>.
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Framework-02569B?style=for-the-badge&logo=flutter&logoColor=white">
  <img src="https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white">
  <img src="https://img.shields.io/badge/BLoC-State%20Management-7B1FA2?style=for-the-badge">
  <img src="https://img.shields.io/badge/Sqflite-Local%20Database-F57C00?style=for-the-badge">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Internship-Owasoft%20Technologies-FFC107?style=flat-square">
  <img src="https://img.shields.io/badge/Project-Week%207-111111?style=flat-square">
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-4CAF50?style=flat-square">
  <img src="https://img.shields.io/badge/Status-Development-FF9800?style=flat-square">
</p>

---

## ✨ About TastyBytes

**TastyBytes** is a modern restaurant and food-ordering mobile application built with **Flutter and Dart**.

The project was developed during **Week 7 of my Flutter Development Internship at Owasoft Technologies** with a focus on practical Flutter development, **BLoC state management, responsive UI, navigation, animations, local data management, and clean feature-based architecture**.

The application provides a complete food-ordering journey:

```text
🚀 Splash
   ↓
👋 Onboarding
   ↓
🏠 Home
   ↓
🍕 Categories
   ↓
🍽️ Food Details
   ↓
🛒 Cart
   ↓
💳 Checkout
   ↓
🎉 Order Success
   ↓
📦 Order History
```

---

# 🎬 App Demo

<p align="center">
  <img src="assets/gif/tastybytes_demo.gif" width="320" alt="TastyBytes Animated Demo">
</p>

<p align="center">
  <em>🎥 TastyBytes application walkthrough</em>
</p>

> Replace `assets/gif/tastybytes_demo.gif` with your actual application recording/GIF.

---

# 🚀 Key Features

| Feature          | Description                           |
| ---------------- | ------------------------------------- |
| 🏠 Home          | Food discovery and popular items      |
| 🍕 Categories    | Browse food by category               |
| 🍔 Food Details  | View food information and add to cart |
| 🛒 Cart          | Manage food items and quantities      |
| 💳 Checkout      | Address and payment selection         |
| 🎉 Order Success | Order confirmation                    |
| 📦 Order History | View previous orders                  |
| 👤 Profile       | User information and account options  |
| 🧠 BLoC          | Structured state management           |
| 🎞️ Animations   | Smooth Flutter UI transitions         |
| 📱 Responsive UI | ScreenUtil-based responsive layouts   |
| 💾 Local Storage | Local application data management     |

---

# 🎨 UI Design

TastyBytes follows a clean restaurant-inspired design system based around:

```text
🟨 Yellow
⬛ Black
⬜ White
🩶 Light Grey
🟩 Success
🟥 Error
```

A centralized color system is used to maintain consistency across the application.

```dart
class AppColors {
  static const Color black = Color(0xFF111111);
  static const Color white = Color(0xFFFFFFFF);
  static const Color yellow = Color(0xFFFFC107);
  static const Color teal = Color(0xFF009688);
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color grey = Color(0xFF757575);
  static const Color darkGrey = Color(0xFF333333);
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
}
```

---

# 🎞️ Motion & Animation

The application uses Flutter's animation system to create a smoother and more interactive experience.

### Animation Technologies

* 🎬 `AnimationController`
* 🌫️ `FadeTransition`
* ↕️ `SlideTransition`
* 🔍 `ScaleTransition`
* 🔄 `AnimatedContainer`
* 📈 `AnimatedScale`
* 🦸 `Hero`
* 🎯 Flutter animation curves

### Animation Flow

```text
Screen Opens
     │
     ▼
AnimationController
     │
     ├──────────────► Fade
     │
     ├──────────────► Slide
     │
     └──────────────► Scale
                         │
                         ▼
                  Smooth UI Entrance
```

---

# 🦸 Hero Motion

Hero animations are used for smooth transitions between related screens.

### Category → Food Details

```text
🍕 Category
     │
     │ Hero
     ▼
🍕 Food Details
```

Example:

```dart
Hero(
  tag: 'Details_$name',
  child: Icon(
    icon,
    size: 28,
  ),
)
```

Destination:

```dart
Hero(
  tag: 'Details_${widget.category}',
  child: Icon(
    Icons.local_pizza,
    size: 40,
  ),
)
```

The same Hero tag connects the source and destination widgets.

---

# 🧠 BLoC Architecture

TastyBytes uses **BLoC (Business Logic Component)** to separate application logic from the UI.

### Core Flow

```text
             👤 USER
                │
                ▼
             ⚡ EVENT
                │
                ▼
          🧠 BLOC LOGIC
                │
                ▼
             📦 STATE
                │
                ▼
             🎨 UI
                │
                ▼
          🔄 UI REBUILDS
```

### Example

```text
User taps Pizza
       ↓
SelectCategoryEvent
       ↓
HomeBloc
       ↓
HomeCategoryChanged
       ↓
BlocBuilder
       ↓
Pizza becomes selected
```

---

# 🧩 Feature-Based Architecture

The project separates features into their own modules.

```text
lib/
│
├── core/
│   └── constants/
│       └── app_colors.dart
│
├── features/
│
├── splash/
│
├── onboarding/
│
├── home/
│   ├── bloc/
│   │   ├── home_bloc.dart
│   │   ├── home_event.dart
│   │   └── home_state.dart
│   │
│   └── screen/
│       └── home_screen.dart
│
├── categories/
│   ├── bloc/
│   │   ├── categories_bloc.dart
│   │   ├── categories_event.dart
│   │   └── categories_state.dart
│   │
│   └── screen/
│       └── categories_screen.dart
│
├── food_details/
│   ├── bloc/
│   │   ├── food_details_bloc.dart
│   │   ├── food_details_event.dart
│   │   └── food_details_state.dart
│   │
│   └── screen/
│       └── food_details_screen.dart
│
├── cart/
│   ├── bloc/
│   │   ├── cart_bloc.dart
│   │   ├── cart_event.dart
│   │   └── cart_state.dart
│   │
│   └── screen/
│       └── cart_screen.dart
│
├── checkout/
│   ├── bloc/
│   │   ├── checkout_bloc.dart
│   │   ├── checkout_event.dart
│   │   └── checkout_state.dart
│   │
│   └── screen/
│       └── checkout_screen.dart
│
├── order_success/
│   └── screen/
│       └── order_success_screen.dart
│
├── order_history/
│   ├── bloc/
│   └── screen/
│       └── order_history_screen.dart
│
└── profile/
    ├── bloc/
    └── screen/
        └── profile_screen.dart
```

---

# 🔄 Complete Application Flow

```text
                    🚀 SPLASH
                       │
                       ▼
                  👋 ONBOARDING
                       │
                       ▼
                 🏠 MAIN SCREEN
                       │
       ┌───────────────┼────────────────┐
       │               │                │
       ▼               ▼                ▼
    🏠 HOME         📦 ORDERS        🛒 CART
       │                                │
       ▼                                ▼
  🍕 CATEGORIES                    💳 CHECKOUT
       │                                │
       ▼                                ▼
 🍔 FOOD DETAILS                   🎉 SUCCESS
       │
       ▼
    🛒 CART
```

---

# 📱 Application Screens

## 🚀 01 — Splash Screen

The splash screen introduces the TastyBytes brand when the application starts.

**Includes:**

* TastyBytes logo
* Branding
* Launch animation
* Navigation to onboarding

---

## 👋 02 — Onboarding

Introduces the application's main concept.

**Includes:**

* Food introduction
* Delivery introduction
* User experience introduction
* Navigation to the main application

---

## 🏠 03 — Home

The main food discovery screen.

**Includes:**

* Welcome section
* Food categories
* Popular foods
* Food cards
* See All navigation
* Restaurant-focused UI

---

## 🍕 04 — Categories

Users can browse food categories.

```text
🍕 Pizza
🍔 Burger
🍗 Chicken
🥤 Drinks
```

Category selection is handled using BLoC.

---

## 🍽️ 05 — Food Details

Users can:

* View available food
* View price
* View food icon/image
* Add food to cart
* Receive add-to-cart confirmation

---

## 🛒 06 — Cart

Users can:

* View selected food
* Increase quantity
* Decrease quantity
* Remove items
* Calculate total
* Continue to checkout

---

## 💳 07 — Checkout

The checkout process includes:

* 📍 Delivery address
* 💵 Cash on Delivery
* 💳 Credit/Debit Card
* 📱 EasyPaisa
* 🧾 Order summary
* ✅ Place Order

---

## 🎉 08 — Order Success

Displays successful order confirmation after checkout.

---

## 📦 09 — Order History

Users can view previously placed orders and related information.

---

## 👤 10 — Profile

Profile functionality includes:

* 👤 User information
* ✏️ Edit Profile
* 📦 Order History
* 📍 My Address
* 🚪 Logout

---

# 📐 Responsive Design

The project uses **Flutter ScreenUtil** to create responsive layouts.

Example:

```dart
Text(
  'TastyBytes',
  style: TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
  ),
)
```

Spacing:

```dart
SizedBox(
  height: 20.h,
)
```

Padding:

```dart
EdgeInsets.all(16.w)
```

Border radius:

```dart
BorderRadius.circular(15.r)
```

This allows the UI dimensions to adapt to different screen sizes.

---

# 🛠️ Tech Stack

### 📱 Development

* Flutter
* Dart
* Material Design

### 🧠 Architecture

* BLoC
* Event-State architecture
* Feature-based structure

### 🎨 UI/UX

* Responsive layouts
* Flutter animations
* Hero transitions
* Animated widgets
* Custom AppBars
* Modern card-based UI

### 💾 Data

* Sqflite
* Local data management

### 🔧 Development Tools

* Android Studio
* Visual Studio Code
* Git
* GitHub

---

# 📦 Main Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_bloc:
  flutter_screenutil:
  sqflite:
  path:
  lottie:
```

Install dependencies:

```bash
flutter pub get
```

---

# 🖼️ Assets

```text
assets/
│
├── logo/
│   └── logo.png
│
├── onboarding/
│   ├── food.png
│   ├── delivery.png
│   └── enjoy.png
│
├── animation/
│   ├── Bike.json
│   └── Burger.json
│
└── food/
    ├── burger.png
    ├── pizza.png
    ├── pasta.png
    └── drink.png
```

---

# 🎯 Learning Outcomes

This project provided practical experience in:

* 🐦 Flutter development
* 💙 Dart programming
* 🧠 BLoC state management
* ⚡ Event and state handling
* 🏗️ Feature-based architecture
* 🧭 Flutter navigation
* 🦸 Hero transitions
* 🎞️ Flutter animations
* 📱 Responsive UI
* 💾 Local database handling
* 🛒 Cart management
* 💳 Checkout implementation
* 🐛 Debugging and bug fixing
* 🔧 Git/GitHub workflow
* 📂 Project organization

---

# 🚀 Installation & Setup

### 1️⃣ Clone Repository

```bash
git clone YOUR_REPOSITORY_URL
```

### 2️⃣ Navigate to Project

```bash
cd resturant_app
```

### 3️⃣ Install Packages

```bash
flutter pub get
```

### 4️⃣ Check Flutter Environment

```bash
flutter doctor
```

### 5️⃣ Run Application

```bash
flutter run
```

---

# 📦 Generate APK

For a release APK:

```bash
flutter build apk --release
```

APK location:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🔧 Git Workflow

```bash
git status
```

```bash
git add .
```

```bash
git commit -m "Fix bugs and review code"
```

```bash
git push origin main
```

---

# 🔮 Future Enhancements

Planned possibilities for future versions:

* 🔐 Firebase Authentication
* ☁️ Firebase Firestore
* 🔔 Push Notifications
* 🌐 REST API integration
* 💳 Online payment gateway
* 🔎 Food search
* ❤️ Favorite foods
* ⭐ Reviews and ratings
* 👨‍🍳 Restaurant management
* 🛠️ Admin dashboard
* 📍 Real-time order tracking
* ☁️ Cloud-based food images

---

# 👨‍💻 Developer

<p align="center">

## Saud Masood

### 🎓 BSCS Graduate | Flutter Developer | AI/ML Enthusiast | Software Engineering

</p>

I am a Computer Science graduate focused on building modern mobile applications and exploring **Flutter, AI/ML, and Software Engineering**.

### 💻 Technical Interests

```text
🐦 Flutter Development
🎯 Dart
🧠 AI / Machine Learning
🤖 Deep Learning
🏗️ Software Engineering
🌐 Web Development
🔥 Firebase
🗄️ Databases
🔧 Git & GitHub
```

---

# 🏢 Internship Project

**Organization:** Owasoft Technologies Pvt. Ltd.
**Internship:** Flutter Development Internship
**Project:** TastyBytes Restaurant App
**Project Week:** Week 7
**Technology:** Flutter + Dart
**Architecture:** BLoC

```text
Owasoft Technologies
        │
        ▼
Flutter Internship
        │
        ▼
     Week 7
        │
        ▼
   TastyBytes
        │
        ▼
Flutter + BLoC
```

---

# 📞 Contact

<p align="center">

📧 **Email:** `YOUR_EMAIL@example.com`

📱 **Phone:** `+92 XXX XXXXXXX`

💻 **GitHub:** `github.com/SaudMasood`

</p>

> Replace the email and phone placeholders with your preferred public contact details before publishing.

---

# ⭐ Project Status

<p align="center">

🟢 **Active Development**

</p>

This project was developed as part of my **Week 7 Flutter Development Internship at Owasoft Technologies** and demonstrates practical implementation of Flutter UI, BLoC state management, navigation, responsive design, local data handling, and motion-based UI interactions.

---

<p align="center">

# 🍔 TastyBytes

### **Taste. Order. Enjoy.** 😋

Built with ❤️ using **Flutter & Dart**

<br>

⭐ **If you find this project useful, consider giving it a star!** ⭐

</p>
