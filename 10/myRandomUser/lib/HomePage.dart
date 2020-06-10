import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List usersData;
  bool isLoading = true;
  final url = "https://randomuser.me/api/?results=50";

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull(url),
      headers: {"Accept": "application/json"},
    );

    List data = jsonDecode(response.body)['results'];
    setState(() {
      usersData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Users"),
      ),
      body: Container(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: usersData == null ? 0 : usersData.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Row(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(30.0),
                            child: Image(
                              width: 70.0,
                              height: 70.0,
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                usersData[index]['picture']['thumbnail'],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  usersData[index]['name']['first'] +
                                      " " +
                                      usersData[index]['name']['last'],
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone,
                                      size: 15.0,
                                    ),
                                    Text(
                                      "  Phone : ${usersData[index]['phone']}",
                                    ),
                                  ],
                                ),
                                // Text(
                                //   "Cell : ${usersData[index]['cell']}",
                                // ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.person,
                                      size: 15.0,
                                    ),
                                    Text(
                                      "  Gender : ${usersData[index]['gender']}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      size: 15.0,
                                    ),
                                    Text(
                                      "  Age : ${usersData[index]['dob']['age']}",
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.email,
                                      size: 15.0,
                                    ),
                                    Text(
                                      "  email : ${usersData[index]['email']}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
