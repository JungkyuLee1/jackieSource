import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:login/common/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constants/db_cons.dart';
import 'package:login/controllers/auth_controller.dart';

import '../common/custom_full_screen_dialog.dart';

class LoginRepository {
  static AuthController authController = Get.find<AuthController>();

  //google Login
  static Future<void> googleLogin() async {
    try {
      GoogleSignInAccount? googleSignInAccount =
          await authController.googleSignIn.signIn();

      if (googleSignInAccount == null) {
        CustomFullScreenDialog.cancelDialog();
      } else {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        OAuthCredential oAuthCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);

        await authController.firebaseAuth.signInWithCredential(oAuthCredential);
        final currentUser = authController.firebaseAuth.currentUser;

        await userRef.doc(currentUser!.uid).set({
          'id': currentUser.uid,
          'email': currentUser.email,
          'name': currentUser.displayName,
          'imageUrl': currentUser.photoURL,
          'type': 'google',
          'remark': '',
        });
      }
      authController.loginType.value = 'google';
    } catch (e) {
      throw Widgets.showSnackBar(
          'Login failed', e.toString(), Colors.white, Colors.white);
    }
  }

  //email login
  static Future<void> emailLogin(String email, String password) async {
    try {
      await authController.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'no account';
    }
    authController.loginType.value = 'email';
  }

  //email signup
  static Future<void> emailSignup(String email, String password) async {
    try {
      await authController.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      final uid = authController.firebaseAuth.currentUser!.uid;

      await userRef.doc(uid).set({
        'id': uid,
        'email': email,
        'password': password,
        'name': '',
        'imageUrl':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT8A2wOvDj7sAobit1mD4lCc6ilEaBm_CF3AQ&usqp=CAU',
        'type': 'email',
        'remark': '',
      });
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw 'account exist';
    }
    authController.loginType.value = 'email';
  }
}
