import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/Models/lectures_model.dart';

class data_card extends StatelessWidget {
  data_card({
    required this.lecturesModel,
    Key? key,
  }) : super(key: key);
  LecturesModel lecturesModel;
  @override
  Widget build(BuildContext context) {
    return
     Card(

       child: Padding(
padding: const EdgeInsets.all(15),
         child: Column(
           children: [
             Row(children: [
               Text(lecturesModel.lectureTitle,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
               Spacer(),
               Icon(Icons.alarm_outlined),
               Text(lecturesModel.lectureTime),
             ],),
             SizedBox(height: 20,),
             Row(children: [
Text("Exam Date",style: TextStyle(color: Colors.grey),),
               Spacer(),
               Text("Start Time",style: TextStyle(color: Colors.grey),),
               Spacer(),
               Text("End Time ",style: TextStyle(color: Colors.grey),),

             ],),
SizedBox(height: 2,),
             Row(children: [
Icon(Icons.calendar_month_sharp),
               Text(lecturesModel.examDate),
               Spacer(),
               Icon(Icons.watch_later,color: Colors.greenAccent,),
               Text(lecturesModel.startTime),
               Spacer(),
               Icon(Icons.watch_later,color: Colors.redAccent,),
               Text(lecturesModel.endTime),


             ],),
           ],
         ),
       ),
      );

  }
}
