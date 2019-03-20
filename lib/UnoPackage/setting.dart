import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:image_picker/image_picker.dart';

class Setting extends StatefulWidget {
  @override
  _Setting createState() => new _Setting();
}

class _Setting extends State<Setting> {
  File _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 350.0,
              width: double.infinity,
            ),
            Container(
                height: 200.0, width: double.infinity, color: Colors.blue),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardRoute()),
                    ),
                color: Colors.white,
              ),
            ),
            Positioned(
              top: 125.0,
              left: 15.0,
              right: 15.0,
              child: Material(
                elevation: 3.0,
                borderRadius: BorderRadius.circular(7.0),
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                      color: Colors.white),
                ),
              ),
            ),
            Positioned(
              top: 75.0,
              left: (MediaQuery.of(context).size.width / 2 - 50.0),
              child: _image == null
                  ? Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.0),
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/noprofile.jpg'), //_image == null ? AssetImage('assets/noprofile.jpg') :
                            fit: BoxFit.cover),
                      ),
                    )
                  : new Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: new BoxDecoration(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(50.0)),
                        //border: Border.all(color: const Color(0xFF28324E)),
                      ),
                      child: new Image.file(_image),
                    ),
              //Image.file(_image)
            ),
            Positioned(
              top: 140.0,
              left: (MediaQuery.of(context).size.width / 2 - 10.0),
              child: Container(
                height: 100.0,
                width: 100.0,
                child: Column(
                  // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    new IconButton(
                      icon: new Icon(
                        Icons.camera_alt,
                        size: 30.0,
                      ),
                      tooltip: 'Change Profile',
                      onPressed: ImagePickerAlert,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 190.0,
              left: (MediaQuery.of(context).size.width / 2) - 105.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'VARADA CHARY S',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    'VICE PRESIDENT',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        color: Colors.blue,
                        onPressed: () {},
                        child: Text(
                          '9987512284',
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 5.0),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        color: Colors.grey,
                        onPressed: () {},
                        child: Text(
                          'STF10175',
                          style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.white),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
        ),
        SizedBox(height: 10.0),
        SizedBox(height: 25.0),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Settings',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 5.0),
          child: Container(
            height: 100.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                getSettingIcons("setting"),
                getSettingIcons("App Permission"),
                getSettingIcons("Change Password"),
                getSettingIcons("Update DB"),
                getSettingIcons("About Us"),
              ],
            ),
          ),
        ),
        SizedBox(height: 15.0),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '',
                style: TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
              )
            ],
          ),
        ),
        SizedBox(height: 15.0),
      ],
    ));
  }

  Widget getWorks(String imgPath) {
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Container(
        height: 100.0,
        width: 125.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            image:
                DecorationImage(image: AssetImage(imgPath), fit: BoxFit.cover)),
      ),
    );
  }

  Widget getSettingIcons(String titlename) {
    Icon customicon;

    switch (titlename) {
      case "setting":
        customicon = new Icon(
          Icons.settings,
          size: 50,
        );
        break;
      case "App Permission":
        customicon = new Icon(
          Icons.lock,
          size: 50,
        );
        break;
      case "Change Password":
        customicon = new Icon(
          Icons.vpn_key,
          size: 50,
        );
        break;
      case "Update DB":
        customicon = new Icon(
          Icons.update,
          size: 50,
        );
        break;
      case "About Us":
        customicon = new Icon(
          Icons.info_outline,
          size: 50,
        );
        break;
    }

    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Container(
        height: 100.0,
        width: 125.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(
            color: Colors.black,
            width: 1.0,
          ),
        ),
        child: Column(
          // Replace with a Row for horizontal icon + text
          children: <Widget>[
            SizedBox(height: 10.0),
            customicon,
            SizedBox(height: 10.0),
            Text(
              titlename,
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  Widget menuCard(String title, String imgPath, String type, int rating,
      double views, double likes) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(7.0),
        elevation: 4.0,
        child: Container(
          height: 125.0,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              SizedBox(width: 10.0),
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(7.0)),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 15.0),
                  Text(
                    title,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 7.0),
                  Text(
                    type,
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        color: Colors.grey,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 7.0),
                  Row(
                    children: <Widget>[],
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: <Widget>[
                      Icon(Icons.remove_red_eye,
                          color: Colors.grey.withOpacity(0.4)),
                      SizedBox(width: 3.0),
                      Text(views.toString()),
                      SizedBox(width: 10.0),
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      SizedBox(width: 3.0),
                      Text(likes.toString())
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  ImagePickerAlert() {
    final screenSize = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Change Profile')),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                      child: new IconButton(
                        alignment: Alignment.topRight,
                        icon: new Icon(
                          Icons.camera_alt,
                          color: Colors.blue,
                        ),
                        onPressed: () => getCamera(context),
                        //  _selectDate(context, "voucher_date"),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                  FlatButton(
                      child: new IconButton(
                        alignment: Alignment.topRight,
                        icon: new Icon(
                          Icons.filter,
                          color: Colors.blue,
                        ),
                        onPressed: () => getGalary(context),
                        //  _selectDate(context, "voucher_date"),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ]),
          );
        });
  }

  Future getCamera(BuildContext context) async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
      print(image.path);
      //scanfile = File(image.path);

      String base64Image = base64Encode((image.readAsBytesSync()));
      print(base64Image);
      String fileName = image.path.split("/").last;
    });
  }

  Future getGalary(BuildContext context) async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print(image.path);
      //scanfile = File(image.path);

      String base64Image = base64Encode((image.readAsBytesSync()));
      print(base64Image);
      String fileName = image.path.split("/").last;
    });
  }
}
