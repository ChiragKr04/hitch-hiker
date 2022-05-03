import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/screens/email_login_screen.dart';
import 'package:hitch_hiker_app/screens/mobile_login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isMobileLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _isMobileLogin ? const MobileLoginScreen() : const EmailLoginScreen(),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isMobileLogin = !_isMobileLogin;
              });
            },
            child: _isMobileLogin
                ? const Text(
                    "Login with Email",
                  )
                : const Text(
                    "Login with Mobile",
                  ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
