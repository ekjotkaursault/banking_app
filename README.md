#  Simple Banking Application (Flutter)

### Developed by [Ekjot Kaur](https://github.com/ekjotkaursault)

A modern, mobile-first **banking application** built entirely with **Flutter** and local **JSON data integration**.  
This project demonstrates effective UI design, clean navigation flow, and seamless data handling — designed as part of **Test 2 – Part B** of my Flutter course.

---

##  Overview
The **Simple Banking App** simulates a real-world digital banking experience.  
It allows users to:
- View a personalized welcome screen with today’s date
- Browse their bank accounts dynamically loaded from JSON
- Access detailed transaction history for each account
- Navigate smoothly between all pages (Welcome ➜ Accounts ➜ Transactions)

This project was built to demonstrate my understanding of:
- Flutter app structure (`lib`, `assets`, `pubspec.yaml`)
- Navigation between screens using `Navigator.push()` and `Navigator.pop()`
- JSON parsing using Dart’s `dart:convert` and `rootBundle`
- Clean UI design using Material 3

---

##  My Work & Implementation
 I personally designed and implemented:
1. **Welcome Screen**
   - Gradient AppBar with icon and title centered precisely  
   - Dynamic date generation (`DateTime.now()`)
   - Custom gradient body background with centered layout  
   - Navigation button (“View Accounts”) leading to account list  

2. **Account List Screen**
   - Parsed and displayed accounts using a local JSON file  
   - Organized data into Cards with padding, shadows, and rounded corners  
   - Showed holder name, masked account number, and balance  
   - Activated “View Transactions” buttons with navigation for each account  

3. **Transaction Details Screen**
   - Displayed all related transactions dynamically from JSON  
   - Used colors and icons to differentiate deposits and withdrawals  
   - Implemented smooth back navigation (Transactions ➜ Accounts ➜ Welcome)  

4. **User Interface & Theme**
   - Used Material 3 design principles  
   - Consistent Indigo color palette  
   - Gradient AppBar + rounded corners for modern look  
   - Subtle shadows and responsive layout  

---

##  Project Structure

lib/
┗ main.dart → main Flutter logic & screen navigation
assets/
┗ accounts.json → local data for accounts and transactions
pubspec.yaml → Flutter dependencies and asset configuration

-----------------------------------------
### How to Run

Clone this repository:

git clone https://github.com/ekjotkaursault/banking_app.git
cd banking_app


Get dependencies:

flutter pub get


Run the app:

flutter run


Works best in Android Emulator or Flutter Web (Chrome).

---

### Screens Overview

Welcome Screen:

Shows bank logo 🏦, welcome text, and date

Account List:

Displays user’s accounts (Checking, Savings)

Transactions:

Lists all transactions for selected account with amount formatting


