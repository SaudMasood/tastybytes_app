# 🍔 TastyBytes — Flutter Restaurant & Food Ordering App

<p align="center">
  <img src="assets/logo/logo.png" width="170" alt="TastyBytes Logo"/>
</p>

<h1 align="center">🍔 TastyBytes</h1>

<p align="center">
  <strong>A Modern • Responsive • Animated Restaurant Food Ordering Application</strong>
</p>

<p align="center">
  Built with ❤️ using <strong>Flutter & Dart</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-Framework-02569B?style=for-the-badge&logo=flutter&logoColor=white"/>
  <img src="https://img.shields.io/badge/Dart-Language-0175C2?style=for-the-badge&logo=dart&logoColor=white"/>
  <img src="https://img.shields.io/badge/BLoC-State%20Management-7B1FA2?style=for-the-badge"/>
  <img src="https://img.shields.io/badge/ScreenUtil-Responsive%20UI-4CAF50?style=for-the-badge"/>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Owasoft%20Technologies-Flutter%20Internship-FFC107?style=flat-square"/>
  <img src="https://img.shields.io/badge/Internship-Week%207-111111?style=flat-square"/>
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-4CAF50?style=flat-square"/>
  <img src="https://img.shields.io/badge/Status-Development-orange?style=flat-square"/>
</p>

---

# 📖 Project Overview

**TastyBytes** is a Flutter-based restaurant and food-ordering application created as part of my **Week 7 Flutter Development Internship at Owasoft Technologies**.

The project focuses on building a complete food-ordering experience while applying practical Flutter development concepts such as:

- 🐦 Flutter & Dart
- 🧠 BLoC state management
- 🏗️ Feature-based architecture
- 🎨 Modern UI/UX
- 📱 Responsive layouts
- 🧭 Screen navigation
- 🎞️ Explicit animations
- 🔄 Implicit animations
- 🦸 Hero transitions
- 🛒 Cart management
- 💳 Checkout flow
- 📦 Order history
- 👤 Profile management
- 💾 Local data handling
- 🐛 Debugging and code review

---

# 🍔 What is TastyBytes?

TastyBytes provides a simple restaurant ordering journey:

```text
🚀 Launch App
     ↓
👋 Onboarding
     ↓
🏠 Home
     ↓
🍕 Select Category
     ↓
🍽️ Browse Food
     ↓
🛒 Add to Cart
     ↓
💳 Checkout
     ↓
🎉 Order Success
     ↓
📦 Order History
````

The application also provides a bottom navigation experience:

```text
┌──────────┬──────────┬──────────┬──────────┐
│ 🏠 Home  │ 📦 Orders│ 🛒 Cart  │ 👤 Profile│
└──────────┴──────────┴──────────┴──────────┘
```

---

# 🎯 Project Goals

The main goals of the project were to practice and implement:

### 📱 Flutter Application Development

Build a complete multi-screen restaurant application using Flutter.

### 🧠 State Management

Use BLoC to manage application states and user interactions.

### 🎨 UI Development

Create a modern restaurant interface using reusable Flutter UI patterns.

### 🎞️ Motion Design

Use Flutter animation APIs to make screen interactions more dynamic.

### 🏗️ Architecture

Organize the project using a feature-based structure.

### 🧭 Navigation

Connect the application screens into a complete user journey.

---

# ✨ Core Features

## 🏠 Home

The Home screen acts as the main food discovery area.

### Includes:

* 👋 Welcome section
* 🍕 Food categories
* 🍔 Popular food
* 🖼️ Food visuals
* ➡️ See All
* 🛒 Cart access
* 🎨 Restaurant-themed UI

---

# 🍕 Categories

Users can browse food according to category.

### Available Categories

```text
🍕 Pizza
🍔 Burger
🍗 Chicken
🥤 Drinks
```

Category selection is handled through BLoC state management.

```text
User
 ↓
Tap Category
 ↓
SelectCategoryEvent
 ↓
CategoriesBloc
 ↓
CategorySelected
 ↓
BlocBuilder
 ↓
Updated UI
```

---

# 🍽️ Food Details

The Food Details screen displays the food available inside a selected category.

### User Actions

```text
👀 View Food
   ↓
🍔 Select Food
   ↓
💰 View Price
   ↓
🛒 Add To Cart
   ↓
✅ Confirmation
```

Food information includes:

* 🍔 Name
* 💰 Price
* 🖼️ Food icon/image
* 🛒 Add to cart action

---

# 🛒 Cart Management

The Cart screen manages selected food items.

### Cart Operations

```text
➕ Increase Quantity
➖ Decrease Quantity
🗑️ Remove Item
💰 Calculate Total
💳 Continue Checkout
```

Cart state is managed through `CartBloc`.

```text
🍔 Food Details
      ↓
AddCartItem
      ↓
🧠 CartBloc
      ↓
📦 CartState
      ↓
🛒 Cart Screen
```

---

# 💳 Checkout

The Checkout screen provides the final order information.

### Checkout Components

* 📍 Delivery address
* 🧾 Order summary
* 💵 Cash on Delivery
* 💳 Credit / Debit Card
* 📱 EasyPaisa
* ✅ Place Order

### Checkout Flow

```text
🛒 Cart
   ↓
💳 Checkout
   ↓
📍 Address
   ↓
💰 Payment Method
   ↓
🧾 Review Order
   ↓
✅ Place Order
   ↓
🎉 Success
```

---

# 🎉 Order Success

After an order is placed, the user is taken to the Order Success screen.

```text
🛒 Cart
   ↓
💳 Checkout
   ↓
✅ Place Order
   ↓
🎉 Order Success
   ↓
🏠 Back To Home
```

---

# 📦 Order History

The Order History screen allows users to see their previous orders.

It provides:

* 📋 Order list
* 📦 Order information
* 💰 Order details
* 👀 Expandable order information

---

# 👤 Profile

The Profile screen provides account-related functionality.

### Includes

* 👤 Profile information
* ✏️ Edit Profile
* 📦 Order History
* 📍 My Address
* 🚪 Logout

---

# 🎞️ Animation & Motion Design

Animation is an important part of the TastyBytes UI.

The application uses both **explicit and implicit Flutter animations**.

---

# 🎬 Animation Types Used

| Animation              | Usage                        |
| ---------------------- | ---------------------------- |
| 🌫️ FadeTransition     | Smooth widget entrance       |
| ↕️ SlideTransition     | Content movement             |
| 🔍 ScaleTransition     | Success/attention animations |
| 🔄 AnimatedContainer   | Animated UI property changes |
| 📈 AnimatedScale       | Navigation/icon scaling      |
| 🦸 Hero                | Screen-to-screen transitions |
| 🎞️ Lottie             | JSON-based animation assets  |
| 🎯 Curves              | Natural animation movement   |
| 🎬 AnimationController | Explicit animation control   |

---

# 🌫️ Fade Animation

`FadeTransition` is used when content needs to appear smoothly.

```dart
FadeTransition(
  opacity: fadeAnimation,
  child: Container(
    child: Text('TastyBytes'),
  ),
)
```

### Motion

```text
Invisible
   ↓
Opacity 0%
   ↓
Opacity 50%
   ↓
Opacity 100%
   ↓
✨ Visible
```

---

# ↕️ Slide Animation

`SlideTransition` is used to bring content into the screen.

```dart
SlideTransition(
  position: slideAnimation,
  child: Container(
    child: Text('Welcome'),
  ),
)
```

### Motion

```text
        Content
           ↓
           ↓
           ↓
      ┌─────────┐
      │  UI     │
      └─────────┘
           ↑
      Final Position
```

---

# 🔍 Scale Animation

Scale animation is useful for success screens and important UI elements.

```text
Small
  ↓
Scale
  ↓
Normal Size
  ↓
✨ Appears
```

This creates a visual emphasis without changing the application's functionality.

---

# 🔄 AnimatedContainer

`AnimatedContainer` is used for automatic transitions when a property changes.

Example:

```dart
AnimatedContainer(
  duration: const Duration(milliseconds: 300),
  color: isSelected
      ? AppColors.yellow
      : AppColors.white,
)
```

### Example

```text
Before Selection
┌─────────────────┐
│ 🍕 Pizza        │
│ White           │
└─────────────────┘

        ↓ TAP

After Selection
┌─────────────────┐
│ 🍕 Pizza        │
│ Yellow          │
└─────────────────┘

       ✨ Smooth
      transition
```

---

# 📈 AnimatedScale

The bottom navigation uses animated scaling to provide visual feedback when navigation items change.

```dart
AnimatedScale(
  scale: 1.8,
  duration: const Duration(milliseconds: 300),
  child: Icon(Icons.home),
)
```

### Navigation Motion

```text
🏠 Home
   ↓
Selected
   ↓
📈 Scale Up
   ↓
✨ Visual Feedback
```

The same interaction pattern is used for:

* 🏠 Home
* 📦 Orders
* 🛒 Cart
* 👤 Profile

---

# 🦸 Hero Transition

Hero animation connects related UI elements across routes.

### Categories → Food Details

```text
┌────────────────────┐
│    🍕 Categories   │
│                    │
│        🍕          │
└─────────┬──────────┘
          │
          │ 🦸 HERO
          │
          ▼
┌────────────────────┐
│  🍕 Food Details   │
│                    │
│        🍕          │
└────────────────────┘
```

The source:

```dart
Hero(
  tag: 'Details_$name',
  child: Icon(
    icon,
  ),
)
```

The destination uses the matching tag:

```dart
Hero(
  tag: 'Details_${widget.category}',
  child: Icon(
    Icons.local_pizza,
  ),
)
```

---

# 🛒 Cart Hero Transition

The cart FloatingActionButton uses Flutter's built-in Hero behavior.

```dart
FloatingActionButton(
  heroTag: 'cart',
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const CartScreen(),
      ),
    );
  },
  child: const Icon(
    Icons.shopping_cart,
  ),
)
```

The `heroTag` allows the FAB to participate in a route transition without wrapping it inside another Hero.

---

# 🎞️ Lottie Animations

The project contains animation assets inside:

```text
assets/
└── animation/
```

Example animation files include:

```text
Bike.json
Burger.json
```

Lottie allows JSON-based animations to be displayed inside Flutter applications.

Example:

```dart
Lottie.asset(
  'assets/animation/Burger.json',
)
```

### Lottie Flow

```text
JSON Animation
      ↓
Lottie Package
      ↓
Flutter Widget
      ↓
🎞️ Animated UI
```

---

# 🧠 BLoC Architecture

The project uses BLoC to keep UI and application logic organized.

### Architecture

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

### Basic Formula

```text
UI
 ↓
Event
 ↓
BLoC
 ↓
State
 ↓
UI
```

---

# 🏠 Home BLoC

```text
👆 Select Category
       ↓
SelectCategoryEvent
       ↓
HomeBloc
       ↓
HomeCategoryChanged
       ↓
BlocBuilder
       ↓
🎨 Home UI Updates
```

---

# 🍕 Categories BLoC

```text
👆 Select Category
       ↓
SelectCategoryEvent
       ↓
CategoriesBloc
       ↓
CategorySelected
       ↓
BlocBuilder
       ↓
🍕 Updated Category UI
```

---

# 🛒 Cart BLoC

```text
🍔 Add Item
     ↓
AddCartItem
     ↓
CartBloc
     ↓
CartState
     ↓
🛒 Cart UI
```

---

# 💳 Checkout BLoC

```text
📍 Address
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
💵 Cash
💳 Card
📱 EasyPaisa
     ↓
SelectPaymentMethod
     ↓
CheckoutBloc
     ↓
CheckoutUpdated
```

---

# 🏗️ Feature-Based Architecture

The application is organized feature-by-feature.

Each feature contains its own:

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

This keeps UI and state-management code separated.

---

# 📂 Complete Project Structure

```text
lib/
│
├── main.dart
│
├── core/
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
│   ├── Bike.json
│   └── Burger.json
│
├── food/
│   ├── burger.png
│   ├── pizza.png
│   ├── pasta.png
│   └── drink.png
│
├── logo/
│   └── logo.png
│
└── onboarding/
    ├── food.png
    ├── delivery.png
    └── enjoy.png
```

---

# 🎨 App Theme

The application uses a centralized theme system.

```text
core/
└── app_theme/
    └── app_theme.dart
```

This allows the application theme to be managed separately from individual screens.

---

# 🎨 Color Management

```text
core/
└── constants/
    └── app_colors.dart
```

Main colors:

```text
🟨 Yellow  #FFC107
⬛ Black   #111111
⬜ White   #FFFFFF
🩶 Grey    #757575
🩶 Light   #F5F5F5
🟩 Success #4CAF50
🟥 Error   #E53935
```

---

# 📱 Responsive UI

TastyBytes uses `flutter_screenutil` to support responsive layouts.

### Text

```dart
fontSize: 20.sp
```

### Width

```dart
width: 100.w
```

### Height

```dart
height: 50.h
```

### Padding

```dart
EdgeInsets.all(16.w)
```

### Radius

```dart
BorderRadius.circular(15.r)
```

---

# 🧭 Navigation Architecture

The application uses Flutter navigation to connect individual features.

Example:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const CartScreen(),
  ),
);
```

### Navigation Pattern

```text
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
```

---

# 📱 Bottom Navigation

The MainScreen provides four primary sections:

```text
🏠 Home
📦 Orders
🛒 Cart
👤 Profile
```

The navigation icons use animated scaling for visual feedback.

```text
Unselected
   ↓
Normal Size
   ↓
Selected
   ↓
📈 Scale Animation
```

---

# 💾 Local Data Management

The project includes local data handling with **Sqflite**.

Sqflite can be used for storing structured application data locally.

```text
Flutter App
    ↓
BLoC
    ↓
Local Data
    ↓
Sqflite
    ↓
Local Database
```

---

# 🛠️ Technology Stack

## 📱 Mobile

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

## 🔧 Tools

* Android Studio
* VS Code
* Git
* GitHub

---

# 📦 Dependencies

Main packages used in the project:

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

# 🚀 Getting Started

## 1️⃣ Clone the Repository

```bash
git clone YOUR_REPOSITORY_URL
```

## 2️⃣ Open the Project

```bash
cd resturant_app
```

## 3️⃣ Install Dependencies

```bash
flutter pub get
```

## 4️⃣ Check Flutter Setup

```bash
flutter doctor
```

## 5️⃣ Run the Application

```bash
flutter run
```

---

# 📦 Build Release APK

```bash
flutter build apk --release
```

Generated APK:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

# 🔧 Git Workflow

Check status:

```bash
git status
```

Add changes:

```bash
git add .
```

Commit:

```bash
git commit -m "Fix bugs and review code"
```

Push:

```bash
git push origin main
```

---

# 🐛 Development & Debugging

During development, the project involved continuous testing, debugging, and code review.

Areas worked on include:

* 🔧 Flutter code fixes
* 🧠 BLoC state issues
* 🧭 Navigation issues
* 🦸 Hero transition issues
* 🎨 UI alignment
* 📱 Responsive layouts
* 🛒 Cart state updates
* ⚙️ Screen integration
* 🧹 Code structure improvements

---

# 🎓 Week 7 Internship Learning

The project provided practical experience with:

```text
🐦 Flutter
   ↓
🎨 UI Development
   ↓
🧠 BLoC State Management
   ↓
🧭 Navigation
   ↓
🎞️ Animation
   ↓
🛒 Cart
   ↓
💳 Checkout
   ↓
🍔 Complete Restaurant App
```

### Key Learning Areas

* Flutter screen development
* Dart programming
* BLoC architecture
* Events and states
* `BlocBuilder`
* `BlocProvider`
* Navigation
* Hero animations
* Explicit animations
* Implicit animations
* Lottie animations
* Responsive UI
* Local data management
* Git and GitHub
* Debugging
* Code review

---

# 🏢 Internship Information

## Owasoft Technologies

**Internship:** Flutter Development Internship

**Project:** TastyBytes Restaurant App

**Project Week:** Week 7

**Framework:** Flutter

**Programming Language:** Dart

**State Management:** BLoC

**Main Focus:**

```text
🎨 UI
🧠 BLoC
🧭 Navigation
🎞️ Animation
📱 Responsive Design
🛒 Food Ordering
```

---

# 👨‍💻 Developer

## Saud Masood

🎓 **BSCS Graduate**

🐦 **Flutter Developer**

🤖 **AI/ML Enthusiast**

🏗️ **Software Engineering**

I am a **BSCS Graduate** interested in building modern software applications and developing practical skills in:

* 🐦 Flutter Development
* 🤖 Artificial Intelligence
* 🧠 Machine Learning
* 🏗️ Software Engineering
* 🌐 Web Development
* 📱 Mobile Application Development

---

# 💻 Technical Skills

### 📱 Mobile Development

* Flutter
* Dart
* Firebase
* Sqflite

### 🤖 AI / Machine Learning

* Python
* TensorFlow
* Keras
* OpenCV
* MediaPipe
* TensorFlow Lite

### 🌐 Web Development

* HTML
* CSS
* JavaScript
* React.js
* Node.js
* Express.js
* MongoDB
* SQL

### 🛠️ Development Tools

* Git
* GitHub
* VS Code
* Android Studio
* Google Colab
* Kaggle

---

# 📞 Contact

<p align="center">

📧 <strong>Email</strong><br>
saudmasood974@gmail.com
<br><br>

📱 <strong>Phone</strong><br>
+93 3065050974
<br><br>

🐙 <strong>GitHub</strong><br>
github.com/SaudMasood

</p>

> Replace the email and phone placeholders with the contact details you want to make public.

---

# 🔮 Future Improvements

Future versions of TastyBytes could include:

* 🔐 Firebase Authentication
* ☁️ Firebase Firestore
* 🔔 Push Notifications
* 🌐 REST API integration
* 💳 Online payment gateway
* 🔎 Food search
* ❤️ Favorite foods
* ⭐ Ratings and reviews
* 🏪 Restaurant management
* 🛠️ Admin dashboard
* ☁️ Cloud-based food images
* 📍 Real-time order tracking
* 👨‍🍳 Restaurant/admin features

---

# 📊 Project Summary

| Category            | Details                |
| ------------------- | ---------------------- |
| 🍔 Application      | TastyBytes             |
| 🏢 Organization     | Owasoft Technologies   |
| 🎓 Internship       | Flutter Development    |
| 📅 Project          | Week 7                 |
| 📱 Framework        | Flutter                |
| 🎯 Language         | Dart                   |
| 🧠 State Management | BLoC                   |
| 💾 Database         | Sqflite                |
| 📐 Responsive UI    | ScreenUtil             |
| 🎞️ Animation       | Flutter Animation APIs |
| 🦸 Transition       | Hero                   |
| 🎬 Motion           | Explicit + Implicit    |
| 🎞️ JSON Animation  | Lottie                 |
| 🧭 Navigation       | Flutter Navigator      |
| 🔧 Version Control  | Git & GitHub           |
| 📱 Platform         | Android / iOS          |

---

# 📌 Project Status

<p align="center">

🟢 <strong>Week 7 Internship Project</strong>

</p>

TastyBytes is a practical Flutter restaurant application developed during my **Week 7 Flutter Development Internship at Owasoft Technologies**.

The project demonstrates the implementation of a complete food-ordering application with **modern UI, BLoC state management, responsive layouts, navigation, motion animations, Hero transitions, cart management, checkout, order history, and profile functionality**.

---

# ❤️ Built With Flutter

<p align="center">

🐦 Flutter  • 
🎯 Dart  • 
🧠 BLoC  • 
🎞️ Animation  • 
📱 Responsive UI

</p>

<p align="center">

# 🍔 TastyBytes

### **Taste • Order • Enjoy 😋**

Built with ❤️ by **Saud Masood**

</p>

---

<p align="center">

⭐ <strong>If you like this project, consider giving it a star!</strong> ⭐

</p>
```
