import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
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
      Get.toNamed('/signup');
    } else {
      Get.toNamed('/home');
    }
  }

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Utils.getErrorSnackbarBottom(
          'signup_failed'.tr, 'signup_failed'.tr, 'signup_error'.tr);
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Utils.getErrorSnackbarBottom(
          'login_failed'.tr, 'login_failed'.tr, 'login_error'.tr);
    }
  }

  void logOut() async {
    await auth.signOut();
  }
}
