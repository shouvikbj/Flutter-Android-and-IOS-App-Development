import 'package:flutter/material.dart';
import '../model/chat.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messageData.length,
      itemBuilder: (context, i) => (Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          ListTile(
            leading: CircleAvatar(
              maxRadius: 30,
              backgroundImage: NetworkImage(messageData[i].imageUrl),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  messageData[i].name,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  messageData[i].time,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
            subtitle: Container(
              padding: EdgeInsets.only(top: 5.0),
              child: Text(
                messageData[i].message,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
              ),
            ),
            onTap: () {},
          ),
          Divider(
            height: 20.0,
          ),
        ],
      )),
    );
  }
}
