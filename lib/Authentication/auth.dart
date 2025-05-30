
import 'package:ecommerce_mobile_app/Authentication/sign_in/login/controller/loginController.dart';
import 'package:ecommerce_mobile_app/Authentication/sign_in/login/login.dart';
import 'package:ecommerce_mobile_app/screens/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => CheckUserState();

}

class CheckUserState extends State<CheckUser> {

  @override
  void initState() {
     checkUser();
    super.initState();

  }
  static const String KEYLOGIN = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold();

  }

  checkUser() async {
    var sharedPref = await SharedPreferences.getInstance();
    var userLoggedIn = sharedPref.getBool(KEYLOGIN);

    if (userLoggedIn != null) {
      if (userLoggedIn) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => BottomNavBar()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }
}



