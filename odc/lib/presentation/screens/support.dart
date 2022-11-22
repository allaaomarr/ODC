import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/data/Models/support_model.dart';
import 'package:snack/snack.dart';

import '../../data/data_provider/local/supportdb.dart';

class support extends StatefulWidget {
  const support({Key? key}) : super(key: key);

  @override
  State<support> createState() => _supportState();
}



class _supportState extends State<support> {
  TextEditingController name_controller = TextEditingController();
  TextEditingController support_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  final bar = SnackBar(content: Text('Your request is Sent , We will contact you soon thank you'),);
  late Data db;
  List<SupportModel> datas = [];
  bool fetching = true;

  @override
  void initState() {
    super.initState();
    db = Data();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(title:  Text("Support",style: TextStyle(color: Colors.black),),centerTitle:  true,backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children :[
          TextFormField(
   controller:  name_controller,
            textAlignVertical: TextAlignVertical.top,

            enableInteractiveSelection: false,
            cursorColor: Colors.black,

            //controller:widget.controller,
         //   keyboardType:widget.keyboard,
            // expands: true,
            maxLines: 2 ,
            decoration:InputDecoration(
              filled: true,
              fillColor: Color(0xbfbfbf),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
                borderRadius:BorderRadius.circular(10),
              ),
              contentPadding: EdgeInsets.fromLTRB(10,10 , 10, 10),

              border:OutlineInputBorder(
                borderRadius:BorderRadius.circular(10),

                borderSide: BorderSide(color:Colors.black),
              ),

              labelText: "Name",
              labelStyle:TextStyle(fontSize:17,color: Colors.grey,),
              hintText: "Name",
              hintStyle:TextStyle(fontSize:15,color: Colors.grey, fontWeight: FontWeight.w300) ,
              prefixIcon:IconButton(icon:Icon(Icons.person,color: Colors.orange,) , onPressed: () { },color: Colors.grey,padding: EdgeInsets.all(15),alignment:AlignmentDirectional.topCenter,iconSize:25,),
              suffixIconColor: Colors.grey,
            ),
          ),
            SizedBox(height: 10,),
            TextFormField(
      controller: email_controller,
              textAlignVertical: TextAlignVertical.top,

              enableInteractiveSelection: false,
              cursorColor: Colors.black,

              //controller:widget.controller,
              //   keyboardType:widget.keyboard,
              // expands: true,
              maxLines: 2 ,
              decoration:InputDecoration(
                filled: true,
                fillColor: Color(0xbfbfbf),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius:BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.fromLTRB(10,10 , 10, 10),

                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),

                  borderSide: BorderSide(color:Colors.black),
                ),

                labelText: "E-Mail",
                labelStyle:TextStyle(fontSize:17,color: Colors.grey,),
                hintText: "E-Mail",
                hintStyle:TextStyle(fontSize:15,color: Colors.grey, fontWeight: FontWeight.w300) ,
                prefixIcon:IconButton(icon:Icon(Icons.email,color: Colors.orange,) , onPressed: () { },color: Colors.grey,padding: EdgeInsets.all(15),alignment:AlignmentDirectional.topCenter,iconSize:25,),
                suffixIconColor: Colors.grey,
              ),
            ),
            SizedBox(height: 10,),
            TextFormField(
 controller:support_controller ,
              textAlignVertical: TextAlignVertical.top,

              enableInteractiveSelection: false,
              cursorColor: Colors.black,

              //controller:widget.controller,
              //   keyboardType:widget.keyboard,
              // expands: true,
              maxLines: 6,
              decoration:InputDecoration(
                filled: true,
 fillColor: Color(0xbfbfbf),

                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                  borderRadius:BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.fromLTRB(10,10 , 10, 10),

                border:OutlineInputBorder(
                  borderRadius:BorderRadius.circular(10),

                  borderSide: BorderSide(color:Color(0xff747474)),
                ),

              //  labelText: "What's making you unhappy?",
                labelStyle:TextStyle(fontSize:17,color: Colors.grey,),
                hintText: "What's making you unhappy?",
                hintStyle:TextStyle(fontSize:15,color: Colors.grey, fontWeight: FontWeight.w300) ,
             //   prefixIcon:IconButton(icon:Icon(Icons.email) , onPressed: () { },color: Colors.grey,padding: EdgeInsets.all(15),alignment:AlignmentDirectional.topCenter,iconSize:25,),
                suffixIconColor: Colors.grey,
              ),
            ),
             SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              db.AddDB(SupportModel(email: email_controller.text, name: name_controller.text, support: support_controller.text));
              bar.show(context);
            }, child: Text("Submit",style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
              ),)

          ]
        ),
      ) ,
    );
  }
}
