import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:yumm_food/Pages/Chill_Page.dart';

import 'TopMenus.dart';

class Chill_Menus extends StatelessWidget {
  const Chill_Menus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: double.infinity,
      child: FlutterCarousel(
          items: [
            buildCarouselItem("assets/images/Chill_Menus/image5.jpg"),
            buildCarouselItem("assets/images/Chill_Menus/image1.jpg"),
            buildCarouselItem("assets/images/Chill_Menus/image2.jpg"),
            buildCarouselItem("assets/images/Chill_Menus/image3.jpg"),
            buildCarouselItem("assets/images/Chill_Menus/image4.jpg")
          ],
          options: FlutterCarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 2),
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            aspectRatio: 16 / 9,
            showIndicator: true,
            height: 280,
          )),
    );
  }
}
