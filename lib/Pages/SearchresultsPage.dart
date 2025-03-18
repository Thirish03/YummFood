import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/SearchDetailsPage.dart';

class SearchResultPage extends StatelessWidget {
  final String searchQuery;
  final List<Map<String, dynamic>>
      searchResults; // Updated to use a list of maps

  SearchResultPage({required this.searchQuery, required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFE53935),
        title: Text("Search Results"),
      ),
      body: searchResults.isEmpty
          ? Center(
              child: Text(
                "No results found for \"$searchQuery\"",
                style: TextStyle(fontSize: 18, color: Color(0xFFE53935)),
              ),
            )
          : ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final food = searchResults[index];
                return ListTile(
                  leading: Image.asset(food['image'], width: 50, height: 50),
                  title: Text(food['name']),
                  subtitle: Text("\Rs. ${food['price'].toStringAsFixed(2)}"),
                  onTap: () {
                    // Navigate to FoodDetailsPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchDetailsPage(
                          foodName: food['name'],
                          imagePath: food['image'],
                          foodPrice: (food['price'] as num).toDouble(),
                          foodDescription: food['description'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
