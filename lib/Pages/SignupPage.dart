import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yumm_food/Pages/HomePage.dart';
import 'package:yumm_food/Pages/SignInPage.dart';

class Signuppage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  child: Image.asset('assets/images/menus/logo.jpg'),
                ),
                SizedBox(height: 40),
                buildTextField(
                  controller: emailController,
                  hintText: "Email ID",
                  icon: Icons.email_outlined,
                ),
                SizedBox(height: 20),
                buildTextField(
                  controller: passwordController,
                  hintText: "Password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                ),
                SizedBox(height: 30),
                SignUpButton(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInPage()),
                        );
                      },
                      child: Text(
                        " Sign In",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Color(0xFF666666),
        ),
        hintText: hintText,
        hintStyle: TextStyle(color: Color(0xFF666666)),
        filled: true,
        fillColor: Colors.white54,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignUpButton({
    required this.emailController,
    required this.passwordController,
  });

  Future<void> _signUp(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      _showErrorDialog(context, "Both fields are required.");
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      switch (e.code) {
        case 'weak-password':
          errorMessage = "The password is too weak.";
          break;
        case 'email-already-in-use':
          errorMessage = "This email is already registered.";
          break;
        case 'invalid-email':
          errorMessage = "The email address is not valid.";
          break;
        default:
          errorMessage = "An error occurred. Please try again.";
      }
      _showErrorDialog(context, errorMessage);
    }
  }

  void _showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("OK"),
          ),
        ],
      ),
    );
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
            onPressed: () => _signUp(context), // Use the signIn function
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
              child: Text(
                "SIGN UP",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 25.0,
                    fontFamily: "WorkSansBold"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
