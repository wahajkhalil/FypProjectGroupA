import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/TransactionDetail.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  String name;
  double amount;
  String imageUrl;
  DateTime date;
  String transactionId;
  String shortDescription;
  String thankYouMessage;

  Transaction({
    required this.name,
    required this.amount,
    required this.imageUrl,
    required this.date,
    required this.transactionId,
    required this.shortDescription,
    required this.thankYouMessage,
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
        name: 'Cashback Promo',
        amount: 16000,
        imageUrl: 'image1.jpg',
        transactionId: "982412456",
        shortDescription: "Uncle MG MAT",
        thankYouMessage: "Thanks You Drawin",
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        name: 'Food Delivery',
        amount: -56000,
        imageUrl: 'image2.jpg',
        shortDescription: "Uncle MG MAT",
        transactionId: "782412456",
        thankYouMessage: "Thanks You Drawin",
        date: DateTime.now()),
    Transaction(
        name: 'Money Recieved',
        amount: 1056000,
        transactionId: "334343433",
        shortDescription: "DC WATT",
        imageUrl: 'image3.jpg',
        thankYouMessage: "Thanks You Drawin",
        date: DateTime.now()),
    Transaction(
        name: 'Money Sent',
        amount: 25000,
        transactionId: "7322322",
        shortDescription: "New Boston",
        imageUrl: 'image3.jpg',
        thankYouMessage: "Thanks You Drawin",
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
        title: Text('Transaction History'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Show filter modal
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        // Header
                        Text(
                          'Show Transactions',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // Filter options
                        ListTile(
                          leading: Icon(Icons.filter),
                          title: Text('This Week'),
                          onTap: () {
                            // Handle filter option 1
                            Navigator.pop(context); // Close the modal
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.filter),
                          title: Text('This Month'),
                          onTap: () {
                            // Handle filter option 1
                            Navigator.pop(context); // Close the modal
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.filter),
                          title: Text('Past 3 Months'),
                          onTap: () {
                            // Handle filter option 1
                            Navigator.pop(context); // Close the modal
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.filter),
                          title: Text('This Year'),
                          onTap: () {
                            // Handle filter option 1
                            Navigator.pop(context); // Close the modal
                          },
                        ),
                        ListTile(
                          leading: Icon(Icons.filter),
                          title: Text('Custom Date'),
                          onTap: () {
                            // Handle filter option 2
                            Navigator.pop(context);
                            // Close the modal
                            _showDatePicker(context);
                          },
                        ),
                        // Add more filter options as needed
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
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

                return GestureDetector(
                  onTap: () {
                    // Navigate to the detail page when a transaction is tapped
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TransactionDetailPage(
                          transaction: transaction,
                          // itemId: '',
                          // transactionId: transaction.transactionId
                        ),
                      ),
                    );
                  },
                  child: Container(
                    color: Color(0xFFF9F9F9),
                    child: ListTile(
                      leading: Icon(Icons.star, color: Colors.orange),
                      trailing: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          transaction.amount > 0
                              ? '+ \$${transaction.amount.toStringAsFixed(2)}'
                              : '- \$${transaction.amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            color: transaction.amount < 1
                                ? Colors.black
                                : Color(0xFF17D85C),
                          ),
                        ),
                      ),
                      title: Text(
                        transaction.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(formatDate(transaction.date)),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       if (showDate)
  //         Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Text(
  //             formatDate(transaction.date),
  //             style: TextStyle(
  //                 fontSize: 18, fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ListTile(
  //         title: Text(transaction.name),
  //         subtitle: Text(
  //             '${transaction.amount > 0 ? '+' : ''}\$${transaction.amount.toStringAsFixed(2)}'),
  //         leading: CircleAvatar(
  //           backgroundImage: AssetImage(transaction.imageUrl),
  //         ),
  //       ),
  //     ],
  //   );
  // },
  //         ),
  //       ),
  //     ],
  //   ),
  // );

  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }

  // Function to show the date picker
  Future<void> _showDatePicker(BuildContext context) async {
    DateTime selectedDate = DateTime.now(); // Initial date

    // Show date picker
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      // Handle the selected date
      print('Selected date: ${picked.toLocal()}');
    }
  }
}
