import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medical_healthcare/auth/model/user_model.dart';

class AuthService {
  Future createAccount(UserModel userModel) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: userModel.email,
      password: userModel.password,
    );
    print('account created');
  }

  Future login(UserModel userModel) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userModel.email, password: userModel.password);
    print('Login Successfully');
  }

  Future googleLogin() async {
    GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      var result = await googleSignIn.signIn();
      if (result == null) {
        throw Exception('Google sign in error');
      }
      final userData = await result.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return finalResult;
    } catch (e) {
      rethrow;
    }
  }

  Future verifyPhoneNumber(
    String phoneNumber,
    Function(String) codeSent,
    Function(FirebaseAuthException) verificationFailed,
  ) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: verificationFailed,
      codeSent: (verificationId, resendToken) {
        codeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }
  Future signInWithOtp(String verificationId, String otp)async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp,);
    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  Future resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
