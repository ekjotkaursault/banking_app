# 💰 Simple Banking Application (Flutter)

###  Developed by [**Ekjot Kaur**](https://github.com/ekjotkaursault)

A modern, mobile-first **Banking Application** built entirely with **Flutter** and **local JSON data integration**.
This app was developed as part of **Test 2 – Part B** for my Mobile Development course, demonstrating clean UI/UX design, structured navigation, and dynamic data rendering.

live demo link: https://ekjotkaursault.github.io/banking_app/

---

##  Overview

The **Simple Banking App** replicates a basic digital banking experience that allows users to:

*  View a **personalized welcome screen** with today’s date
*  Browse their **bank accounts** dynamically loaded from a local JSON file
*  Access detailed **transaction history** for each account
*  Enjoy a **smooth and intuitive navigation** (Welcome ➜ Accounts ➜ Transactions)

This project highlights my understanding of:

* Flutter architecture (`lib`, `assets`, `pubspec.yaml`)
* **Stateful and stateless widgets**
* Navigation using `Navigator.push()` and `Navigator.pop()`
* JSON parsing with `dart:convert` and `rootBundle.loadString()`
* Material 3 theming and responsive UI design

---

##  My Work & Implementation

### 1. Welcome Screen

* Displays **bank logo 🏦**, welcome text, and **dynamic date**
* Uses a **gradient AppBar** and a minimal, centered layout
* Features a “View Accounts” button that navigates to the account list screen

### 2. Account List Screen

* Parses **local JSON data** for all bank accounts
* Displays each account inside a **Card widget** with rounded corners & shadows
* Shows account holder name, **masked account number**, and balance
* Includes an active “View Transactions” button for navigation

### 3. Transaction Details Screen

* Displays all **related transactions** for a selected account
* Differentiates **Deposits (green ↑)** and **Withdrawals (red ↓)**
* Allows smooth back navigation (Transactions ➜ Accounts ➜ Welcome)

### 4. UI Design & Theme

* Consistent **Indigo-blue palette** using Material 3 color scheme
* Rounded components, subtle shadows, and gradient backgrounds
* Fully **responsive** and optimized for Android, iOS, and web

---

##  Project Structure:

```
lib/
 ├── main.dart             # Main Flutter logic and screen navigation
assets/
 ├── accounts.json         # Local account and transaction data
pubspec.yaml               # Flutter dependencies and asset declarations
```

---

##  How to Run?

1. **Clone this repository**

   ```bash
   git clone https://github.com/ekjotkaursault/banking_app.git
   cd banking_app
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   flutter run
   ```

>  Works best in Android Emulator or Flutter Web (Chrome).

---

## 📱 Screens Overview

| Screen             | Description                                               |
| ------------------ | --------------------------------------------------------- |
| **Welcome Screen** | Displays bank logo 🏦, welcome text, and today’s date     |
| **Account List**   | Shows user accounts (Checking, Savings) from JSON         |
| **Transactions**   | Displays deposits/withdrawals with icons and color coding |

---

##  Technologies Used

* **Flutter** (SDK ≥ 3.0)
* **Dart**
* **Material Design 3**
* **Local JSON Integration**

---

##  External Resources Used, that i used for my understanding:
Additionally, i have used: **CSD228 Unit 4G Test2 Screen Design **, this is powerpoint presentation, that was available at the **brightspace** and understand from it.


| Resource                                              | Purpose                              |
| ----------------------------------------------------- | ------------------------------------ |
| [Flutter Documentation](https://docs.flutter.dev/)    | Reference for widget implementation  |
| [Material Design Guidelines](https://m3.material.io/) | UI/UX and color system guidance      |
| [intl Package](https://pub.dev/packages/intl)         | Used for date formatting             |
| [Icons8](https://icons8.com)                          | Used for app logo inspiration        |
| [Stack Overflow](https://stackoverflow.com/)          | Debugging JSON and navigation issues |

---

##  Learning Outcomes:

Through this project, I gained hands-on experience with:

* Managing app navigation using Flutter routes
* Parsing and displaying structured JSON data
* Applying Material Design 3 for consistent visuals
* Structuring and documenting code professionally for GitHub

---

## Future Enhancements:

* Add **search functionality** for transactions
* Include **dark mode toggle**
* Connect to a **live database or Firebase** instead of local JSON
* Add **animated transitions** for better UX

---

##  Conclusion

This Flutter banking app demonstrates my ability to combine **front-end design**, **JSON data handling**, and **navigation management** into a cohesive mobile experience.
It reflects my growing expertise in mobile development and clean, structured Flutter practices.

---

