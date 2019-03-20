import 'package:flutter/material.dart';
import 'package:flutter_app/Class/noted.dart';

import '../utils/DatabaseHelper.dart';

class NoteScreen extends StatefulWidget {
  final Profile profile;

  NoteScreen(this.profile);

  @override
  State<StatefulWidget> createState() => new _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = new TextEditingController(text: widget.profile.name);
    _descriptionController =
        new TextEditingController(text: widget.profile.imagepath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.profile.id != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.profile.id != null) {
                  db
                      .updateProfile(Profile.fromMap({
                    'id': widget.profile.id,
                    'title': _titleController.text,
                    'description': _descriptionController.text
                  }))
                      .then((_) {
                    Navigator.pop(context, 'update');
                  });
                } else {


                  db
                      .saveProfile(Profile(
                          _titleController.text,
                          _descriptionController.text,
                          _descriptionController.text))
                      .then((_) {
                    Navigator.pop(context, 'save');
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
