import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/BarChatSample6.dart';
import 'package:fyp_project_group_a/Page/TransactionListPage.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

// import 'package:fl_chart_app/presentation/resources/app_resources.dart';
// import 'package:fl_chart_app/presentation/widgets/legend_widget.dart';
void main() {
  runApp(MoneyTracker());
}

class Transaction {
  final String title;
  final double amount;
  final bool isIncome;
  final String date;

  Transaction(
      {required this.title,
      required this.amount,
      required this.isIncome,
      required this.date});
}

class TransactionModel extends ChangeNotifier {
  List<Transaction> _transactions = [];

  List<Transaction> get transactions => _transactions;

  TransactionModel() {
    // Initialize with default data
    _transactions = [
      Transaction(
          title: 'Cashback Promo',
          date: '1 Jan 2020',
          amount: 16000,
          isIncome: true),
      Transaction(
          title: 'Food Delivery',
          date: '1 Jan 2020',
          amount: 56000,
          isIncome: false),
      Transaction(
          title: 'Money Received',
          date: '1 Jan 2020',
          amount: 1056000,
          isIncome: true),
    ];
  }

  void addTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}

class MoneyTracker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionModel(),
      child: MaterialApp(
        title: 'Expense Tracker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Dashboard(),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Expense Tracker'),
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BalanceCard(),
          BarChartSample6(),
          // SizedBox(height: 20),
          // SizedBox(height: 40),
          TransactionHistory(),
          NavigateToNewPageButton(),
        ],
      ),
    );
  }
}

class IncomeExpenseButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var transactionModel = Provider.of<TransactionModel>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text(
            'Income',
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Expense'),
        ),
      ],
    );
  }
}

class TransactionHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var transactionModel = Provider.of<TransactionModel>(context);

    return Expanded(
      child: ListView.builder(
        itemCount: transactionModel.transactions.length,
        itemBuilder: (context, index) {
          var transaction = transactionModel.transactions[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Container(
              color: Color(0xFFF9F9F9),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.orange),
                trailing: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text(
                      transaction.isIncome
                          ? '+ \$${transaction.amount.toStringAsFixed(2)}'
                          : '- \$${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: transaction.isIncome
                            ? Colors.black
                            : Color(0xFF17D85C),
                      )),
                ),
                title: Text(
                  transaction.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(transaction.date),
              ),
            ),
          );
        },
      ),
    );
  }
}

class SpacedItemsList extends StatelessWidget {
  const SpacedItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    const items = 4;

    return MaterialApp(
      home: Scaffold(
        body: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(
                    items, (index) => ItemWidget(text: 'Item $index')),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  const ItemWidget({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        child: Center(child: Text(text)),
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        color: Color(0xFF1F6CFF),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text('Current Balance',
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
              ),
              SizedBox(height: 8.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '\$1,000.00', // Replace with your actual balance amount
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InfoCard(
                      label: 'Income',
                      amount:
                          '\$500.00'), // Replace with your actual income amount
                  InfoCard(
                      label: 'Expense',
                      amount:
                          '\$-300.00'), // Replace with your actual expense amount
                ],
              ),
            ],
          ),
        ));
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final String amount;

  InfoCard({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF949494)),
              ),
              SizedBox(height: 8.0),
              Text(
                amount,
                style: TextStyle(
                    fontSize: 18.0,
                    color: label == 'Income'
                        ? Color(0xFF17D85C)
                        : Color(0xFFFF6854)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigateToNewPageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20),
        backgroundColor: Colors.white);

    return Center(
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () {
              // Your onPressed handler
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TransactionListPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the border radius
              ),
              foregroundColor: Color(0xFFFF9900),
              padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 8.0),
            ),
            child: Text(
              'See All Transactions',
              style: TextStyle(
                color: Color(0xFFFF9900),
              ),
            ),
          ),
        ],
        // children: <Widget>[
        //   ElevatedButton(
        //     style: style,
        //     // style: ElevatedButton.styleFrom(alignment: Alignment.center, backgroundColor: Colors.white));
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => TransactionListPage()),
        //       );
        //     },
        //     child: Text(
        //       'See All Trasation',
        //       style: TextStyle(
        //         color: Color(0xFFFF9900),
        //       ),

        //     ),
        //   ),
        // ],
      ),
    );
  }
}
