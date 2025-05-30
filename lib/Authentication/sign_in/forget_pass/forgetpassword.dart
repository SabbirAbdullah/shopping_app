
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utilis/custom_botton.dart';
import '../login/controller/loginController.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  forgetpassword (String email)async{
    if(email==""){
      return LoginController.CustomAlertBox(context, "Enter an email to reset password");

    }else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password"),),
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          LoginController.CustomTextextField(emailController, "Email", Icons.mail,),
          SizedBox(height: 20,),
          CustomButton.Button((){
            forgetpassword(emailController.text.toString());
          }, "Reset Password"),
        ],
      ),
      
    );
  }
}
