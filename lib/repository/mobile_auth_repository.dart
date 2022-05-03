import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MobileAuthRepository {
  String? verifyId;
  ConfirmationResult? confirmationResult;
  Future<void> mobileLoginWithFirebase(
    String mobile,
    String countryCode,
    BuildContext context,
  ) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    log("Senders mobile number: ${countryCode + mobile}");
    if (kIsWeb) {
      // For logging in with mobile number on WEB
      confirmationResult =
          await _auth.signInWithPhoneNumber(countryCode + mobile);
      log("getting verifyID $confirmationResult");
      return;
    }
    await _auth.verifyPhoneNumber(
      phoneNumber: countryCode + mobile,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (cred) {
        log("verification completed $cred");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Otp Sent Successfully"),
            backgroundColor: Colors.green,
          ),
        );
      },
      verificationFailed: (cred) {
        log("verification failed $cred");
      },
      codeSent: (verificationId, [int? code]) async {
        log('code sent data $verificationId - $code');
        verifyId = verificationId;
      },
      codeAutoRetrievalTimeout: (timeout) {},
    );
    return;
  }

  Future<UserCredential> emailLoginWithFirebase(
    String email,
    String password,
  ) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    var creds = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return creds;
  }

  Future<UserCredential> verifyLoginOtp(String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    if (kIsWeb) {
      // For confirming OTP on WEB
      log("Sending web verifyID $confirmationResult");
      return await confirmationResult!.confirm(otp);
    }
    log("Sending verifyID $verifyId");
    var creds = await _auth.signInWithCredential(
      PhoneAuthProvider.credential(
        verificationId: verifyId!,
        smsCode: otp,
      ),
    );
    return creds;
  }

  Future<void> logout() async {
    return Future.value();
  }
}
