import 'package:flutter/material.dart';
import '../model/calls.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: callData.length,
      itemBuilder: (context, i) => (Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          ListTile(
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(callData[i].imageUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  callData[i].name,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(""),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.call_received,
                    color: Colors.grey,
                    size: 15.0,
                  ),
                  Text(
                    "  " + callData[i].time,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                  ),
                ],
              ),
            ),
            trailing: Icon(
              Icons.videocam,
              color: Colors.white70,
            ),
          ),
          Divider(
            height: 20.0,
          ),
        ],
      )),
    );
  }
}
