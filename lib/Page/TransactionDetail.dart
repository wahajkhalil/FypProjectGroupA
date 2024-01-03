import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/TransactionListPage.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;

  TransactionDetailPage({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1F6CFF),
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF1F6CFF),
      //   foregroundColor: Colors.white,
      //   title: Text('Transaction Detail'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            SizedBox(
              height: 40,
            ),
            IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                '${transaction.name}',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'Transaction ID: ${transaction.transactionId}',
                style: TextStyle(color: Colors.white),
              ),
            ),

            // Card Section
            Container(
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color
                borderRadius: BorderRadius.circular(10), // Set rounded corners
              ),
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Total Amount: ${transaction.amount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('${transaction.shortDescription}'),
                    SizedBox(height: 8.0),
                    Text('${transaction.date}'),
                    SizedBox(height: 16.0),
                    Text('${transaction.thankYouMessage}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            // Add your share functionality
                          },
                          child: Text('Share'),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the border radius
                            ),
                            side: BorderSide(
                                color: Colors.orange), // Border color
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your send again functionality
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  8.0), // Adjust the border radius
                            ),
                            side: BorderSide(
                                color: Colors.orange), // Border color
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                          ),
                          child: Text('Send Again'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Buttons Row
          ],
        ),
      ),
    );
  }
}
