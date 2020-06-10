import 'package:flutter/material.dart';
import 'dart:async';
import '../database_helper.dart';
import '../Note.dart';
import 'note_details.dart';
import 'package:sqflite/sqflite.dart';

class NoteList extends StatefulWidget {
  @override
  _NoteListState createState() => _NoteListState();
}

class _NoteListState extends State<NoteList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Note> noteList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (noteList == null) {
      noteList = List<Note>();
      updateListView();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo App'),
        backgroundColor: Colors.black,
      ),
      body: getNoteListView(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35.0,
        ),
        onPressed: () {
          navigateToDetails(Note("", "", 2), 'Add Note');
        },
      ),
    );
  }

  ListView getNoteListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (context, position) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.black,
          elevation: 4.0,
          child: ListTile(
            leading: CircleAvatar(
              // backgroundImage:
              //     NetworkImage("https://learncodeonline.in/mascot.png"),
              backgroundImage: AssetImage("images/todo.jpg"),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(5.0),
                ),
                Text(
                  getPriority(this.noteList[position].priority) + " Priority.",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(3.0),
                ),
                Text(
                  this.noteList[position].title,
                  style: TextStyle(
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.noteList[position].date,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                Text(
                  this.noteList[position].description,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
              ],
            ),
            trailing: GestureDetector(
              child: Icon(
                Icons.open_in_new,
                color: Colors.white,
              ),
              onTap: () {
                navigateToDetails(this.noteList[position], 'Edit ToDo');
              },
            ),
          ),
        );
      },
    );
  }

  String getPriority(int value) {
    String priority;
    switch (value) {
      case 1:
        priority = 'High';
        break;
      case 2:
        priority = 'Low';
        break;
    }
    return priority;
  }

  void navigateToDetails(Note note, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return NoteDetail(note, title);
      },
    ));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Note>> noteListFuture = databaseHelper.getNoteList();
      noteListFuture.then((noteList) {
        setState(() {
          this.noteList = noteList;
          this.count = noteList.length;
        });
      });
    });
  }
}
