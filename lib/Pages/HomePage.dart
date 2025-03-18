import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/BiryaniPage.dart';
import 'package:yumm_food/Pages/SpicyPage.dart';
import 'package:yumm_food/animation/ScaleRoute.dart';
import 'package:yumm_food/Pages/SignInPage.dart';
import 'package:yumm_food/widgets/BottomNavigateBar.dart';
import 'package:yumm_food/widgets/IceCreamPage.dart';
import 'package:yumm_food/widgets/PopularFood.dart';
import 'package:yumm_food/widgets/SearchWidget.dart';
import 'package:yumm_food/widgets/TopMenus.dart';
import 'package:yumm_food/Pages/SpicyCart.dart';
import 'package:yumm_food/Pages/SoftDrinks.dart';
import 'package:yumm_food/Pages/BiryaniPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
        actions: [
          IconButton(
            splashColor: Colors.indigo,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
              // Handle profile navigation here
            },
            icon: Icon(
              Icons.person_pin,
              color: Color(0xDD000000),
              size: 40.0,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SearchWidget(), // Only the search bar
            SizedBox(height: 8),
            TopMenus(),
            SizedBox(height: 8),
            PopularFood(),
            SizedBox(
              height: 5,
            ),
            SpicyPage(),
            BiryaniPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigateBar(),
    );
  }
}
