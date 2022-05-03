import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/providers/global_providers.dart';
import 'package:hitch_hiker_app/screens/home_screen.dart';

class EmailLoginScreen extends ConsumerWidget {
  const EmailLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _emailController = TextEditingController();
    var _passwordController = TextEditingController();
    Future<void> login() async {
      try {
        var userCreds = await ref
            .read(
              authLoginProvider,
            )
            .loginWithEmail(
              _emailController.text.toString().trim(),
              _passwordController.text.toString().trim(),
            );
        if (userCreds.user != null) {
          log("user creds ${userCreds.toString()}");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 5),
              content: Text("Login Successful"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 5),
            content: Text("Login Failed"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ref.watch(authLoginProvider).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ElevatedButton(
                onPressed: () async {
                  if (_emailController.text.isEmpty ||
                      _passwordController.text.isEmpty) {
                    return;
                  }
                  login();
                },
                child: const Text("Login"),
              ),
      ],
    );
  }
}
