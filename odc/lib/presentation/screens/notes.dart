import 'package:flutter/material.dart';
import 'package:snack/snack.dart';

import '../../data/Models/notes_model.dart';
import '../../data/data_provider/local/notesdb.dart';
import 'addnote.dart';


class notes extends StatefulWidget {
  const notes({Key? key}) : super(key: key);

  @override
  State<notes> createState() => _notesState();
}

late final Function delete;

class _notesState extends State<notes> {
  var task_controller = TextEditingController();
  var description_controller = TextEditingController();
  var date_controller = TextEditingController();

  final dateTime = DateTime.now();
  List<NotesModel> datas = [];
  int currentIndex = 0;
  final bar = SnackBar(content: Text('Notes Successfully updated'),);

//final Function delete;
  late final int index;
  bool fetching = true;
  bool end_task = false;
  bool value = false;
  var check;
  late Data db;


  @override
  void initState() {
    super.initState();
    db = Data();
    getData();
  }

  void getData() async {
    datas = await db.getdata();
    setState(() {
      fetching = false;
    });
  }

  bool? ischecked = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar( title :Text("Notes",style: TextStyle(color: Colors.black,fontSize:20 ),) ,centerTitle :true,backgroundColor: Colors.white,),
      body: fetching
          ? CircularProgressIndicator()
          : Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: datas.length,
            itemBuilder: (BuildContext context, int index) {
              return

                Card(

                  margin: EdgeInsetsDirectional.all(5),
                  child: Container(
                    padding: EdgeInsetsDirectional.all(5),
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey, width: 2),
                    ),

                    child:

                            Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Icon(Icons.title,color: Colors.orange,),
                                                SizedBox(width: 2,),
                                                Text(
                                                  datas[index].title.toString(),
                                                  style: TextStyle(
                                                      fontSize: 20, color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.description,color: Colors.orange,),
                                                SizedBox(width: 2,),
                                                Text(
                                                  datas[index].description.toString(),
                                                  style: TextStyle(
                                                      fontSize: 20, color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),


Spacer(),

                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              edit(datas[index], index);
                                              bar.show(context);
                                            },
                                            icon:
                                            Icon(Icons.edit, color: Colors.orangeAccent,
                                              size: 25,)),

                                        IconButton(
                                            onPressed: () {
                                              delete(index);
                                              //  bar.show(context);
                                            },
                                            icon:
                                            Icon(Icons.delete_outline, color: Colors
                                                .orangeAccent, size: 25,)),


                                      ],
                                    ),
                                      ]),
                                  ),
                                    Row(children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.calendar_month,
                                              size: 20, color: Colors.orange)),
                                      Text(
                                        datas[index].date.toString(),
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      ),



                                    ]),






                                ]),

                        ),




                  );

            }
        //   SizedBox(height: 10,);
      ),
          ),
      floatingActionButton: FloatingActionButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => addnote(),)); },child: (Icon(Icons.add)),backgroundColor: Colors.orange,),
    );
  }
  delete(int index) {
    debugPrint("Deleted!");
    db.delete(datas[index].id!);
    setState(() {
      datas.removeAt(index);
    });
  }



  edit(NotesModel item, int index) {
    task_controller.text = datas[index].title!;
    description_controller.text = datas[index].description!;
    date_controller.text = datas[index].date!;
    var alert = AlertDialog(
      title: new Text("Update note"),
      content: Column(
        children: <Widget>[
          new Expanded(
            child: new TextField(
              controller: task_controller,
              autofocus: true,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius:BorderRadius.circular(20),),
                labelText: task_controller.text,
                labelStyle:TextStyle(fontSize:20,color: Colors.orange,),
                hintText: "eg. Update note",
                icon:  new Icon(Icons.title,color: Colors.orange,),
              ),
            ),
          ),
          new Expanded(
            child: new TextField(
              controller: description_controller,
              autofocus: true,

              decoration: InputDecoration(
    focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orange),
    borderRadius:BorderRadius.circular(20),),
                labelText: description_controller.text,
                labelStyle:TextStyle(fontSize:20,color: Colors.orange,),
                hintText: "eg. Update note",
                icon:   new Icon(Icons.description,color: Colors.orange,),
              ),
            ),
          ),

              ],
              ),



      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(

            primary: Colors.orange,
          ),
          onPressed: () async {
         NotesModel updateItem = NotesModel.fromMap({
              "title": task_controller.text,
              "description" : description_controller.text,
              "date" : dateTime.toString() ,
              "id": item.id
            });
            //redrawing scree
            await db.updateItem(updateItem); //updating note

setState(() {
  getData();
});

            Navigator.pop(context);
          },
          child: new Text("Update"),
        ),
        new ElevatedButton(
          style: ElevatedButton.styleFrom(

            primary: Colors.orange,
          ),
          onPressed: () => Navigator.pop(context),
          child: new Text("Cancel"),
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}



