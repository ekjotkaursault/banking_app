// 🏦 Simple Banking Application using Flutter
// Author: Ekjot Kaur
// --------------------------------------------------------------
// Description:
// This mobile banking app simulates a simple bank system using Flutter.
// It loads account and transaction details from a local JSON file
// and demonstrates navigation between three screens:
//    1. Welcome Screen
//    2. Account List Screen
//    3. Transaction Details Screen
// --------------------------------------------------------------

import 'dart:convert'; // For reading and parsing JSON data
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle; // To load local assets

// -----------------------------------------------------------------------------
//  MAIN FUNCTION - Entry Point
// -----------------------------------------------------------------------------
void main() {
  // runApp() is the root of every Flutter app.
  // It inflates the widget tree and starts the app execution.
  runApp(const BankingApp());
}

// -----------------------------------------------------------------------------
// ROOT WIDGET - Defines global theme and entry page
// -----------------------------------------------------------------------------
class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Banking App',
      debugShowCheckedModeBanner: false, // Removes debug banner
      theme: ThemeData(
        // Defines app-wide color scheme
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true, // Enables modern Material 3 design
      ),
      home: const WelcomePage(), // The first page of the app
    );
  }
}

// -----------------------------------------------------------------------------
//  PAGE 1: WELCOME PAGE
// Description:
// Displays a friendly greeting with today’s date and a button to navigate
// to the Account List page. Includes a gradient header and background.
// -----------------------------------------------------------------------------
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  // Helper function to format and display today’s date as YYYY-MM-DD
  String _getTodayDate() {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ----------------- APP BAR -----------------
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Container(
          // Adds a beautiful gradient background to the AppBar
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF5B7FFF), Color(0xFF6EE2F5)], // Indigo → Aqua
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 4),
              ),
            ],
          ),

          // Centered "Welcome" title row (icon + text)
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.account_balance, color: Colors.white, size: 26),
                    SizedBox(width: 8),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      // ----------------- BODY -----------------
      body: Container(
        // Soft gradient background for the welcome screen
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8F9FF), Color(0xFFE6E9F0)],
          ),
        ),

        // Centers the content both vertically and horizontally
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("🏦", style: TextStyle(fontSize: 90)), // Bank emoji
                const SizedBox(height: 15),
                const Text(
                  "Welcome to Simple Banking",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // Displays current date dynamically
                Text(
                  "Today's Date: ${_getTodayDate()}",
                  style: const TextStyle(color: Colors.black87),
                ),
                const SizedBox(height: 25),
                // Button to navigate to Account List Page
                FilledButton.tonal(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AccountListPage()),
                    );
                  },
                  child: const Text("View Accounts"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
//  PAGE 2: ACCOUNT LIST PAGE
// Description:
// Displays a scrollable list of bank accounts loaded from a JSON file.
// Each account card shows the holder’s name, masked account number, and balance.
// -----------------------------------------------------------------------------
class AccountListPage extends StatefulWidget {
  const AccountListPage({super.key});

  @override
  State<AccountListPage> createState() => _AccountListPageState();
}

class _AccountListPageState extends State<AccountListPage> {
  late Future<List<Account>> accountsFuture;

  @override
  void initState() {
    super.initState();
    // Load JSON data asynchronously when the page starts
    accountsFuture = _loadAccounts();
  }

  // Reads accounts data from assets/accounts.json
  Future<List<Account>> _loadAccounts() async {
    final jsonString = await rootBundle.loadString('assets/accounts.json');
    final jsonData = json.decode(jsonString);
    final list = (jsonData['accounts'] as List)
        .map((acc) => Account.fromJson(acc))
        .toList();

    // Allow all accounts to access their transaction history
    for (final a in list) {
      a.allowTransactions = true;
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar for Account List Page
      appBar: AppBar(
        title: const Text('Account List'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // FutureBuilder waits for async JSON loading
      body: FutureBuilder<List<Account>>(
        future: accountsFuture,
        builder: (context, snap) {
          // Show loading indicator while data is loading
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Handle case when no data is found
          if (!snap.hasData || snap.data!.isEmpty) {
            return const Center(child: Text("No account data found."));
          }

          final accounts = snap.data!;

          // Builds a card for each account
          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: accounts.length,
            itemBuilder: (context, i) {
              final acc = accounts[i];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${acc.type} (${acc.id})",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text("Holder: ${acc.holder}"),
                      Text("Account No: ${acc.number}"),
                      const SizedBox(height: 6),
                      Text("Balance: \$${acc.balance.toStringAsFixed(2)}",
                          style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 10),

                      // Button to open Transactions Page
                      Align(
                        alignment: Alignment.centerRight,
                        child: FilledButton.tonalIcon(
                          icon: const Icon(Icons.list_alt_rounded),
                          label: const Text("View Transactions"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TransactionsPage(account: acc),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// -----------------------------------------------------------------------------
//  PAGE 3: TRANSACTIONS PAGE
// Description:
// Displays the list of recent transactions for a specific account.
// Uses icons and colors to distinguish deposits (green) and withdrawals (red).
// -----------------------------------------------------------------------------
class TransactionsPage extends StatelessWidget {
  final Account account;
  const TransactionsPage({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${account.type} Transactions"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Displays account summary at the top
            Card(
              color: Colors.indigo.shade50,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text("${account.type} (${account.id})"),
                subtitle: Text(
                  "Holder: ${account.holder}\nAccount: ${account.number}",
                ),
                isThreeLine: true,
                trailing: Text(
                  "\$${account.balance.toStringAsFixed(2)}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Transaction History",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Divider(),

            // List of all transactions in scrollable format
            Expanded(
              child: ListView.builder(
                itemCount: account.transactions.length,
                itemBuilder: (context, index) {
                  final t = account.transactions[index];
                  return ListTile(
                    leading: Icon(
                      // Arrow direction and color depend on deposit/withdrawal
                      t.amount >= 0 ? Icons.arrow_downward : Icons.arrow_upward,
                      color: t.amount >= 0 ? Colors.green : Colors.red,
                    ),
                    title: Text(t.desc),
                    subtitle: Text(t.date),
                    trailing: Text(
                      // Adds "+" sign before positive amounts
                      (t.amount >= 0 ? "+" : "") +
                          "\$${t.amount.toStringAsFixed(2)}",
                      style: TextStyle(
                        color: t.amount >= 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Button to return back to Account List
            FilledButton.icon(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back to Accounts"),
            ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
//  DATA MODEL CLASSES
// Description:
// Define the structure of Account and Transaction objects that map directly
// to the fields in the local JSON file (assets/accounts.json).
// -----------------------------------------------------------------------------
class Account {
  String id; // Account ID (e.g., CHK-001)
  String type; // Account type (Checking, Savings, etc.)
  String holder; // Account holder name
  String number; // Masked account number
  double balance; // Current account balance
  bool allowTransactions; // Controls whether transactions are viewable
  List<Transaction> transactions; // List of all related transactions

  Account({
    required this.id,
    required this.type,
    required this.holder,
    required this.number,
    required this.balance,
    required this.allowTransactions,
    required this.transactions,
  });

  // Factory constructor to create Account objects from JSON data
  factory Account.fromJson(Map<String, dynamic> json) {
    final txns = (json['transactions'] as List)
        .map((t) => Transaction.fromJson(t))
        .toList();

    return Account(
      id: json['id'],
      type: json['type'],
      holder: json['holder'],
      number: json['number'],
      balance: (json['balance'] as num).toDouble(),
      allowTransactions: (json['allowTransactions'] ?? true) as bool,
      transactions: txns,
    );
  }
}

// Represents a single transaction record (deposit or withdrawal)
class Transaction {
  String date; // Date of the transaction
  String desc; // Short description (e.g., Salary, Grocery)
  double amount; // Amount of transaction (+ for deposit, - for withdrawal)

  Transaction({required this.date, required this.desc, required this.amount});

  // Factory constructor to convert JSON into a Transaction object
  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      date: json['date'],
      desc: json['desc'],
      amount: (json['amount'] as num).toDouble(),
    );
  }
}
