import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SpicyCart.dart';

class TransactionPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  // Constructor to accept the cartItems
  TransactionPage({required this.cartItems});

  double getTotalPrice() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item['productPrice'] * item['quantity'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        title: Text("Transaction Details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Display cart items
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return ListTile(
                    leading: Image.asset(cartItem['productImage'],
                        width: 50, height: 50),
                    title: Text(cartItem['productName']),
                    subtitle: Text(
                        "₹${cartItem['productPrice']} x ${cartItem['quantity']}"),
                    trailing: Text(
                        "₹${(cartItem['productPrice'] * cartItem['quantity']).toStringAsFixed(2)}"),
                  );
                },
              ),
            ),
            Divider(),
            // Display total
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total: ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text("₹${getTotalPrice().toStringAsFixed(2)}",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            SizedBox(height: 20),
            // Confirm Payment button
            ElevatedButton(
              onPressed: () {
                // Handle the payment process here
                // Show confirmation or navigate to another screen
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Payment Successful🎉',
                    ),
                    content: Text(
                      'Thank you for your purchase!',
                      style: TextStyle(fontSize: 16),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(
                              context); // Go back to previous screen (CartPage)
                        },
                        child: Text(
                          'OK',
                        ),
                      ),
                    ],
                  ),
                );
              },
              child: Text(
                "Confirm Payment",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Color(0xDD000000)),
              ),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Color(0xFFE53935)),
            ),
          ],
        ),
      ),
    );
  }
}
