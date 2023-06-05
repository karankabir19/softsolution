import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

String code = "+91";
var validOtp ;
class CustomAuth {
  // Firebase Email&Pass Login
  static User? user = FirebaseAuth.instance.currentUser;


  Future<void> phoneNumber({required String phone}) async {
    // print('----------------$picCountyCode $phone');
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+$code $phone',
        verificationCompleted: (PhoneAuthCredential credential) {
          print('-------------------Complete ${credential.token}');
        },
        verificationFailed: (FirebaseAuthException e) {
          print('-------------------Failed $e');
        //   Fluttertoast.showToast(
        //       msg: e.message!,
        //       backgroundColor: Colors.red,
        //       textColor: Colors.white,
        //       toastLength: Toast.LENGTH_LONG,
        //       gravity: ToastGravity.TOP);
        // },
        codeSent: (String verificationId, int? resendToken) {
          print('-----------------OTP Send');
          PhoneAuth.verify = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message!,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP);
      print(e);
      // Logger().i(e);

    }
  }

  // Firebase OTP verification

  Future<UserCredential?> otpverify({required String otp}) async {
    print('==============OTP :$otp---------------------- ');
    print('==============verify :${PhoneAuth.verify}---------------------- ');

    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: PhoneAuth.verify, smsCode: otp);

      // Sign the user in (or link) with the credential
      var user = await FirebaseAuth.instance.signInWithCredential(credential);
      return user;
      print('User Get :${user}');

    }on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: e.message!,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.TOP);
      return null;
    }

  }

  // Firebase with Logout
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
    GoogleSignIn().signOut();
    print('========Logout=======');
  }

}