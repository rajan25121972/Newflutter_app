import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AsynkTask/fetchdata.dart';
import 'package:flutter_app/Class/Expsubcategory_help.dart';

class Sub_Category_help extends StatefulWidget {
  static String tag = 'subcategory';

  @override
  _Sub_Category_help createState() => new _Sub_Category_help();
}

class _Sub_Category_help extends State<Sub_Category_help> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: new Text("SubCategory Help"),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),
        body: new Container(
            child: new RefreshIndicator(
                onRefresh: () => CallSubCategory("a"),
                child: new ListView(children: <Widget>[
                  new FutureBuilder<List<Exp_SubCategory_help>>(
                      future: CallSubCategory("a"),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Exp_SubCategory_help> Exp_SubCategory_help1 =
                              snapshot.data;
                          print(Exp_SubCategory_help1.length);


                          return new Column(
                              children: Exp_SubCategory_help1.map(
                                  (help) => new Column(
                                        children: <Widget>[
                                          Divider(height: 5.0),
                                  ListTile(
                                      title: Text(help.ExpSubCategoryDescr,
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.black,
                                        ),),

                                      subtitle: Text("",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          //color: Colors.deepOrangeAccent,
                                        ),
                                      ),
                                          onTap: () {

                                            print("selected"+help.ExpSubCategoryDescr);
                                            _sendDataBack(context,help.ExpSubCategoryDescr);
                                          }
                                  ),

                                         // new Text(help.ExpSubCategoryDescr),
                                        ],
                                      )).toList());
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return new Center(
                          child: new Column(
                            children: <Widget>[
                              new Padding(padding: new EdgeInsets.all(50.0)),
                              new CircularProgressIndicator(),
                            ],
                          ),
                        );

                      })
                ]))));
  }


  void _sendDataBack(BuildContext context,String subcategory) {
    String textToSendBack = "vilas";
    debugPrint("br :$subcategory");
    Navigator.pop(context, subcategory);
  }
}
