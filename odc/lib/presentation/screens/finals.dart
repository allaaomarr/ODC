import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/presentation/views/data_card.dart';

import '../../data/Models/lectures_model.dart';


class finals extends StatelessWidget {
  finals({Key? key}) : super(key: key);
  List lecturesModelDummyData = <LecturesModel>[
    LecturesModel(
        lectureTitle: 'Flutter Exam',
        lectureTime: '3HRs',
        examDate: '19-09-2023',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'React Exam',
        lectureTime: '3HRs',
        examDate: '8-09-2023',
        startTime: '1:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Ionic Exam',
        lectureTime: '4HRs',
        examDate: '18-09-2023',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Xamarin Exam',
        lectureTime: '4HRs',
        examDate: '18-09-2023',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Android Exam',
        lectureTime: '4HRs',
        examDate: '18-09-2023',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Finals",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              elevation: 5,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                  )),
              margin: EdgeInsets.symmetric(
                vertical: 1,
              ),
              child: data_card(
                lecturesModel: lecturesModelDummyData[index],
              ),
            ),
          ),
          itemCount: lecturesModelDummyData.length,
          padding: EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
    );
  }
}