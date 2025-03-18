import 'package:flutter/material.dart';
import 'package:yumm_food/widgets/BottomNavigateBar.dart';

class BottomCart extends StatelessWidget {
  const BottomCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        title: Text(
          "Cart",
          style: TextStyle(fontSize: 20, color: Color(0xDD000000)),
        ),
      ),
      body: Center(
        child: Container(
          child: Text(
            "Your Cart is Empty!",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
