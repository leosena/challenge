import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trz/Classes/Surivor.dart';
import 'package:http/http.dart' as http;


Future<Survivor> createSurvivorPost (String name, String age, String gender, String lat, String lon, String items) async {
  final String apiUrl = "http://zssn-backend-example.herokuapp.com/api/people.json";
  String lonlatStr = "POINT ($lat $lon)";
  Survivor survTmp = new Survivor(name: name, age: int.tryParse(age), gender: gender, lonlat: lonlatStr, items: items);

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



Future<Survivor> updateSurvivorPost (String name, String age, String gender, String lat, String lon, String uuid) async {
  final String apiUrl = "http://zssn-backend-example.herokuapp.com/api/people/$uuid.json";
  String lonlatStr = "POINT ($lat $lon)";

  Survivor survTmp = new Survivor(name: name, age: int.tryParse(age), gender: gender, lonlat: lonlatStr);

  var bodyValue = survTmp.toJson();
  var bodyData = json.encode(bodyValue);

  print(bodyData);

  //final response = await http.post(apiUrl, body: bodyData);
  final response = await http.put(
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

Future<int> reportInfectedPost () async {

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String fuuid = await prefs.getString("fid");
  String uuid = await prefs.getString("id");

  final String apiUrl = "http://zssn-backend-example.herokuapp.com/api/people/$uuid/report_infection.json";

  var bodyData = json.encode(<String, dynamic>{
    "infected": fuuid,
    "id": uuid,
  });

  final response = await http.post(
    apiUrl,
    headers: {"Content-Type": "application/json"},
    body: bodyData,
  );

  print (response.statusCode);

  if(response.statusCode == 204){
    return response.statusCode;
  }else{
    return null;
  }
}


//http://zssn-backend-example.herokuapp.com/api/people/59295abd-455f-4156-abc7-121f3ea3191e/report_infection.json