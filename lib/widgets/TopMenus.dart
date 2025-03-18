import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class TopMenus extends StatefulWidget {
  const TopMenus({super.key});

  @override
  State<TopMenus> createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: FlutterCarousel(
          items: [
            buildCarouselItem("assets/images/topmenu/burger.jpg"),
            buildCarouselItem("assets/images/topmenu/ice cream.jpg"),
            buildCarouselItem("assets/images/topmenu/pasta.jpg"),
            buildCarouselItem("assets/images/topmenu/soft drinks.jpg"),
            buildCarouselItem("assets/images/topmenu/sushi.jpg")
          ],
          options: FlutterCarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            aspectRatio: 16 / 9,
            showIndicator: true,
            height: 280,
          )),
    );
  }
}

Widget buildCarouselItem(String imagePath) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 8),
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          offset: Offset(0, 6),
          blurRadius: 12,
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
      ),
    ),
  );
}
