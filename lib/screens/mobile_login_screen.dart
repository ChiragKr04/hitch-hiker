import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hitch_hiker_app/providers/global_providers.dart';
import 'package:hitch_hiker_app/screens/home_screen.dart';

class MobileLoginScreen extends ConsumerStatefulWidget {
  const MobileLoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MobileLoginScreenState();
}

class _MobileLoginScreenState extends ConsumerState<MobileLoginScreen> {
  final _mobileNumberController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _sendOtp = false;
  @override
  Widget build(BuildContext context) {
    Future<void> login() async {
      log("LOGIN function");
      await ref.read(authLoginProvider).loginWithMobile(
            _mobileNumberController.text.toString().trim(),
            context,
          );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 10),
          content: Text("Otp Sent Successfully"),
          backgroundColor: Colors.green,
        ),
      );
    }

    _mobileNumberController.addListener(() {
      if (_mobileNumberController.text.length == 10) {
        login();
        setState(() {
          _sendOtp = true;
        });
      }
    });
    _passwordController.addListener(() async {
      if (_passwordController.text.length == 6) {
        var userCreds = await ref
            .read(authLoginProvider)
            .verifyOtp(_passwordController.text.trim().toString());
        log("user creds ${userCreds.toString()}");
        if (userCreds.user != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        }
      }
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: _mobileNumberController,
                  decoration: const InputDecoration(
                    counterText: "",
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        _sendOtp
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Enter OTP',
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 6,
                  keyboardType: TextInputType.number,
                ),
              )
            : const Offstage(),
        const SizedBox(height: 10),
        ref.watch(authLoginProvider).isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ElevatedButton(
                child: _sendOtp ? const Text('Login') : const Text("Send OTP"),
                onPressed: _mobileNumberController.text.length <= 9
                    ? null
                    : _sendOtp
                        ? _passwordController.text.length <= 5
                            ? null
                            : login
                        : () {
                            setState(() {
                              _sendOtp = true;
                            });
                          },
              ),
      ],
    );
  }
}
