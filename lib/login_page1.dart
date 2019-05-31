import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:login/home_page.dart';
import 'package:login/placeholder_page.dart';

class LoginPage1 extends StatefulWidget {
  @override
  LoginPage1State createState() => new LoginPage1State();
}

class LoginPage1State extends State<LoginPage1> {
  var _userController = new TextEditingController();
  var _passwordController = new TextEditingController();
  var data;
  var response;

  var _isSecured = true;
  @override
  Widget build(BuildContext context) {
    /**************** Get Login Connection && Data ************************/
    Future<String> getLogin(String user) async {
      response = await http.get(
          Uri.encodeFull("http://192.168.1.6:8080/API_Hotel/api.php?"),
          headers: {"Accept": "application/json"});

      print(response.body);
      setState(() {
        data = json.decode(response.body);
        //data = convertDataToJson['result'];
      });
      return ("haha");
    }

    /*********************Alert Dialog user******************************/
    void onSignedInErrorPassword() {
      var alert = new AlertDialog(
        title: new Text("user Error"),
        content: new Text(
            "There was an Password error signing in. Please try again."),
      );
      showDialog(context: context, child: alert);
    }

    /*********************Alert Dialog user******************************/
    void onSignedInErroruser() {
      var alert = new AlertDialog(
        title: new Text("user Error"),
        content:
            new Text("There was an user error signing in. Please try again."),
      );
      showDialog(context: context, child: alert);
    }

    /******************* Check Data ****************************/
    VerifData(String user, String password, var datadb) {
      for (int i = 0; i < 10; i++) {
        if (data[i]['user'] == user && data[i]['pass'] == password) {
          // Navigator.of(context).pushNamed("/seconds");
          var route = new MaterialPageRoute(
              builder: (BuildContext context) => new HomePage()
              //new SecondPage(idUser: data[0]['user_id'],firstname: data[0]['first_name'],lastname: data[0]['last_name'],username: data[0]['username'],),
              );
          Navigator.of(context).push(route);
        }
      }
    }

    /******************* LOGO ************************/
    var logo = new Center(
      child: new Container(
        width: 190.0,
        height: 190.0,
        decoration: new BoxDecoration(
          shape: BoxShape.circle,
          image: new DecorationImage(
              fit: BoxFit.fill,
              image: new NetworkImage(
                  "https://vignette.wikia.nocookie.net/flutter-butterfly-sanctuary/images/7/7f/FlutterLogo.PNG/revision/latest?cb=20131017172902")),
        ),
      ),
    );
    /*******************************************************/

    /****************** TextField user*******************************/
    var user = new ListTile(
      leading: const Icon(Icons.person),
      title: TextFormField(
        decoration: InputDecoration(
            labelText: "Your user",
            filled: true,
            hintText: "Write your user please",
            border: InputBorder.none),
        controller: _userController,
      ),
    );

    /************************************************************/

    /******************** TextField Password ******************************/
    var password = new ListTile(
      leading: const Icon(Icons.remove_red_eye),
      title: TextField(
        decoration: InputDecoration(
            // icon: new IconButton(
            // icon: Icon(
            //   Icons.remove_red_eye,
            // ),
            // onPressed: () {
            //   setState(() {
            //     _isSecured = !_isSecured;
            //   });
            // }),
            filled: true,
            labelText: "your Password",
            hintText: "Write your Password please",
            border: InputBorder.none),
        //obscureText: _isSecured,
        controller: _passwordController,
      ),
    );

    /********************* Button Login****************************************/
    var loginButton = new Container(
      child: RaisedButton(
        child: const Text('LogIn'),
        color: Theme.of(context).accentColor,
        elevation: 8.0,
        splashColor: Colors.blueGrey,
        onPressed: () {
          // Perform some action
          //SnackBar(content: Text("TEST SNACK BAR"),backgroundColor: Colors.deepOrange,);
          getLogin(_userController.text);
          VerifData(_userController.text, _passwordController.text, data);
        },
      ),
    );
/*************************************************/

    /********************Button Cancel ***********************/
    var cancelButton = new Container(
      child: FlatButton(
        child: const Text('Cancel'),
        onPressed: () {
          _passwordController.clear();
          _userController.clear();
        },
      ),
    );

/***********************************************/

    return new Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: 50.0,
          ),
          logo,
          SizedBox(
            height: 50.0,
          ),
          new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Card(
              elevation: 8.0,
              color: Colors.white,
              child: new Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: <Widget>[
                    user,
                    password,
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[cancelButton, loginButton],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
