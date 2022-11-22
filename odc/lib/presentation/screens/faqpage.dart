import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fqapage extends StatefulWidget {
  const fqapage({Key? key}) : super(key: key);

  @override
  State<fqapage> createState() => _fqapageState();
}

class _fqapageState extends State<fqapage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQ", style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),centerTitle:  true,backgroundColor: Colors.white,),
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
    itemBuilder: (context, index) => Card(
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.white,
          )),
    child:  Padding(
      padding: const EdgeInsets.all(20),
      child: Column (
      children: [
          Text("Q1 : How many Countries Orange Digital Center is in ?",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
          Text("16 Countries"),

      ],
      ),
    ),
    ),
           itemCount: 1,
    ),
      )
    );
  }
}
