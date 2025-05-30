
import 'package:ecommerce_mobile_app/screens/nav_bar_screen.dart';
import 'package:ecommerce_mobile_app/utilis/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utilis/custom_botton.dart';
import '../../auth.dart';
import '../forget_pass/forgetpassword.dart';
import '../signup/signup.dart';
import 'controller/loginController.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool toHide = true;

  login(String email, String password) async {
    if (email == "" && password == "") {
      return LoginController.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
              LoginController.showLoading();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const BottomNavBar()));
          return null;
        });
      } on FirebaseAuthException catch (ex) {
        return LoginController.CustomAlertBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    width: 200,
                    height: 200,
                    child: Image.asset("images/icon.png",
                        height: 200, width: 200)),
              ],
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    color: Colors.white),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const Text(
                        "Welcome",
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      LoginController.CustomTextextField(
                          emailController, 'Email', Icons.mail),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 05),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: toHide,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      toHide = !toHide;
                                    });
                                  },
                                  icon: toHide
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),

                      ///forget password
                      const SizedBox(
                        height: 1,
                      ),
                      Container(
                          padding: const EdgeInsets.only(right: 40),
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgetPassword()));
                              },
                              child: const Text(
                                "Forget Password ?",
                              ))),

                      ///login
                      const SizedBox(
                        height: 10,
                      ),

                      CustomButton.Button(() async {
                        LoginController.showLoading();
                        var sharedPref = await SharedPreferences.getInstance();
                        sharedPref.setBool(CheckUserState.KEYLOGIN, true);
                        login(emailController.text.toString(),
                            passwordController.text.toString());
                      }, "Login"),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Create an account ?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),

                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Divider(
                                  color: Colors.grey,
                                  indent: 50,
                                  endIndent: 10,
                                  thickness: 0.5,
                                ),
                              ),
                              Text("or sign in with"),
                              Flexible(
                                child: Divider(
                                  color: Colors.grey,
                                  indent: 10,
                                  endIndent: 50,
                                  thickness: 0.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              width: 80,
                              height: 100,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage(
                                      'images/google_logo.png'),
                                  height: 30,
                                  width: 30,
                                ),
                              )),
                          SizedBox(
                              width: 80,
                              height: 100,
                              child: IconButton(
                                onPressed: () {},
                                icon: const Image(
                                  image: AssetImage(
                                      'images/facebook_logo.png'),
                                  height: 30,
                                  width: 30,
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
