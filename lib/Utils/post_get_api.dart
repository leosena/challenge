import 'dart:convert';
import 'package:trz/Classes/Surivor.dart';
import 'package:http/http.dart' as http;


Future<Survivor> createSurvivorPost (String name, String age, String gender, String items) async {
  final String apiUrl = "http://zssn-backend-example.herokuapp.com/api/people.json";
  Survivor survTmp = new Survivor(name: name, age: int.tryParse(age), gender: gender, items: items);

  var bodyValue = survTmp.toJson();
  var bodyData = json.encode(bodyValue);

  print(bodyData);

  //final response = await http.post(apiUrl, body: bodyData);
  final response = await http.post(
    apiUrl,
    headers: {"Content-Type": "application/json"},
    body: bodyData,
  );

  if(response.statusCode == 201){
    return Survivor.fromJson(json.decode(response.body));
  }else{
    return null;
  }
}

Future<Survivor> fetchSurvivorGet (String uuid) async {
  final response = await http.get('http://zssn-backend-example.herokuapp.com/api/people/$uuid.json');
  //final response = await http.get('http://zssn-backend-example.herokuapp.com/api/people/65642bde-9b2a-46fc-9849-0ce74ad00063.json');

  if (response.statusCode == 200) {
    print(json.decode(response.body));
    return Survivor.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Survivor');
  }
}



Future<Survivor> updateSurvivorPost (String name, String age, String gender, String items, String lonlat, String uuid) async {
  final String apiUrl = "http://zssn-backend-example.herokuapp.com/api/people/$uuid.json";
  String lonlatStr = "POINT ($lonlat)";

  Survivor survTmp = new Survivor(name: name, age: int.tryParse(age), gender: gender, items: items, lonlat: lonlatStr);

  var bodyValue = survTmp.toJson();
  var bodyData = json.encode(bodyValue);

  print(bodyData);

  //final response = await http.post(apiUrl, body: bodyData);
  final response = await http.post(
    apiUrl,
    headers: {"Content-Type": "application/json"},
    body: bodyData,
  );

  if(response.statusCode == 201){
    return Survivor.fromJson(json.decode(response.body));
  }else{
    return null;
  }



}