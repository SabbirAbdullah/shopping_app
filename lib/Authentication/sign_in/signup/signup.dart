
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_mobile_app/Authentication/sign_in/login/login.dart';
import 'package:ecommerce_mobile_app/screens/nav_bar_screen.dart';
import 'package:ecommerce_mobile_app/utilis/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import '../../../utilis/custom_botton.dart';
import '../login/controller/loginController.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  var gender = ["Male", "Female", "Other"];
  bool toHide = true;
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 30),
        firstDate: DateTime(DateTime.now().year - 50),
        lastDate: DateTime(DateTime.now().year));

    if (picked != null) {
      setState(() {
        dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  signUp(String name, String email, String password, String phone,
      String gender, String dob) async {
    if (email == "" && password == "") {
      LoginController.CustomAlertBox(context, "Enter Required Fields");
    } else {
      UserCredential? usercredential;
      try {
        usercredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } on FirebaseAuthException catch (ex) {
        return LoginController.CustomAlertBox(context, ex.code.toString());
      }
    }
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser = auth.currentUser;

    CollectionReference collectionRef =
     FirebaseFirestore.instance.collection("Users Data");
    return collectionRef.doc(currentUser!.email).set({
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
      "phone": phoneController.text,
      "gender": genderController.text,
      "dob": dobController.text,
    }).then((value) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const BottomNavBar()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kprimaryColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                padding: const EdgeInsets.all(5),
              ),
              onPressed: () {
                Navigator.pop(context);

              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            SizedBox(
                child: Image.asset(
              "images/icon.png",
              height: 200,
              width: 200,
            )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(children: [
                    const Text(
                      "Signup",
                      style: TextStyle(fontSize: 25),
                    ),

                    LoginController.CustomName(nameController, 'Full Name'),
                    LoginController.CustomTextextField(
                        emailController, 'Email', Icons.mail),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 05),
                      child: TextFormField(
                        obscureText: toHide,
                        controller: passwordController,
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
                    // LoginController.CustomPassword(passwordController, 'Password',Icons.visibility,true),
                    LoginController.CustomPhone(
                      phoneController,
                      'Phone',
                    ),

                    ///DOB
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 05),
                        child: TextField(
                          controller: dobController,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Birth Date",
                              suffixIcon: IconButton(
                                  onPressed: () => selectDate(context),
                                  icon: const Icon(Icons.calendar_month_outlined)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        )),

                    ///gender
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 05),
                        child: TextField(
                          controller: genderController,
                          readOnly: true,
                          decoration: InputDecoration(
                              hintText: "Select Your Gender",
                              suffixIcon: DropdownButton(
                                items: gender.map((String value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: new Text(value),
                                    onTap: () {
                                      setState(() {
                                        genderController.text = value;
                                      });
                                    },
                                  );
                                }).toList(),
                                onChanged: (value) {},
                                borderRadius: BorderRadius.circular(20),
                                icon: const Icon(Icons.keyboard_arrow_down_outlined),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        )),

                    const SizedBox(
                      height: 20,
                    ),

                    CustomButton.Button(() async {

                      await signUp(
                          nameController.text.toString(),
                          emailController.text.toString(),
                          passwordController.text.toString(),
                          phoneController.text.toString(),
                          genderController.text.toString(),
                          dobController.text.toString());
                      LoginController.showLoading().
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                    }, "Sign UP")
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
