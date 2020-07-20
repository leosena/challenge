/*

      Player info Class

 */
import 'dart:convert';

Survivor survivorFromJson(String str) => Survivor.fromJson(json.decode(str));

String survivorToJson(Survivor data) => json.encode(data.toJson());


class Survivor {
  String age;
  String name;
  String gender;
  String items;

  Survivor({this.name, this.age, this.gender, this.items});


  factory Survivor.fromJson(Map<String, dynamic> json) => Survivor(
    name: json["name"],
    age: json["age"],
    gender: json["gender"],
    items: json["items"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "age": age,
    "gender": gender,
    "items": items,
  };

}