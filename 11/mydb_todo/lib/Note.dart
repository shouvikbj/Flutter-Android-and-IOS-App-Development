class Note {
  int _id;
  String _title;
  String _description;
  String _date;
  int _priority;

  Note(this._title, this._date, this._priority, [this._description]);
  Note.withId(this._id, this._title, this._date, this._priority,
      [this._description]);

  // all the getters
  int get id => _id;
  String get title => _title;
  String get description => _description;
  String get date => _date;
  int get priority => _priority;

  // all the setters
  set title(String newData) {
    if (newData.length <= 255) {
      this._title = newData;
    }
  }

  set description(String newData) {
    if (newData.length <= 255) {
      this._description = newData;
    }
  }

  set date(String newData) {
    this._date = newData;
  }

  set priority(int newData) {
    if (newData >= 1 && newData <= 2) {
      this._priority = newData;
    }
  }

  // used to save and retrieve from DB
  //// convert Note object to Map object
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['priority'] = _priority;
    map['date'] = _date;

    return map;
  }

  Note.fromMapObject(Map<String, dynamic> map){
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._priority = map['priority'];
    this._date = map['date'];
  }

}
