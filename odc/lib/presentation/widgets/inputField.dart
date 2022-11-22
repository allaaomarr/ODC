import 'package:flutter/material.dart';

class inputfield extends StatefulWidget{
  String? label;
  TextEditingController? controller;
  TextInputType? keyboard;
  IconData? icon;
  IconButton iconButton;
  Function? validate;
double edge1;
double edge2;
double edge3;
 double edge4;
   int max ;
  bool isPasswordField;
  bool isObscureText;
  inputfield({required this.label,this.controller,this.isPasswordField = false,
    this.isObscureText = false,this.keyboard,this.validate,required this.iconButton ,this.edge1=20,this.edge2=20,this.edge3=20,this.edge4=20,this.max=1});


  @override
  State<inputfield> createState() => _inputfieldState();
}

class _inputfieldState extends State<inputfield> {


  @override
  Widget build(BuildContext context) {
    return

      TextFormField(
          textAlignVertical: TextAlignVertical.top,
          obscureText: widget.isObscureText,
        enableInteractiveSelection: false,
        cursorColor: Colors.black,
        validator:(s)=>widget.validate!(s) ,
        controller:widget.controller,
        keyboardType:widget.keyboard,
        // expands: true,
        maxLines: widget.max ,
        decoration:InputDecoration(
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
      borderRadius:BorderRadius.circular(20),
  ),
          contentPadding: EdgeInsets.fromLTRB(widget.edge1,widget.edge2 , widget.edge3, widget.edge4),

          border:OutlineInputBorder(
            borderRadius:BorderRadius.circular(20),

            borderSide: BorderSide(color:Colors.deepOrange),
          ),

          labelText:widget.label,
          labelStyle:TextStyle(fontSize:20,color: Colors.orange,),
          hintText: widget.label,
          hintStyle:TextStyle(fontSize:15,color: Colors.grey) ,
          suffixIcon:widget.isPasswordField ? IconButton(
          icon:Icon((widget.isObscureText)? Icons.visibility_off : Icons.visibility),
    color: Colors.orange,
    onPressed: (){
    setState(() {
    widget.isObscureText = !widget.isObscureText;
    });
    }):widget.iconButton,
          suffixIconColor: Colors.orange,
        )
      );


  }
}