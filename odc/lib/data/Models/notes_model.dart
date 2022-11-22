class NotesModel {
  var id;
  var description;
  var title;
  var date;

  NotesModel({
  this.id,
    required this.description,
    required this.title,
    required this.date,
  });
  factory NotesModel.fromMap(Map<String,dynamic> json) => NotesModel(id : json["id"],description :json["description"],title: json["title"], date: json["date"]);
  Map<String,dynamic> toMap()=>
      {
        "id" : id,
        "title" : title,
        "description" :  description,
        "date" : date,

      };
}
