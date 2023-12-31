import 'package:flutter/material.dart';
import 'package:fyp_project_group_a/Page/TransactionListPage.dart';

class TransactionDetailPage extends StatelessWidget {
  final Transaction transaction;

  TransactionDetailPage({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top Section
            Text(
              'Title: ${transaction.name}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text('Transaction ID: ${transaction.transactionId}'),

            // Card Section
            Card(
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
                    Text('Date: ${transaction.date}'),
                    SizedBox(height: 8.0),
                    Text('Short Description: ${transaction.shortDescription}'),
                    SizedBox(height: 16.0),
                    Text('Thank You Message: ${transaction.thankYouMessage}'),
                  ],
                ),
              ),
            ),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your share functionality
                  },
                  child: Text('Share'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add your send again functionality
                  },
                  child: Text('Send Again'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
