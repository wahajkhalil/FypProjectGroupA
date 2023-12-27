import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  String name;
  double amount;
  String imageUrl;
  DateTime date;

  Transaction({
    required this.name,
    required this.amount,
    required this.imageUrl,
    required this.date,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionListPage(),
    );
  }
}

class TransactionListPage extends StatefulWidget {
  @override
  _TransactionListPageState createState() => _TransactionListPageState();
}

class _TransactionListPageState extends State<TransactionListPage> {
  List<Transaction> transactions = [
    Transaction(
        name: 'Transaction 1',
        amount: 50.0,
        imageUrl: 'image1.jpg',
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        name: 'Transaction 2',
        amount: 30.0,
        imageUrl: 'image2.jpg',
        date: DateTime.now()),
    Transaction(
        name: 'Transaction 3',
        amount: 80.0,
        imageUrl: 'image3.jpg',
        date: DateTime.now()),
    // Add more transactions as needed
  ];

  List<Transaction> filteredTransactions = [];

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions;
  }

  void filterTransactions(String filter) {
    setState(() {
      if (filter == 'Income') {
        filteredTransactions = transactions.where((t) => t.amount > 0).toList();
      } else if (filter == 'Expense') {
        filteredTransactions = transactions.where((t) => t.amount < 0).toList();
      } else {
        filteredTransactions = transactions;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction List'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => filterTransactions('Income'),
                  child: Text('Income'),
                ),
                ElevatedButton(
                  onPressed: () => filterTransactions('Expense'),
                  child: Text('Expense'),
                ),
                ElevatedButton(
                  onPressed: () => filterTransactions('All'),
                  child: Text('All Transactions'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                var transaction = filteredTransactions[index];
                var previousTransactionDate =
                    index > 0 ? filteredTransactions[index - 1].date : null;
                var showDate = previousTransactionDate == null ||
                    !isSameDay(transaction.date, previousTransactionDate);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (showDate)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          formatDate(transaction.date),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ListTile(
                      title: Text(transaction.name),
                      subtitle: Text(
                          '${transaction.amount > 0 ? '+' : ''}\$${transaction.amount.toStringAsFixed(2)}'),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(transaction.imageUrl),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}
