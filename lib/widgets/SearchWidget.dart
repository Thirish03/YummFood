import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SearchresultsPage.dart';

class SearchWidget extends StatelessWidget {
  final List<Map<String, dynamic>> allFoods = [
    {
      'name': 'Burger',
      'image': 'assets/images/trendfoods/burger.jpg',
      'price': 199,
      'description': 'Juicy beef burger with fresh lettuce and tomato.',
    },
    {
      'name': 'Pizza',
      'image': 'assets/images/trendfoods/pizza.jpg',
      'price': 250,
      'description': '',
    },
    {
      'name': 'Noodles',
      'image': 'assets/images/popular_food/noodles.jpg',
      'price': 100,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Fried Egg',
      'image': 'assets/images/popular_food/friedegg.jpg',
      'price': 50,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Fried Chicken',
      'image': 'assets/images/popular_food/friedchicken.jpg',
      'price': 100,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Chicken Rice',
      'image': 'assets/images/popular_food/chickenrice.jpg',
      'price': 90,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Potato Fries',
      'image': 'assets/images/popular_food/potatofries.jpg',
      'price': 60,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Sand Wich',
      'image': 'assets/images/trendfoods/sandwich.jpg',
      'price': 100,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Cricpy Chicken',
      'image': 'assets/images/trendfoods/crispy.jpg',
      'price': 200,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Tandoori',
      'image': 'assets/images/trendfoods/tandoori.jpg',
      'price': 269,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Chicken 65',
      'image': 'assets/images/trendfoods/chicken65.jpg',
      'price': 100,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Chicken Biryani',
      'image': 'assets/images/biryani/biryani1.jpg',
      'price': 130,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Hyderabad Biryani',
      'image': 'assets/images/biryani/biryani2.jpg',
      'price': 150,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Chettinad Biryani',
      'image': 'assets/images/biryani/chettinad.jpg',
      'price': 150,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Egg Biryani',
      'image': 'assets/images/biryani/eggbiryani.jpg',
      'price': 100,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Malabar Biryani',
      'image': 'assets/images/biryani/malabar.jpg',
      'price': 160,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Mutton Biryani',
      'image': 'assets/images/biryani/muttonbiryani.jpg',
      'price': 199,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Vanilla Ice Cream',
      'image': 'assets/images/ice_cream/venila.jpg',
      'price': 80,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Chocolate Ice Cream',
      'image': 'assets/images/ice_cream/chocolate.jpg',
      'price': 75,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Straw Berry Ice Cream',
      'image': 'assets/images/ice_cream/Strawberry.jpg',
      'price': 60,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Butter Scotch Ice Cream',
      'image': 'assets/images/ice_cream/butterscotch.jpg',
      'price': 85,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Blue Berry Ice Cream',
      'image': 'assets/images/ice_cream/blueberry.jpg',
      'price': 60,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Kulfi Ice Cream',
      'image': 'assets/images/ice_cream/kulfi.jpg',
      'price': 50,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Mirinda',
      'image': 'assets/images/softdrinks/mirinda.jpg',
      'price': 30,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Pepsi',
      'image': 'assets/images/softdrinks/pepsi.jpg',
      'price': 35,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Mango',
      'image': 'assets/images/softdrinks/mango.jpg',
      'price': 50,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Sprite',
      'image': 'assets/images/softdrinks/sprite.jpg',
      'price': 45,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'CocaCola',
      'image': 'assets/images/softdrinks/cocacola.jpg',
      'price': 45,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    {
      'name': 'Fanta',
      'image': 'assets/images/softdrinks/fanta.jpg',
      'price': 50,
      'description': 'Healthy green salad with a variety of fresh veggies.',
    },
    // Add more food items here
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    void _onSearch() {
      String query = searchController.text.trim();
      if (query.isNotEmpty) {
        // Filter the food list based on the query
        List<Map<String, dynamic>> searchResults = allFoods
            .where((food) =>
                food['name'].toLowerCase().contains(query.toLowerCase()))
            .toList();

        // Navigate to the search results page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SearchResultPage(
              searchQuery: query,
              searchResults: searchResults,
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please enter a search term.")),
        );
      }
    }

    return Container(
      padding: EdgeInsets.only(top: 10, left: 5, right: 5),
      child: TextField(
        controller: searchController,
        onSubmitted: (value) => _onSearch(),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide.none,
          ),
          filled: true,
          prefixIcon: Icon(Icons.search, color: Colors.redAccent),
          fillColor: Colors.white70,
          hintStyle: TextStyle(color: Color(0x42000000), fontSize: 18),
          hintText: "What would you like to buy?",
        ),
      ),
    );
  }
}
