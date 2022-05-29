import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/globals/string_globals.dart';
import 'package:walk_with_me/screens/dashboard.dart';
import 'package:walk_with_me/screens/signin.dart';
import 'package:walk_with_me/utils/utils.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());
    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const Signin());
    } else {
      Get.offAll(() => const DashBoard());
    }
  }

  void register(String email, String password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Utils.getErrorSnackbarBottom(
        StringGlobals.ERRROR_TEXT,
        StringGlobals.REGISTRATION_ERROR_MESSAGE,
        e.toString(),
      );
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Utils.getErrorSnackbarBottom(
        StringGlobals.ERRROR_TEXT,
        StringGlobals.LOGIN_ERROR_MESSAGE,
        e.toString(),
      );
    }
  }
}
