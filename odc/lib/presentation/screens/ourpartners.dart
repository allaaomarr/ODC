import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class ourpartners extends StatefulWidget {
  const ourpartners({Key? key}) : super(key: key);

  @override
  State<ourpartners> createState() => _ourpartnersState();
}

class _ourpartnersState extends State<ourpartners> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Our Partners", style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),centerTitle:  true,backgroundColor: Colors.white,),
     body: InkWell(
        child: Container(
            child:
            Link(
              uri: Uri.parse(
    'https://www.orangedigitalcenters.com/'),
              target: LinkTarget.blank,
              builder: (BuildContext ctx, FollowLink? openLink) {
                return TextButton.icon(
                  onPressed: openLink,
                  label:


                     // Text("Website Read More ....",style: TextStyle(color: Colors.orange),),
                      Container(
           padding: EdgeInsetsDirectional.all(30),
                          height: 150,
                          child: Center(
                            child: Row(
                              children: [
                                Text("Orange", style: TextStyle(fontSize: 25, color: Colors.orange),),
                                Text("  Digital Center",style: TextStyle(fontSize: 25,color: Colors.black),),
                              ],
                            ),
                          ),
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                         color: Colors.grey,
                      ),),
                  //  ],
               //   ),
                  icon: const Icon(Icons.read_more,color: Colors.orange,),
                );
              },
            ),
        ),

      ),
    );

  }

}
