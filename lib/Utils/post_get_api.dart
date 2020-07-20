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

  /*
    print(response);
    print(response.body);
    print(response.toString());
    print(response.headers);
    print(response.request);
    print(response.isRedirect);
    print(response.reasonPhrase);
     */



  if(response.statusCode == 201){
    return Survivor.fromJson(json.decode(response.body));
  }else{
    return null;
  }
}