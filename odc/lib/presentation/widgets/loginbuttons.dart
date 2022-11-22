

import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/presentation/screens/register/registerscreen.dart';

Widget loginbuttons() {
  return Column(
children: [
  GestureDetector(
    onTap: (){

    },
    child: Container(
      width: 390,
      height: 50,
      child: Container(
          alignment: AlignmentDirectional.center,
          child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),)),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange, width: 2),
      ),
    ),
  ),

  SizedBox(height: 10,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      Expanded(
        child: Divider(
          indent: 20.0,
          endIndent: 10.0,
          thickness: 2,
        ),
      ),
      Text(
        "OR",
        style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w400),
      ),
      Expanded(
        child: Divider(
          indent: 10.0,
          endIndent: 20.0,
          thickness: 2,
        ),
      ),
    ],),

  SizedBox(height: 10,),


  Container(
    width: 390,
    height: 50,
    child: Container(
      alignment: AlignmentDirectional.center,
      child: Text("Sign Up",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold,fontSize: 20),),),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.orange, width: 2),
    ),
  ),


],
  );
}