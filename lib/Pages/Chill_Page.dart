import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SoftDrinks.dart';
import 'package:yumm_food/widgets/BottomNavigateBar.dart';
import 'package:yumm_food/widgets/Chill_Menus.dart';
import 'package:yumm_food/widgets/IceCreamPage.dart';
import 'package:yumm_food/Pages/HomePage.dart';

class Chill_Page extends StatefulWidget {
  const Chill_Page({super.key});

  @override
  State<Chill_Page> createState() => _Chill_PageState();
}

class _Chill_PageState extends State<Chill_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        elevation: 0,
        title: Text(
          "YummFoods",
          style: TextStyle(
              color: Color(0xFF3a3737),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chill_Menus(),
            SizedBox(
              height: 10,
            ),
            IcecreamPage(),
            SizedBox(
              height: 10,
            ),
            SoftDrinks(),
          ],
        ),
      ),
    );
  }
}
