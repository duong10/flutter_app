import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login/app/navigation/router_location.dart';
import 'package:login/components/text_field.dart';

import '../components/button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final emailEditingController = TextEditingController();
    final passwordEditingController = TextEditingController();
    final confirmPassWordEditingController = TextEditingController();

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
                Text("Register Member"),
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
                SizedBox(height: 20),
                CustomTextField(
                  controller: confirmPassWordEditingController,
                  hintText: "Confirm Password",
                  obscureText: true,
                ),
                // Button Login
                SizedBox(height: 35),
                CustomButton(text: "Sign up"),

                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Ban da co tai khoan?'),
                    InkWell(
                      onTap: () => context.go(AppRouterLocation.loginPage.path),
                      child: Text(
                        " Dang nhap ngay",
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
