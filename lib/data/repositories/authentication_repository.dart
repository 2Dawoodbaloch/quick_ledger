import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quick_ledger/data/repositories/accounts/account_repository.dart';
import 'package:quick_ledger/features/authentication/screens/login/login.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/format_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final localStorage = GetStorage();
  final _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  @override
  void onReady() {
    super.onReady();
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // fucntion to redirect user to appropriate screen based on authentication status
  // void screenRedirect() {
  //   final user = _auth.currentUser;
  //   if (user != null) {
  //     // check if user is verified or not
  //     if (user.emailVerified) {
  //       // if verified then go to navigation menu
  //       Get.offAll(() => NavigationMenu());
  //     } else {
  //       // if not verified then go to verify email screen
  //       Get.offAll(() => VerifyEmailScreen(email: user.email));
  //     }
  //   } else {
  //     // write isFirstTime if Null
  //     localStorage.writeIfNull('isFirstTime', true);
  //     // Check if user is first time
  //     localStorage.read('isFirstTime') != true
  //         ? Get.to(() => LoginScreen())
  //         : Get.to(() => NavigationMenu());
  //   }
  // }
  Future<void> screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
           // NOW we know for certain a user exists — safe to fetch
     
      Get.offAllNamed(RoutesName.navigationMenu);
    } else {
      Get.offAllNamed(RoutesName.login);
    }
  }

  // // authentication - with email & password
  Future<UserCredential> registerUser(String email, String password) async {
    log("register user");
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // email authentication - sign in with email & password
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // email verification - send email
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Logout - logout the user
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn.instance.signOut();
      Get.offAllNamed(RoutesName.login);
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // Google Sign in
  Future<UserCredential> signInWithGoogle() async {
    try {
      // get instance of google
      GoogleSignIn googleSignIn = GoogleSignIn.instance;

      // initialize google sign in
      await googleSignIn.initialize(
        serverClientId:
            "722178177690-mdkb9kgoc3ij4n90atneueifr4h3jcr5.apps.googleusercontent.com",
      );

      //web client id :   722178177690-udutodq7bn11rhggmr3136e38fql1ndj.apps.googleusercontent.com

      // create user account
      GoogleSignInAccount googleUser = await googleSignIn.authenticate(
        scopeHint: ['email'],
      );
      final googleAuth = await googleUser.authentication;
      // create credentails
      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.idToken,
      );

      UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }


  // change password
  Future<void> changePassword({
  required String currentPassword,
  required String newPassword,
}) async {
  try {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      throw "User not logged in";
    }

    // Re-authenticate user
    final credential = EmailAuthProvider.credential(
      email: user.email!,
      password: currentPassword,
    );

    await user.reauthenticateWithCredential(credential);

    // Update password
    await user.updatePassword(newPassword);

  } on FirebaseAuthException catch (e) {
    throw GFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw GFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw GPlatformException(e.code).message;
  } catch (e) {
    throw e.toString();
  }
}
}
