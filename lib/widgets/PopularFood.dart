import 'package:flutter/material.dart';
import 'package:yumm_food/animation/RotationRoute.dart';
import 'package:yumm_food/animation/ScaleRoute.dart';
import 'package:yumm_food/pages/FoodDetailsPage.dart';
import 'package:yumm_food/Pages/HomePage.dart';

class PopularFood extends StatefulWidget {
  const PopularFood({super.key});

  @override
  State<PopularFood> createState() => _PopularFoodState();
}

class _PopularFoodState extends State<PopularFood> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: PopularFoodTitle(),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 210, // Ensure fixed height for horizontal scrolling content
          child: const PopularFoodItems(),
        ),
      ],
    );
  }
}

class PopularFoodTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String rating;
  final String numberOfRating;
  final String price;
  final String slug;
  const PopularFoodTiles(
      {required this.name,
      required this.imageUrl,
      required this.rating,
      required this.numberOfRating,
      required this.price,
      required this.slug,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, ScaleRoute(
          page: FoodDetailsPage(
            addToCart: (item) {
              print("Added to cart: $item");
            },
          ),
        ));
      },
      child: SizedBox(
        width: 170,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section with Padding to add space between images
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 8.0, left: 7, right: 7), // Add space below image
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(8.0)),
                  child: Image.asset(
                    'assets/images/popular_food/$imageUrl.jpg',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              ),

              // Name and Price Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Rating
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        Text(
                          "$rating ($numberOfRating)",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),

                    // Price
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  const PopularFoodTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Foods",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xDD000000),
                fontWeight: FontWeight.w300),
          ),
          Text(
            "See all",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w300, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  const PopularFoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        PopularFoodTiles(
          name: "Pizza",
          imageUrl: "pizza",
          rating: "4.9",
          numberOfRating: "100",
          price: "200.0",
          slug: "",
        ),
        PopularFoodTiles(
            name: "Noodles",
            imageUrl: "noodles",
            rating: "4.9",
            numberOfRating: "100",
            price: "100.0",
            slug: ""),
        PopularFoodTiles(
            name: "Fried Egg",
            imageUrl: "friedegg",
            rating: "4.8",
            numberOfRating: "150",
            price: "50.00",
            slug: ""),
        PopularFoodTiles(
            name: "Fried Chicken",
            imageUrl: "friedchicken",
            rating: "5.0",
            numberOfRating: "100",
            price: "100.0",
            slug: ""),
        PopularFoodTiles(
            name: "Chicken Rice",
            imageUrl: "chickenrice",
            rating: "4.7",
            numberOfRating: "100",
            price: "90.00",
            slug: ""),
        PopularFoodTiles(
            name: "Potato Fries",
            imageUrl: "potatofries",
            rating: "4.5",
            numberOfRating: "200",
            price: "60.00",
            slug: ""),
      ],
    );
  }
}
