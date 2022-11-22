import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/presentation/screens/settings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'homepage.dart';

class news extends StatefulWidget {
  const news({Key? key}) : super(key: key);

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  @override
  Widget build(BuildContext context) {
   int  _currentIndex =1;
    return Scaffold(
      appBar: AppBar(title: Text("News", style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),centerTitle:  true,backgroundColor: Colors.white,),
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 2),
        /// TODO: Get data form API.
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Card(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: const NetworkImage(
                        'https://www.accfb.org/wp-content/uploads/2019/03/In-the-news-icon.jpg',
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                    Text('News $index'),
                      //  Spacer(),
                        SizedBox(height: 10,),
                        Padding(
                          padding: EdgeInsetsDirectional.only(top: 1.5),
                          child: Text(
                         'Title $index',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = 1),
        items: [


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
