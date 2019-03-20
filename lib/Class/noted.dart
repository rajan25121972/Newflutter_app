class Profile {
  int _id;
  String _name;
  String _imagename;
  String _imagepath;

  Profile(this._name, this._imagename,this._imagepath);

  Profile.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._imagename = obj['imagename'];
    this._imagepath = obj['imagepath'];
  }

  int get id => _id;

  String get name => _name;

  String get imagename => _imagename;

  String get imagepath => _imagepath;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['imagename'] = _imagename;
    map['imagepath'] = _imagepath;

    return map;
  }

  Profile.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._imagename = map['imagename'];
    this._imagepath = map['imagepath'];
  }
}
