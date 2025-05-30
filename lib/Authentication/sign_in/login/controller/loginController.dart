
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginController {

  static CustomTextextField(TextEditingController controller,String text,IconData iconData,){

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical:05),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
      ),
    );
  }

  static CustomName(TextEditingController controller, String text){
    return Padding(padding: const EdgeInsets.symmetric(horizontal: 30,vertical:05),
        child: TextField(controller: controller,
            decoration: InputDecoration(
                hintText: text,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ))
        ) );
  }


  static CustomPhone(TextEditingController controller, String text){
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical:05),
        child: TextField(controller: controller, keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: text,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                ))
        ) );
  }

  static CustomAlertBox( BuildContext context, String text){
    return showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text(text),
      );

    });
  }

  static showLoading() {
    EasyLoading.show(status: 'Loading...');
    // Simulate a background task
    Future.delayed(Duration(seconds: 2), () {
      EasyLoading.dismiss();
    });
  }


}

