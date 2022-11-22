import 'package:flutter/material.dart';
import 'package:odc/presentation/views/data_card.dart';
import 'package:sizer/sizer.dart';


import '../../data/Models/lectures_model.dart';

class sections extends StatelessWidget {
  sections({Key? key}) : super(key: key);

  List lecturesModelDummyData = <LecturesModel>[
    LecturesModel(
        lectureTitle: 'Flutter',
        lectureTime: '3HRs',
        examDate: '20-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'React',
        lectureTime: '3HRs',
        examDate: '9-08-2022',
        startTime: '1:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Ionic',
        lectureTime: '4HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Xamarin',
        lectureTime: '4HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
    LecturesModel(
        lectureTitle: 'Android',
        lectureTime: '4HRs',
        examDate: '19-08-2022',
        startTime: '12:00 PM',
        endTime: '2:00 PM'),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sections",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),centerTitle: true,backgroundColor: Colors.white,),
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
