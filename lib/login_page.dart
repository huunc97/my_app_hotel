import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:login/home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var userController = new TextEditingController();
  var passController = new TextEditingController();
  var response;
  var data;
@override
  Widget build(BuildContext context) {
    Future<String> getLogin(String user) async {
      response = await http.get(
          Uri.encodeFull("http://192.168.1.6:8080/API_Hotel/api.php"),
          headers: {"Accept": "application/json"});

      print(response.body);
      setState(() {
        data = json.decode(response.body);
        //data = convertDataToJson['result'];
      });
      return ("haha");
    }

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo1.png'),
      ),
    );

    var user = TextFormField(
      //keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: userController,
    );

    var password = TextFormField(
      autofocus: false,
      //initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      controller: passController,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            if (data[0]['user'] == user &&
                data[0]['pass'] == password) {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => new HomePage()));
            } else {
              var alert = new AlertDialog(
                title: new Text(" Error"),
                content: new Text(
                    "There was an error signing in. Please try again."),
              );
              showDialog(context: context, child: alert);
            }
          }
         // getLogin(userController.text);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(
              height: 48.0,
            ),
            user,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel
          ],
        ),
      ),
    );
  }
}
