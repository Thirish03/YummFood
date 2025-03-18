import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SearchresultsPage.dart';
import 'package:yumm_food/Pages/IceCart.dart';
import 'package:yumm_food/widgets/SearchTransactionPage.dart';

class SearchDetailsPage extends StatelessWidget {
  final String foodName;
  final String imagePath;
  final double foodPrice; // Add foodPrice to the constructor
  final String foodDescription;

  SearchDetailsPage({
    required this.foodName,
    required this.imagePath,
    required this.foodPrice, // Make sure it's included here
    required this.foodDescription,
  });

  get cartItems => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(5)),
          Center(
            child: Image.asset(
              imagePath,
              height: 200,
              width: 600,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),
          Text(
            foodName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            "\Rs.${foodPrice.toStringAsFixed(2)}", // Display price here
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          Text(
            foodDescription,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
          SizedBox(
            height: 40,
          ),
          PaymentMethodWidget(onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SearchTransactionPage()));
          })
        ],
      ),
    );
  }
}
