import 'dart:convert';


/*

      Player info Class

 */


Survivor survivorFromJson(String str) => Survivor.fromJson(json.decode(str));

String survivorToJson(Survivor data) => json.encode(data.toJson());


class Survivor {
  String id;
  int age;
  String name;
  String gender;
  String items;
  String lonlat;

  //Survivor({this.name, this.age, this.gender, this.items});
  Survivor({this.id, this.name, this.age, this.gender, this.items, this.lonlat});


  factory Survivor.fromJson(Map<String, dynamic> json) => Survivor(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    items: json["items"],
    lonlat: json["lonlat"]
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "gender": gender,
    "items": items,
    "lonlat": lonlat,
  };

  String printSurvivorInfo () {
    String str;

    str = "Name: $name\n\n$gender, $age\n\nLocation: $lonlat\n\n";
    return str;
  }

  String returnSurvivorID () {
    String str;

    str = "$id";
    return str;
  }

}



