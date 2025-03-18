import 'package:flutter/material.dart';

class SearchTransactionPage extends StatelessWidget {
  const SearchTransactionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: AlertDialog(
        title: Text(
          'Payment Successful🎉',
        ),
        content: Text(
          'Thank you for your purchase!',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to previous screen (CartPage)
            },
            child: Text(
              'OK',
            ),
          ),
        ],
      ),
    );
  }
}
