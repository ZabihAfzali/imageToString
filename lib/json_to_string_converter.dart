import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

Future<String> jsonToString(String filePath) async {
  try {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    return jsonString;
  } catch (e) {
    print('Error reading JSON file: $e');
    return '';
  }
}

void main() async {
  String filePath = 'path_to_json_file.json';
  String jsonString = await jsonToString(filePath);

  runApp(JsonToString(jsonString));
}

class JsonToString extends StatelessWidget {
  final String jsonString;

  JsonToString(this.jsonString);

  @override
  Widget build(BuildContext context) {
    // Parse the JSON string into a Map
    final jsonData = json.decode(jsonString);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('JSON Data'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Name: ${jsonData['name']}'),
              Text('Age: ${jsonData['age']}'),
              Text('Email: ${jsonData['email']}'),
              Text('Address: ${jsonData['address']['street']}, ${jsonData['address']['city']}, ${jsonData['address']['state']}, ${jsonData['address']['country']}'),
              Text('Interests: ${jsonData['interests'].join(', ')}'),
              Text('Is Student: ${jsonData['isStudent']}'),
            ],
          ),
        ),
      ),
    );
  }
}
