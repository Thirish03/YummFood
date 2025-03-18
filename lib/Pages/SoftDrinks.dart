import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SoftDrinksTypes.dart';

class SoftDrinks extends StatelessWidget {
  const SoftDrinks({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SoftDrinksTypes(
                      addToCart: (item) {
                        print("Added to cart: $item");
                      },
                    )));
      },
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 240,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                image: AssetImage('assets/images/softdrinks/softdrinks.jpg'),
                fit: BoxFit
                    .cover, // Ensures the image covers the entire container
              ),
            ),
          ),
          Positioned(
            top: 20, // Adjust the position of the text
            left: 20, // Adjust the position of the text
            child: Text(
              'Soft Drinks🍹',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 50.0,
                    color: Colors.black.withOpacity(0.7),
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
