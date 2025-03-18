import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yumm_food/Pages/HomePage.dart';
import 'package:yumm_food/animation/ScaleRoute.dart';
import 'package:yumm_food/pages/FoodDetailsPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yumm_food/Pages/SignupPage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to free memory
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Close button
              InkWell(
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Icon(Icons.close),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 30),
              Container(
                width: 200,
                height: 100,
                child: Image.asset('assets/images/menus/logo.jpg'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailTextController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  prefixIcon:
                      Icon(Icons.email_outlined, color: Color(0xFF666666)),
                  fillColor: Colors.white54,
                  hintText: "Email Id",
                  hintStyle:
                      TextStyle(color: Color(0xFF666666), fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 15),
              // Password Input Field
              TextField(
                controller: passwordTextController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  prefixIcon:
                      Icon(Icons.lock_outline, color: Color(0xFF666666)),
                  suffixIcon:
                      Icon(Icons.remove_red_eye, color: Color(0xFF666666)),
                  fillColor: Colors.white54,
                  hintText: "Password",
                  hintStyle:
                      TextStyle(color: Color(0xFF666666), fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot your password?",
                    style: TextStyle(color: Color(0xFF666666), fontSize: 14.0),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Sign In Button
              SignInButton(
                emailController: emailTextController,
                passwordController: passwordTextController,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  // Sign-in function
  Future<void> signIn(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to the HomePage on successful sign-in
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? "Failed to sign in.")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An unexpected error occurred.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Changed to Column
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(color: Colors.white70),
            ],
            gradient: LinearGradient(
              colors: [Colors.deepPurpleAccent, Colors.blue],
              begin: FractionalOffset(0.2, 0.0),
              end: FractionalOffset(1.0, 1.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: MaterialButton(
            splashColor: Colors.indigo,
            onPressed: () => signIn(context), // Use the signIn function
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              child: Text(
                "SIGN IN",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0,
                    fontFamily: "WorkSansBold"),
              ),
            ),
          ),
        ),
        SizedBox(height: 50),
        SingleChildScrollView(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.normal,
                      fontSize: 16),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signuppage()),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        fontStyle: FontStyle.normal),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FacebookGoogleLogin extends StatelessWidget {
  const FacebookGoogleLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.white70],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp)),
                  width: 100.0,
                  height: 1.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                    "Or",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontFamily: "WorkSansMedium"),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.black],
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp)),
                  width: 100.0,
                  height: 1.0,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0, right: 40.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.facebook,
                      size: 40,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white70),
                    child: Icon(
                      size: 30,
                      FontAwesomeIcons.google,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
