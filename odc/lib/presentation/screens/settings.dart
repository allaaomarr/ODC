

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/presentation/screens/faqpage.dart';
import 'package:odc/presentation/screens/login/loginscreen.dart';
import 'package:odc/presentation/screens/ourpartners.dart';
import 'package:odc/presentation/screens/termsandconditions.dart';
import 'package:odc/presentation/screens/support.dart';

import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'homepage.dart';
import 'news.dart';

class settings extends StatefulWidget {
  const settings({Key? key}) : super(key: key);

  @override
  State<settings> createState() => _settingsState();
}

class _settingsState extends State<settings> {


  @override
  Widget build(BuildContext context) {
    int _currentIndex = 2;
    return Scaffold(
      appBar: AppBar(title: Text("Settings", style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),centerTitle:  true,backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column
          (
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text("FAQ" ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),

                  Spacer(),

                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => fqapage(),
                    ),);
                  }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text("Terms & Conditions",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),

                  Spacer(),

                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => termsandconditions(),
                    ));
                  }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text("Our Partners",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                  Spacer(),
                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ourpartners(),
                    ));
                  }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text("Support",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),

                  Spacer(),

                  IconButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => support(),
                    ));
                  }, icon: Icon(Icons.arrow_forward_ios_rounded,color: Colors.grey,)),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  Text("Log Out",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),

                  Spacer(),

                  IconButton(
                      onPressed: () {
                     var alert =   AlertDialog
                          (
                               alignment: AlignmentDirectional.center,
                            title: new Text("Logout"),
                           content: new Text("Are you sure?"),
                           actions :[


                                  Row ( children :[


                          new ElevatedButton(
                            style: ElevatedButton.styleFrom(

                              primary: Colors.orange,
                            ),

                            onPressed: () => Navigator.pop(context),
                            child: new Text("Cancel"),
                          ),
                                    SizedBox(width: 10,),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(

                                        primary: Colors.orange,
                                      ),
                                      onPressed: ()  {
                                        Navigator.push(context,MaterialPageRoute(builder: (context) => loginScreen()));
                                      },
                                      child: new Text("Sure"),
                                    ),
] ),
                               ],
                        );
                        showDialog(
                            context: context,
                            builder: (context) {
                              return alert;
                            });
                        //
                      }, icon: Icon(Icons.arrow_forward_ios_rounded, color:  Colors.grey,)),
                ],
              ),

            )
          ],


        ),
      ),


      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = 2),
        items: [

          /// Home
          SalomonBottomBarItem(
            icon: IconButton(icon: Icon(Icons.home,),onPressed: (){
    Navigator.push(context,MaterialPageRoute(
    builder: (context) => home(),),); },),
            title: Text("Home"),
            selectedColor: Colors.orange,
          ),


          SalomonBottomBarItem(
            icon: IconButton(icon: Icon(Icons.newspaper,),onPressed: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => news(),),); },),
            title: Text("News"),
            selectedColor: Colors.orange,
          ),


          SalomonBottomBarItem(
            icon:IconButton(icon: Icon(Icons.settings,),onPressed: (){
              Navigator.push(context,MaterialPageRoute(
                builder: (context) => settings(),


              ),);}),
            title: Text("Settings"),
            selectedColor: Colors.orange,


          ),
        ],
      ),
    );
  }
}

/*  Widget item(String text , Widget nav)
  {
    return Row(
      children: [
        Text(text),

        Spacer(),

        IconButton(onPressed: (){  Navigator.push(context,MaterialPageRoute(
          builder: (context) => nav,
        ));}, icon:Icon(Icons.arrow_forward_ios_rounded)),
      ],
    );
  }*/