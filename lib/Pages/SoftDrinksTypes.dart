import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SoftDrinks.dart';
import 'package:yumm_food/Pages/SoftDrinksCart.dart';

class SoftDrinksItemModel {
  final String name;
  final double price;
  final String image;
  final String description;

  SoftDrinksItemModel({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

List<SoftDrinksItemModel> foodItems = [
  SoftDrinksItemModel(
      name: "Mirinda",
      price: 30,
      image: "assets/images/softdrinks/mirinda.jpg",
      description: ""),
  SoftDrinksItemModel(
      name: "Pepsi",
      price: 35,
      image: "assets/images/softdrinks/pepsi.jpg",
      description: ""),
  SoftDrinksItemModel(
      name: "Mango",
      price: 50,
      image: "assets/images/softdrinks/mango.jpg",
      description: " "),
  SoftDrinksItemModel(
      name: "Sprite",
      price: 45,
      image: "assets/images/softdrinks/sprite.jpg",
      description: ""),
  SoftDrinksItemModel(
      name: "CocaCola",
      price: 45,
      image: "assets/images/softdrinks/cocacola.jpg",
      description: ""),
  SoftDrinksItemModel(
      name: "Fanta",
      price: 50,
      image: "assets/images/softdrinks/fanta.jpg",
      description: ""),
];

class SoftDrinksTypes extends StatefulWidget {
  final Function(Map<String, dynamic>) addToCart;

  SoftDrinksTypes({required this.addToCart, super.key});

  @override
  State<SoftDrinksTypes> createState() => _SoftDrinksTypesState();
}

class _SoftDrinksTypesState extends State<SoftDrinksTypes>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Set the number of tabs here
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        title: Text(
          "Soft Drinks",
          style: TextStyle(fontSize: 20, color: Color(0xDD000000)),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.business_center, color: Color(0xFF000000)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SoftDrinksCart()));
            },
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                child: BottomMenu(),
              ),
              Center(
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image.asset(item.image),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3.0),
                  ),
                  elevation: 1,
                  margin: EdgeInsets.all(5),
                ),
              ),
              FoodTitleWidgets(
                productName: item.name,
                productPrice: "₹${item.price.toStringAsFixed(2)}",
                productHost: "${item.name} Hut",
              ),
              // Using Provider to call addToCart method when button is pressed
              FoodItem(
                productName: item.name,
                productPrice: item.price,
                productImage: item.image,
                onAddToCart: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SoftDrinksCart()));
                  print("${item.name} added to cart!");
                  // Add item to cart using Provider
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

class FoodTitleWidgets extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productHost;
  const FoodTitleWidgets(
      {required this.productName,
      required this.productPrice,
      required this.productHost,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productName,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
            Text(
              productPrice,
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "by",
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFa9a9a9),
                  fontWeight: FontWeight.w400),
            ),
            Text(
              productHost,
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1f1f1f),
                  fontWeight: FontWeight.w400),
            )
          ],
        )
      ],
    );
  }
}

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Icon(
                Icons.timelapse,
                color: Color(0xFF404aff),
                size: 35,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "12pm-3pm",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0x61000000),
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.directions,
                color: Color(0xFF23c58a),
                size: 35,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "3.5km",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0x61000000),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.map,
                color: Color(0xFFff0654),
                size: 35,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Map View",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0x61000000),
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Column(
            children: [
              Icon(
                Icons.directions_bike,
                color: Color(0xFFe95959),
                size: 35,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Delivery",
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0x61000000),
                    fontWeight: FontWeight.w400),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FoodItem extends StatelessWidget {
  final String productName;
  final double productPrice;
  final String productImage;
  final VoidCallback onAddToCart; // Add this

  const FoodItem({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.onAddToCart, // Add this
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          title:
              Text(productName, style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text("₹${productPrice.toStringAsFixed(2)}"),
          trailing: ElevatedButton(
            onPressed: onAddToCart, // Use the onAddToCart here
            child: Text(
              "Add to Bag",
              style: TextStyle(color: Color(0xDD000000)),
            ),
            style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFE53935)),
          ),
        ),
      ),
    );
  }
}

class TabBarViewSection extends StatelessWidget {
  final String description;

  const TabBarViewSection({required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          labelColor: Color(0xFFfd3f40),
          indicatorColor: Color(0xFFfd3f40),
          unselectedLabelColor: Color(0xFFa4a1a1),
          tabs: [
            Tab(text: 'Food Details'),
            Tab(text: 'Food Reviews'),
          ],
        ),
        SizedBox(
          height: 150,
          child: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  description,
                  style: TextStyle(
                      fontSize: 14, color: Colors.black87, height: 1.5),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                child: Center(child: Text("Reviews coming soon!")),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
