# 🍔 TastyBytes — Restaurant Food Ordering App

<p align="center">
  <img src="assets/logo/logo.png" width="160" alt="TastyBytes Logo"/>
</p>

<h1 align="center">🍔 TastyBytes</h1>

<p align="center">
  <strong>Modern • Responsive • Animated • BLoC-Powered Restaurant App</strong>
</p>

<p align="center">
  A complete restaurant food-ordering mobile application built with
  <strong>Flutter & Dart</strong> as part of my
  <strong>Week 7 Flutter Development Internship Project at Owasoft Technologies.</strong>
</p>

<p align="center">

<img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
<img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
<img src="https://img.shields.io/badge/BLoC-State%20Management-7B1FA2?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Sqflite-Local%20Storage-F57C00?style=for-the-badge"/>
<img src="https://img.shields.io/badge/Responsive-ScreenUtil-4CAF50?style=for-the-badge"/>

</p>

<p align="center">

<img src="https://img.shields.io/badge/Owasoft%20Technologies-Internship-FFC107?style=flat-square"/>
<img src="https://img.shields.io/badge/Week-07-111111?style=flat-square"/>
<img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-4CAF50?style=flat-square"/>
<img src="https://img.shields.io/badge/Status-Development-orange?style=flat-square"/>

</p>

---

# 🍔 About TastyBytes

**TastyBytes** is a modern restaurant and food-ordering application developed using **Flutter and Dart**.

The project was created during **Week 7 of my Flutter Development Internship at Owasoft Technologies**.

The application focuses on creating a smooth and engaging food-ordering experience while applying practical Flutter concepts such as:

- 🎨 Modern UI/UX
- 🧠 BLoC State Management
- 🧭 Screen Navigation
- 🎞️ Flutter Animations
- 🦸 Hero Transitions
- 📱 Responsive UI
- 🍕 Food Categories
- 🍔 Food Details
- 🛒 Cart Management
- 💳 Checkout
- 🎉 Order Success
- 📦 Order History
- 👤 Profile
- 🏗️ Feature-Based Architecture
- 🐛 Debugging & Code Improvement

---

# 🎬 App Experience

<p align="center">
  <strong>🚀 Splash → 👋 Onboarding → 🏠 Home → 🍕 Categories → 🍔 Food → 🛒 Cart → 💳 Checkout → 🎉 Success</strong>
</p>

```text
                         🍔 TASTYBYTES
                              │
                              ▼
                         🚀 SPLASH
                              │
                              ▼
                        👋 ONBOARDING
                              │
                              ▼
                         🏠 HOME
                              │
                              ▼
                        🍕 CATEGORIES
                              │
                              ▼
                       🍔 FOOD DETAILS
                              │
                              ▼
                          🛒 CART
                              │
                              ▼
                         💳 CHECKOUT
                              │
                              ▼
                        🎉 SUCCESS
                              │
                              ▼
                       📦 ORDER HISTORY
````

---

# 🎞️ Motion & Animation Showcase

TastyBytes uses Flutter's animation system to make the interface feel more interactive and polished.

### ✨ Animation Concepts Used

* 🎬 `AnimationController`
* 🌫️ `FadeTransition`
* ↕️ `SlideTransition`
* 🔍 `ScaleTransition`
* 🔄 `AnimatedContainer`
* 📈 `AnimatedScale`
* 🦸 `Hero`
* 🎯 Animation Curves
* 🎞️ Lottie animation assets

---

## 🎬 Explicit Animation Flow

```text
              📱 Screen Opens
                    │
                    ▼
          🎬 AnimationController
                    │
          ┌─────────┴─────────┐
          ▼                   ▼
       🌫️ Fade              ↕️ Slide
          │                   │
          └─────────┬─────────┘
                    ▼
             ✨ Smooth Entrance
```

Example:

```dart
AnimationController(
  vsync: this,
  duration: const Duration(milliseconds: 600),
);
```

---

## 🔄 Implicit Animation

TastyBytes uses widgets such as `AnimatedContainer` and `AnimatedScale`.

Example:

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  color: isSelected
      ? AppColors.yellow
      : AppColors.white,
)
```

When the value changes:

```text
Old Value
   ↓
Property Changes
   ↓
AnimatedContainer
   ↓
✨ Flutter animates automatically
   ↓
New Value
```

---

# 🦸 Hero Animation

Hero transitions are used to create smooth visual movement between related screens.

### 🍕 Categories → Food Details

```text
┌─────────────────┐
│ 🍕 Categories   │
│                 │
│      🍕         │
└────────┬────────┘
         │
         │ 🦸 HERO
         │
         ▼
┌─────────────────┐
│ 🍕 Food Details │
│                 │
│      🍕         │
└─────────────────┘
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

The Hero tags must match between the source and destination.

---

# 🧠 BLoC State Management

TastyBytes uses **BLoC (Business Logic Component)** for application state management.

BLoC separates the UI from application logic and provides a clear flow between user actions and UI updates.

## 🔄 BLoC Architecture

```text
                👤 USER
                   │
                   ▼
                ⚡ EVENT
                   │
                   ▼
              🧠 BLOC
                   │
                   ▼
            ⚙️ BUSINESS LOGIC
                   │
                   ▼
                📦 STATE
                   │
                   ▼
                🎨 UI
                   │
                   ▼
             🔄 REBUILD
```

### Simple BLoC Formula

```text
🎨 UI
 ↓
⚡ Event
 ↓
🧠 BLoC
 ↓
📦 State
 ↓
🎨 UI
```

---

# 🏠 Home BLoC Flow

Example category selection:

```text
👆 User taps Pizza
        │
        ▼
SelectCategoryEvent
        │
        ▼
     HomeBloc
        │
        ▼
HomeCategoryChanged
        │
        ▼
   BlocBuilder
        │
        ▼
🎨 UI Updates
```

---

# 🍕 Categories BLoC Flow

```text
👆 User selects category
          │
          ▼
SelectCategoryEvent
          │
          ▼
   CategoriesBloc
          │
          ▼
   CategorySelected
          │
          ▼
     BlocBuilder
          │
          ▼
    🎨 UI Updates
```

---

# 🛒 Cart BLoC Flow

```text
🍔 Add Food
     │
     ▼
AddCartItem
     │
     ▼
  CartBloc
     │
     ▼
 Cart State
     │
     ▼
🛒 Cart UI
```

Cart actions:

```text
➕ Increase Quantity
➖ Decrease Quantity
🗑️ Remove Item
💰 Calculate Total
```

---

# 💳 Checkout BLoC Flow

Address:

```text
📍 Enter Address
       ↓
ChangeAddress
       ↓
CheckoutBloc
       ↓
CheckoutUpdated
       ↓
🎨 UI
```

Payment:

```text
💵 Cash on Delivery
💳 Credit / Debit Card
📱 EasyPaisa
        ↓
SelectPaymentMethod
        ↓
CheckoutBloc
        ↓
CheckoutUpdated
```

---

# ✨ Main Features

## 🏠 Home

* 👋 Welcome section
* 🍕 Food categories
* 🍔 Popular food items
* 🖼️ Food visuals
* ➡️ See All categories
* 🎨 Modern restaurant interface

---

## 🍕 Categories

Available food categories include:

```text
🍕 Pizza
🍔 Burger
🍗 Chicken
🥤 Drinks
```

Users can select a category and explore its food items.

---

## 🍽️ Food Details

Users can:

* 👀 View food items
* 🍔 View food name
* 💰 View food price
* 🖼️ View food image/icon
* 🛒 Add food to cart
* ✅ Receive confirmation

---

## 🛒 Cart

The cart allows users to:

* 👀 View selected items
* ➕ Increase quantity
* ➖ Decrease quantity
* 🗑️ Remove items
* 💰 Calculate total
* ➡️ Continue to checkout

---

## 💳 Checkout

Checkout includes:

* 📍 Delivery address
* 💵 Cash on Delivery
* 💳 Credit / Debit Card
* 📱 EasyPaisa
* 🧾 Order summary
* ✅ Place Order

---

## 🎉 Order Success

After successfully placing an order:

```text
🛒 Cart
  ↓
💳 Checkout
  ↓
✅ Place Order
  ↓
🎉 Order Success
```

---

## 📦 Order History

Users can:

* 📋 View previous orders
* 👀 View order information
* 📦 Review order details

---

## 👤 Profile

Profile includes:

* 👤 User information
* ✏️ Edit Profile
* 📦 Order History
* 📍 My Address
* 🚪 Logout

---

# 🧭 Complete Navigation Flow

```text
                         🚀 SPLASH
                             │
                             ▼
                       👋 ONBOARDING
                             │
                             ▼
                       🏠 MAIN SCREEN
                             │
        ┌────────────────────┼────────────────────┐
        │                    │                    │
        ▼                    ▼                    ▼
     🏠 HOME              📦 ORDERS             🛒 CART
        │                                         │
        ▼                                         ▼
   🍕 CATEGORIES                              💳 CHECKOUT
        │                                         │
        ▼                                         ▼
 🍔 FOOD DETAILS                              🎉 SUCCESS
        │
        ▼
     🛒 CART
        │
        ▼
   💳 CHECKOUT
```

---

# 📱 Application Screens

### 🚀 Splash Screen

Application launch and TastyBytes branding.

### 👋 Onboarding Screen

Introduces the application and its food-ordering experience.

### 🏠 Home Screen

Main food discovery and navigation screen.

### 🍕 Categories Screen

Food category selection.

### 🍽️ Food Details Screen

Food items and add-to-cart functionality.

### 🛒 Cart Screen

Cart items, quantities, and total amount.

### 💳 Checkout Screen

Address, payment method, order summary, and order placement.

### 🎉 Order Success Screen

Successful order confirmation.

### 📦 Order History Screen

Previously placed orders.

### 👤 Profile Screen

User profile and account-related options.

---

# 🎨 Design System

## 🎨 Primary Colors

```text
🟨 Yellow   #FFC107
⬛ Black    #111111
⬜ White    #FFFFFF
🩶 Grey     #757575
🩶 Light    #F5F5F5
🟩 Success  #4CAF50
🟥 Error    #E53935
```

The project uses a centralized `AppColors` class for consistent UI styling.

---

# 📐 Responsive Design

The project uses **Flutter ScreenUtil** for responsive sizing.

### 🔤 Text

```dart
fontSize: 20.sp
```

### ↔️ Width

```dart
width: 100.w
```

### ↕️ Height

```dart
height: 50.h
```

### 📏 Padding

```dart
EdgeInsets.all(16.w)
```

### 🔘 Border Radius

```dart
BorderRadius.circular(15.r)
```

This allows the interface to adapt to different screen dimensions.

---

# 🏗️ Project Architecture

TastyBytes follows a **feature-based architecture**.

Each feature contains its own BLoC and screen files.

```text
Feature
│
├── 🧠 bloc
│   ├── feature_bloc.dart
│   ├── feature_event.dart
│   └── feature_state.dart
│
└── 🎨 screen
    └── feature_screen.dart
```

---

# 📂 Complete `lib` Structure

```text
lib/
│
├── main.dart
│
├── core/
│   │
│   ├── app_theme/
│   │   └── app_theme.dart
│   │
│   └── constants/
│       ├── app_colors.dart
│       └── app_constants.dart
│
└── features/
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
    ├── categories/
    │   ├── bloc/
    │   │   ├── categories_bloc.dart
    │   │   ├── categories_event.dart
    │   │   └── categories_state.dart
    │   │
    │   └── screen/
    │       └── categories_screen.dart
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
    ├── food_details/
    │   ├── bloc/
    │   │   ├── food_details_bloc.dart
    │   │   ├── food_details_event.dart
    │   │   └── food_details_state.dart
    │   │
    │   └── screen/
    │       └── food_details_screen.dart
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
    ├── mainscreen/
    │   └── screen/
    │       └── mainscreen.dart
    │
    ├── onboarding/
    │   └── screen/
    │       └── onboarding_screen.dart
    │
    ├── order_history/
    │   ├── bloc/
    │   │   ├── order_history_bloc.dart
    │   │   ├── order_history_event.dart
    │   │   └── order_history_state.dart
    │   │
    │   └── screen/
    │       └── order_history_screen.dart
    │
    ├── order_success/
    │   └── screen/
    │       └── order_success_screen.dart
    │
    ├── profile/
    │   ├── bloc/
    │   │   ├── profile_bloc.dart
    │   │   ├── profile_event.dart
    │   │   └── profile_state.dart
    │   │
    │   └── screen/
    │       └── profile_screen.dart
    │
    └── splash/
        └── screen/
            └── splash_screen.dart
```

---

# 🖼️ Assets Structure

```text
assets/
│
├── animation/
│
├── food/
│
├── logo/
│
└── onboarding/
```

### 🎞️ Animation Assets

Used for application animation experiences.

### 🍔 Food Assets

Contains food-related images.

### 🍔 Logo Assets

Contains TastyBytes branding.

### 👋 Onboarding Assets

Contains onboarding illustrations.

---

# 🧰 Technology Stack

## 📱 Mobile Development

* Flutter
* Dart
* Material Design

## 🧠 State Management

* BLoC
* `flutter_bloc`

## 🎞️ Animation

* AnimationController
* FadeTransition
* SlideTransition
* ScaleTransition
* AnimatedContainer
* AnimatedScale
* Hero
* Lottie

## 📐 Responsive UI

* Flutter ScreenUtil

## 💾 Local Storage

* Sqflite

## 🔧 Development Tools

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

Install packages:

```bash
flutter pub get
```

---

# 🚀 Getting Started

## 1️⃣ Clone Repository

```bash
git clone YOUR_REPOSITORY_URL
```

## 2️⃣ Open Project

```bash
cd resturant_app
```

## 3️⃣ Install Dependencies

```bash
flutter pub get
```

## 4️⃣ Check Flutter Environment

```bash
flutter doctor
```

## 5️⃣ Run Application

```bash
flutter run
```

---

# 📦 Build APK

Generate a release APK:

```bash
flutter build apk --release
```

APK output:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🔧 Git & GitHub Workflow

Check project status:

```bash
git status
```

Add project changes:

```bash
git add .
```

Commit changes:

```bash
git commit -m "Fix bugs and review code"
```

Push changes:

```bash
git push origin main
```

---

# 🐛 Debugging & Code Improvement

During development, different application issues were identified and resolved, including:

* 🔧 Flutter code issues
* 🧠 BLoC state-management issues
* 🧭 Navigation issues
* 🦸 Hero tag conflicts
* 🎨 UI alignment issues
* 📱 Responsive layout adjustments
* 🛒 Cart state updates
* 🧹 Code structure improvements
* ⚙️ Application functionality fixes

---

# 🎓 Learning Outcomes

This project provided practical experience in:

* 🐦 Flutter Development
* 🎯 Dart Programming
* 🧠 BLoC State Management
* ⚡ Event & State Architecture
* 🎨 UI/UX Development
* 🧭 Navigation
* 🎞️ Motion & Animation
* 🦸 Hero Transitions
* 📱 Responsive Design
* 🛒 Cart Management
* 💳 Checkout Flow
* 📦 Order Management
* 🐛 Debugging
* 🔧 Git & GitHub
* 🏗️ Feature-Based Architecture

---

# 🏢 Internship Project

## Owasoft Technologies

**Internship:** Flutter Development Internship

**Project:** TastyBytes Restaurant App

**Project Week:** Week 7

**Framework:** Flutter

**Language:** Dart

**State Management:** BLoC

**Focus:** UI, State Management, Navigation, Animation & Application Development

---

# 📅 Week 7 Development Focus

```text
             🐦 Flutter
                 │
                 ▼
             🎨 UI/UX
                 │
                 ▼
        🧠 BLoC Architecture
                 │
                 ▼
          🧭 Navigation
                 │
                 ▼
          🎞️ Animation
                 │
                 ▼
        🛒 Food Ordering
                 │
                 ▼
           🍔 TastyBytes
```

---

# 👨‍💻 About The Developer

<h2 align="center">Saud Masood</h2>

<p align="center">
  <strong>🎓 BSCS Graduate</strong>
</p>

<p align="center">
  🐦 Flutter Developer &nbsp;•&nbsp;
  🤖 AI/ML Enthusiast &nbsp;•&nbsp;
  🏗️ Software Engineering
</p>

I am a **BSCS Graduate** interested in building modern software applications and developing practical skills across **Flutter Development, Artificial Intelligence & Machine Learning, and Software Engineering**.

My development focus includes creating mobile applications with clean UI, structured architecture, state management, and practical software engineering principles.

---

# 💻 Technical Interests

```text
🐦 Flutter Development
🎯 Dart
📱 Mobile Application Development

🤖 Artificial Intelligence
🧠 Machine Learning
🧬 Deep Learning

🏗️ Software Engineering
🌐 Web Development
🔥 Firebase
🗄️ Databases

🔧 Git
🐙 GitHub
```

---

# 🛠️ Technical Skills

### 📱 Mobile

* Flutter
* Dart
* Firebase
* Sqflite

### 🤖 AI / ML

* Python
* TensorFlow
* Keras
* OpenCV
* MediaPipe
* TensorFlow Lite

### 🌐 Web

* HTML
* CSS
* JavaScript
* React.js
* Node.js
* Express.js
* MongoDB
* SQL

### 🔧 Tools

* Git
* GitHub
* VS Code
* Android Studio
* Google Colab
* Kaggle

---

# 📞 Contact

<p align="center">

📧 <strong>Email:</strong> [YOUR_EMAIL@example.com](mailto:YOUR_EMAIL@example.com)

<br><br>

📱 <strong>Phone:</strong> +92 XXX XXXXXXX

<br><br>

🐙 <strong>GitHub:</strong> github.com/SaudMasood

</p>

> Replace the email and phone placeholders with the contact details you want to publish on GitHub.

---

# 🔮 Future Improvements

Possible future versions can include:

* 🔐 Firebase Authentication
* ☁️ Cloud Firestore
* 🔔 Push Notifications
* 🌐 REST API Integration
* 💳 Online Payment Gateway
* 🔎 Food Search
* ❤️ Favorite Foods
* ⭐ Reviews & Ratings
* 👨‍🍳 Restaurant Management
* 🛠️ Admin Dashboard
* ☁️ Cloud Food Images
* 📍 Real-Time Order Tracking

---

# 📊 Project Information

| 📌 Category         | Details                |
| ------------------- | ---------------------- |
| 🍔 Project          | TastyBytes             |
| 🏢 Organization     | Owasoft Technologies   |
| 🎓 Internship       | Flutter Development    |
| 📅 Week             | Week 7                 |
| 📱 Framework        | Flutter                |
| 🎯 Language         | Dart                   |
| 🧠 State Management | BLoC                   |
| 💾 Local Storage    | Sqflite                |
| 📐 Responsive UI    | ScreenUtil             |
| 🎞️ Animation       | Flutter Animation APIs |
| 🦸 Transitions      | Hero                   |
| 🧭 Navigation       | Flutter Navigator      |
| 🔧 Version Control  | Git & GitHub           |
| 📱 Platform         | Android / iOS          |

---

# 📌 Project Status

<p align="center">

🟢 <strong>Development Project</strong>

</p>

TastyBytes was developed as part of my **Week 7 Flutter Development Internship at Owasoft Technologies**.

The project demonstrates practical implementation of **Flutter UI, BLoC state management, responsive design, navigation, animations, cart management, checkout functionality, and feature-based architecture**.

---

# ❤️ Built With Flutter

<p align="center">

🐦 Flutter + 🎯 Dart + 🧠 BLoC + 🎞️ Animations

</p>

<p align="center">

# 🍔 TastyBytes

### **Taste • Order • Enjoy 😋**

Built with ❤️ by **Saud Masood**

</p>

---

<p align="center">

⭐ <strong>If you find this project useful, consider giving it a star!</strong> ⭐

</p>
```
