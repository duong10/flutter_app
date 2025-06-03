import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/app/navigation/router_location.dart';
import 'package:login/components/button.dart';
import 'package:login/components/text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final emailEditingController = TextEditingController();
    final passwordEditingController = TextEditingController();

    // sign in
    void SignIn() async {
      try {
        final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailEditingController.text,
          password: passwordEditingController.text,
        );
        print(user);
        if (user != null) context.go(AppRouterLocation.homePage.path);
      } on FirebaseAuthException catch (e) {
        print(e.code);
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 50),
                // Logo
                Icon(Icons.lock, size: 100),

                // title
                Text("Welcom to my App"),
                // email
                SizedBox(height: 50),

                CustomTextField(
                  controller: emailEditingController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                //pass
                SizedBox(height: 20),
                CustomTextField(
                  controller: passwordEditingController,
                  hintText: "password",
                  obscureText: true,
                ),
                // Button Login
                SizedBox(height: 35),
                CustomButton(onTap: () => SignIn(), text: "Sign in"),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ban chua co tai khoan?'),
                    InkWell(
                      onTap:
                          () => context.go(AppRouterLocation.registerPage.path),
                      child: Text(
                        " Dang ki ngay",
                        style: TextStyle(
                          color: Colors.red,
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
}
