import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odc/data/Models/notes_model.dart';
import 'package:odc/data/data_provider/local/notesdb.dart';
import 'package:snack/snack.dart';


import '../widgets/inputField.dart';

class addnote extends StatefulWidget {
 addnote({Key? key}) : super(key: key);

  @override
  State<addnote> createState() => _addnoteState();
}

class _addnoteState extends State<addnote> {
  TextEditingController title_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  final bar = SnackBar(content: Text('Notes Successfully updated'),);
  late Data db;
  List<NotesModel> datas = [];
  bool fetching = true;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title :Text(" Add Note",style: TextStyle(color: Colors.black,fontSize:20 ),) ,centerTitle :true,backgroundColor: Colors.white,),
    body :  Container(
      margin: EdgeInsetsDirectional.all(20),
      child: Column(
        children: [
          SizedBox(height: 20,),
          inputfield(label: "title", iconButton: IconButton(icon:Icon(Icons.edit), onPressed: () {  },),controller:title_controller ,),
           SizedBox(height: 25,),
          inputfield(label: "Description", iconButton: IconButton(icon:Icon(Icons.edit), onPressed: () {  },),max: 7,controller: description_controller,),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
db.AddDB(NotesModel( description: description_controller.text, title: title_controller.text, date: DateTime.now()));
 bar.show(context);
          }, child: Text("Add Task",style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
           primary: Colors.orange,
          ),)

        ],
      ),
    )
    );
  }
}
