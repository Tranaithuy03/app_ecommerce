import 'package:app_my_pham/feature/authentication/screens/login/login.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/onboarding.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/verify_email.dart';
import 'package:app_my_pham/navigation_container.dart';
import 'package:app_my_pham/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:app_my_pham/utils/exceptions/firebase_exceptions.dart';
import 'package:app_my_pham/utils/exceptions/format_exceptions.dart';
import 'package:app_my_pham/utils/exceptions/platform_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get
      .find(); // tìm và trả về 1 instance của lớp này đã được đk trước đó thông qua put
  //variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    //chỉ chạy 1 lần khi widget đã hiển thị xong( đã build v render, gọi khi controller và các tp khác đã sẵn sàng
    // => các tác vụ như gọi api, truy vấn database,..
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() {
    final user = _auth.currentUser;
    if(user != null){
      if(user.emailVerified){
        Get.offAll(()=> const NavigationContainer());
      }else{
        Get.offAll(()=>  VerifyEmailScreen(email: _auth.currentUser!.email));
      }
    }
    else{
      deviceStorage.writeIfNull('isFirstTime', true);
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  //đăng ký
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MPFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const MPFormatException();
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }

  Future<void> sendEmailVerification() async {
    try{
      await _auth.currentUser?.sendEmailVerification();
    }on FirebaseAuthException catch (e) {
      throw MPFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const MPFormatException();
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  ///logout
  Future<void> logout() async {
    try{
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(()=> const LoginScreen());
    }on FirebaseAuthException catch (e) {
      throw MPFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const MPFormatException();
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
  Future<UserCredential> loginWithEmailAndPassword( String email, String password) async{
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw MPFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const MPFormatException();
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
  ///sign in with google
  Future<UserCredential> signInWithGoogle() async{
    try {
      final GoogleSignInAccount? account = await GoogleSignIn().signIn();//kích hoạt luồng đăng nhập, trả về thông tin tài khoản người dùng đăng nhập
      final GoogleSignInAuthentication? googleAuth = await account?.authentication;///lấy thông tin xác thực
      final credentials = GoogleAuthProvider.credential(///tạo thông tin để dùng với firebase
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );
      ///đaăng nhập với firebase thông qua thông tin xác thực
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw MPFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw MPFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw const MPFormatException();
    } on PlatformException catch (e) {
      throw MPPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong';
    }
  }
}
