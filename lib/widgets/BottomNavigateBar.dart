import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yumm_food/Pages/Chill_Page.dart';
import 'package:yumm_food/Pages/HomePage.dart';
import 'package:yumm_food/widgets/SearchWidget.dart'; // Import the FoodOrderPage file
import 'package:yumm_food/Pages/BottomCart.dart';

class BottomNavigateBar extends StatefulWidget {
  const BottomNavigateBar({super.key});

  @override
  State<BottomNavigateBar> createState() => _BottomNavigateBarState();
}

class _BottomNavigateBarState extends State<BottomNavigateBar> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });

    // Handle navigation based on index
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        break;

      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Chill_Page()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomCart()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color(0x99FFFFFF),
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.icecream),
          label: "Chill",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: "Cart"),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Color(0xFF212121),
      unselectedItemColor: Colors.grey,
      onTap: onItemTapped,
    );
  }
}
