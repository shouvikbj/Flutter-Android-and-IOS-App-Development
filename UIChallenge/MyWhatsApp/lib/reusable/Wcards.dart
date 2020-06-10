import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Wcards extends StatelessWidget {
  final String name, imageurl, time;

  Wcards(this.name, this.imageurl, this.time);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 25,
        foregroundColor: Colors.deepPurple,
        backgroundImage: NetworkImage(imageurl),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white70,
        ),
      ),
      subtitle: Text(
        time,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
        ),
      ),
    );
  }
}
