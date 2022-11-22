import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/presentation/screens/events.dart';
import 'package:odc/presentation/screens/finals.dart';
import 'package:odc/presentation/screens/lectures.dart';
import 'package:odc/presentation/screens/login/loginscreen.dart';
import 'package:odc/presentation/screens/midterms.dart';
import 'package:odc/presentation/screens/notes.dart';
import 'package:odc/presentation/screens/register/registerscreen.dart';
import 'package:odc/presentation/screens/sections.dart';
import 'package:odc/presentation/screens/settings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'lectures.dart';
import 'news.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}


List<Icon> icons = [
  Icon(
    Icons.menu_book_outlined,
    color: Colors.orange,
    size: 40,
  ),
  Icon(
    Icons.people_outline_rounded,
    color: Colors.orange,
    size: 40,
  ),
  Icon(
    Icons.calendar_today_outlined,
    color: Colors.orange,
    size: 40,
  ),
  Icon(
    Icons.calendar_today,
    color: Colors.orange,
    size: 40,
  ),
  Icon(
    Icons.calendar_month,
    color: Colors.orange,
    size: 40,
  ),
  Icon(
    Icons.sticky_note_2_sharp,
    color: Colors.orange,
    size: 40,
  ),
];
List<String> titles = [
  'Lectures',
  'Sections',
  'Midterms',
  'Finals',
  'Events',
  'Notes',
];
List<Widget> nav = [
  Lectures(),
  sections(),
  midterms(),
  finals(),
  events(),
  notes(),
];

class _homeState extends State<home> {
  int _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/orange.jpg",
          alignment: AlignmentDirectional.topEnd,width: 250,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsetsDirectional.all(20),
        child: GridView.builder(
          itemCount: 6,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => nav[index],
                      ));
                },
                child: Card(
                  margin: EdgeInsetsDirectional.all(5),
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsetsDirectional.all(15),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        icons[index],
                        Text(

                      titles[index],
                          style: TextStyle(
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = 0),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home,),
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
    ]
    )
    );

  }
}
