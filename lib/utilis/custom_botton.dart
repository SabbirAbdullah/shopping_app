import 'package:ecommerce_mobile_app/utilis/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton{
  static Button(VoidCallback voidcallback, String text, ){
    return SizedBox(height: 50,width: 300,
      child: ElevatedButton(onPressed: () {
        voidcallback();
      }, child: Text(text,style: TextStyle(color: kcontentColor,fontSize: 20),),
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(kbuttonColor)),
      ) ,
    );

  }
}


