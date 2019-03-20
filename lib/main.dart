import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/AsynkTask/fetchdata.dart';
import 'package:flutter_app/Class/BoookingStatefullWidget.dart';
import 'package:flutter_app/Class/MyJsonData.dart';
import 'package:flutter_app/UnoPackage/booking.dart';
import 'package:flutter_app/UnoPackage/setting.dart';

import 'package:flutter_app/main1.dart';
import 'package:flutter_app/ui/listview_note.dart';

//void main() => runApp(MyApp());

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
      title: 'Navigation Basics',
      home: DashboardRoute(),
      //home: BookingPage1(),
      debugShowCheckedModeBanner: false));
}

class DashboardRoute extends StatefulWidget {
  @override
  _DashboardRouteState createState() => new _DashboardRouteState();
}

class _DashboardRouteState extends State<DashboardRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DashBoard',
              style: TextStyle(
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0,
                  color: Colors.white)),
          automaticallyImplyLeading: false,
        ),
        body: Center(),
        endDrawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new SizedBox(
              height: 120.0,
              child: new DrawerHeader(
                  child: new Text('Shriram Value Services',
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  decoration: new BoxDecoration(color: Colors.blue),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(10.0)),
            ),
//          DrawerHeader(
//            child: Text('Shriram Value Services',
//                textDirection: TextDirection.ltr),
//            decoration: BoxDecoration(
//              color: Colors.blue,
//            ),
//          ),
            Container(
//            decoration: BoxDecoration(
//              //                    <-- BoxDecoration
//              border: Border(
//                bottom: BorderSide(),
//              ),
//            ),
              child: ListTile(
                title: Text(
                  'Home ',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.black),
                ),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
//            decoration: BoxDecoration(
//              //                    <-- BoxDecoration
//              border: Border(
//                bottom: BorderSide(),
//              ),
//            ),
              child: ListTile(
                title: Text('Advance',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => ListViewNote()),
//             );
                },
              ),
            ),
            Container(
//            decoration: BoxDecoration(
//              //                    <-- BoxDecoration
//              border: Border(
//                bottom: BorderSide(),
//              ),
//            ),

              child: ListTile(
                title: Text('Booking',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Booking()),
                  );
                  // Then close the drawer
                },
              ),
            ),

//              ListTile(
//                title: Text('Json Response'),
//                onTap: () {
//                  // Update the state of the app
//                  // ...
//                  Navigator.pop(context);
//                  Navigator.push(
//                    context,
//                    // MaterialPageRoute(builder: (context) => MyJsonData(post: fetchPost())),
//                    MaterialPageRoute(builder: (context) => MyJsonData( userdata: callWebServiceForLofinUser("amar","123"))),
//
//                  );
//                  // Then close the drawer
//
//                },
//              ),

            Container(
//            decoration: BoxDecoration(
//              //                    <-- BoxDecoration
//              border: Border(
//                bottom: BorderSide(),
//              ),
//            ),
              child: ListTile(
                title: Text('Reimbursment',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  Navigator.pop(context);
//              Navigator.push(
//                context,
//                // MaterialPageRoute(builder: (context) => MyJsonData(post: fetchPost())),
//                MaterialPageRoute(
//                    builder: (context) => MyJsonData(
//                        userdata: callWebServiceForLofinUser("amar", "123"))),
//              );
                  // Then close the drawer
                },
              ),
            ),
            Container(
//            decoration: BoxDecoration(
//              //                    <-- BoxDecoration
//              border: Border(
//                bottom: BorderSide(),
//              ),
//            ),
              child: ListTile(
                title: Text('Setting',
                    style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.black)),
                onTap: () {
                  // Update the state of the app
                  // ...
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                  // Then close the drawer
                },
              ),
            ),
          ],
        )),
        bottomNavigationBar: Material(
          child: Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              new BoxShadow(
                color: Colors.black,
                blurRadius: 10.0,
              )
            ]),
            height: 60.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: Colors.blue),
                  height: 40.0,
                  width: 60.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Advance',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: Colors.blue),
                  height: 40.0,
                  width: 110.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Riemburstment',
                        style: TextStyle(
                            fontFamily: 'Comfortaa',
                            fontSize: 13.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),

               new GestureDetector(
                   onTap: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Booking()),
                     );
                   },
                child: Container(
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(11.0),
                       color: Colors.blue),
                   height: 40.0,
                   width: 60.0,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: <Widget>[
                       new GestureDetector(
                         onTap: () {
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context) => Booking()),
                           );
                         },
                         child: Text(
                           'Booking',
                           style: TextStyle(
                               fontFamily: 'Comfortaa',
                               fontSize: 13.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold),
                         ),
                       )
                     ],
                   ),
                 ),
               ),


                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11.0),
                      color: Colors.blue),
                  height: 40.0,
                  width: 65.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: new Icon(
                          Icons.settings,
                          size: 25.0,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Setting()),
                          );
                        },
                      ),
//                      Icon(
//                        Icons.menu,
//                        color: Colors.white,
//                        size: 15.0,
//                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        title: Text("Second Activity"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text("Booking Details")),
        body: new Container(
            //adding padding around card
            padding: new EdgeInsets.all(20.0),
            child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // new Text("Hey"),
                  // new Text("My name"),
                  // new Text("Is Vilas")
                  new MyCard(
                    title: new Text("VEACRHC18032301",
                        style: new TextStyle(fontSize: 20.0)),
                    icon: new Icon(Icons.favorite,
                        size: 40.0, color: Colors.redAccent),
                  ),
                  new MyCard(
                      title: new Text("VEACRHD17080301",
                          style: new TextStyle(fontSize: 20.0)),
                      icon: new Icon(Icons.donut_large,
                          size: 40.0, color: Colors.brown)),
                  new MyCard(
                      title: new Text("VEACRHD17082302",
                          style: new TextStyle(fontSize: 20.0)),
                      icon: new Icon(Icons.visibility,
                          size: 40.0, color: Colors.blue))
                ])));
  }
}

class MyCard extends StatelessWidget {
  //adding constructor
  MyCard({this.title, this.icon});
  final Widget title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return new Container(
        //adding bottom padding on card
        padding: new EdgeInsets.only(bottom: 20.0),
        child: new Card(
            child: new Container(
                //adding padding inside card
                padding: new EdgeInsets.all(15.0),
                child: new Column(children: <Widget>[
                  // new Text("I love Flutter"),
                  // new Icon(Icons.favorite)

                  this.title,
                  this.icon
                ]))));
  }
}
