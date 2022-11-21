import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  String msg1 = "";
  String msg2 = "";
  String msg3 = "";
  String msg4 = "";
  String msg5 = "";
  String msg6 = "";
  TextEditingController txt1 = new TextEditingController();
  TextEditingController txt2 = new TextEditingController();
  TextEditingController txt3 = new TextEditingController();
  TextEditingController txt4 = new TextEditingController();
  TextEditingController txt5 = new TextEditingController();
  TextEditingController txt6 = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Pratik"),
        ),
        body: Center(
          child: Column(children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              controller: txt1,
            ),
            Text("${msg1}"),
            TextField(
              decoration: InputDecoration(
                labelText: 'Gender',
              ),
              controller: txt2,
            ),
            Text("${msg2}"),
            TextField(
              decoration: InputDecoration(
                labelText: 'E-Mail',
              ),
              controller: txt3,
            ),
            Text("${msg3}"),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              controller: txt4,
            ),
            Text("${msg4}"),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contact',
              ),
              controller: txt5,
            ),
            Text("${msg5}"),
            TextField(
              decoration: InputDecoration(
                labelText: 'Address',
              ),
              controller: txt6,
            ),
            Text("${msg6}"),
            ElevatedButton(
                onPressed: () {
                  SubmitData();
                },
                child: const Text('Sign up')),
          ]),
        ), 
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void SubmitData() async{
    var url = Uri.https('akashsir.in','/myapi/venue_finder/api/api-signup.php');
    var response = await http.post(
      url,body:{
        'user_name':txt1.text,
        'user_gender':txt2.text,
        'user_email':txt3.text,
        'user_password':txt4.text,
        'user_contact':txt5.text,
        'user_address':txt6.text,

      }
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}