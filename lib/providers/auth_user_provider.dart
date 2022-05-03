import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hitch_hiker_app/constants/constant_country_code.dart';
import 'package:hitch_hiker_app/repository/mobile_auth_repository.dart';

class AuthLoginProvider extends ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isLoading = false;
  String countryCode = CountryCodes.india;

  MobileAuthRepository mobileAuthRepository;
  get isLoading => _isLoading;
  get isLoggedIn => _isLoggedIn;
  AuthLoginProvider({required this.mobileAuthRepository});

  void changeCountryCode(String code) {
    countryCode = code;
  }

  Future<void> loginWithMobile(
    String mobile,
    BuildContext context,
  ) async {
    _isLoggedIn = false;
    _isLoading = true;
    notifyListeners();
    log("auth mobile $mobile");
    final otp = await mobileAuthRepository.mobileLoginWithFirebase(
      mobile,
      countryCode,
      context,
    );
    _isLoggedIn = true;
    _isLoading = false;
    notifyListeners();
    return;
  }

  Future<UserCredential> verifyOtp(String otp) async {
    _isLoggedIn = false;
    _isLoading = true;
    notifyListeners();
    final result = await mobileAuthRepository.verifyLoginOtp(
      otp,
    );
    _isLoggedIn = true;
    _isLoading = false;
    notifyListeners();
    return result;
  }

  Future<UserCredential> loginWithEmail(
    String email,
    String password,
  ) async {
    _isLoggedIn = false;
    _isLoading = true;
    notifyListeners();
    final result = await mobileAuthRepository.emailLoginWithFirebase(
      email,
      password,
    );
    _isLoggedIn = true;
    _isLoading = false;
    notifyListeners();
    return result;
  }
}
