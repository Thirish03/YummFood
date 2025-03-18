import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/HomePage.dart';
import 'package:yumm_food/Pages/IceCreamTypes.dart';
import 'package:yumm_food/Pages/SignInPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yumm_food/Pages/SignupPage.dart';
import 'package:yumm_food/widgets/TopMenus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_launcher_icons/pubspec_parser.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Roboto', hintColor: Color(0xFFd0cece)),
    home: HomePage(),
  ));
}
