import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class InformationWidget extends StatefulWidget {
  @override
  InformationWidgetState createState() => new InformationWidgetState();
}

class InformationWidgetState extends State<InformationWidget> {
  //Map<String,dynamic> data;
  List<dynamic> data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://192.168.1.6:8080/API_Hotel/api.php"),
        headers: {"Accept": "application/json"});
    setState(() {
      data = json.decode(response.body);
    });
    return "Success!";
    //print(data[1]);
    //return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index) {
          return new Container(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.blue,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Text(
                                "ID: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["id_nguoidung"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Họ Tên: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["hoten_nguoidung"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Giới tính: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["gioitinh_nguoidung"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Ngày sinh: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["ngaysinh_nguoidung"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Số ngày làm: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["songaylam"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Số ngày nghỉ: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["songaynghi"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Lương cơ bản: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["luongcoban"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Lương thực nhận: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["luongthucnhan"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Username: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["user"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Password: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["pass"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Text(
                                "Chức vụ: ",
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                              Text(
                                data[index]["chucvu"],
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ]),
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
