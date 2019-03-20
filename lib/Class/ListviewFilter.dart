import 'dart:async';
import 'dart:convert';
import 'package:flutter_app/AsynkTask/fetchdata.dart';
import 'package:flutter_app/Class/Expsubcategory_help.dart';
import 'package:flutter_app/Class/userDetails.dart';
import 'package:flutter_app/UnoPackage/ExpensesBooking.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SubCategory_HelpFilter extends StatefulWidget {
  var helptype, ParamStr4, ParamStr1, ParamStr2, FltrColumn, ParamStr3,Helpname;

  SubCategory_HelpFilter(
      {Key key,
      this.helptype,
      this.ParamStr4,
      this.ParamStr1,
      this.ParamStr2,
      this.FltrColumn,
      this.ParamStr3,
      this.Helpname})
      : super(key: key);

  @override
  _SubCategory_HelpFilterState createState() =>
      new _SubCategory_HelpFilterState();
}

class _SubCategory_HelpFilterState extends State<SubCategory_HelpFilter> {
  bool _dataavailble = false;
  var _helptype = "";
  var _ParamStr1 = "";
  var _ParamStr2 = "";
  var _FltrColumn = "";
  var _ParamStr3 = "";
  var _ParamStr4 = "";
  var helpdisplaydata = "";
  var helpSearchdisplaydata = "";
  var P_HelpXmlData_encoded = "";
  var _Helpname = "";
  List<Exp_SubCategory_help> Exp_SubCategory_helpSearch = [];
  List<Exp_SubCategory_help> Exp_SubCategory_help1 = [];
  TextEditingController controller = new TextEditingController();

  Future<List<Exp_SubCategory_help>> CallSubCategory1(String HelpType) async {
    print("helptype" + HelpType);

    var P_SubCategoryXmlData = "";
    var P_EXP_CityXmlData = "";
    var P_ExpPurposeXmlData = "";

    print('data loading ...');
    setState(() {
      _dataavailble = true;
    });

    switch (HelpType) {
      case "EXP_TrvSubcategory":
      case "EXP_City":
      case "EXP_ExpPurpose":
      case "EXP_CostCenter":
      case "EXP_SharingWith":
      case "EXP_Carrier":
      case "EXP_ExpTrvMode":

        P_EXP_CityXmlData = "<Dataset><Table><pValue>%</pValue><ParamStr1>" +
            _ParamStr1 +
            "</ParamStr1><ParamStr2>" +
            _ParamStr2 +
            "</ParamStr2><ParamStr3>" +
            _ParamStr3 +
            "</ParamStr3><FltrColumn>" +
            _FltrColumn +
            "</FltrColumn><pgno>0</pgno><p_RecPerPage>100000</p_RecPerPage><ParamStr4>" +
            _ParamStr4 +
            "</ParamStr4><ParamStr5></ParamStr5><ParamStr6></ParamStr6></Table></Dataset>";
        print("CityData" + P_EXP_CityXmlData.toString());
        P_HelpXmlData_encoded = base64.encode(utf8.encode(P_EXP_CityXmlData));
        break;

        P_ExpPurposeXmlData = "<Dataset><Table><pValue>%</pValue><ParamStr1>" +
            _ParamStr1 +
            "</ParamStr1><ParamStr2>" +
            _ParamStr2 +
            "</ParamStr2><ParamStr3>0</ParamStr3><FltrColumn>" +
            _FltrColumn +
            "</FltrColumn><pgno>0</pgno><p_RecPerPage>100000</p_RecPerPage><ParamStr4>" +
            _ParamStr4 +
            "</ParamStr4><ParamStr5></ParamStr5><ParamStr6></ParamStr6></Table></Dataset>";
        print("expPurpose" + P_ExpPurposeXmlData.toString());
        P_HelpXmlData_encoded = base64.encode(utf8.encode(P_ExpPurposeXmlData));
        break;
    }

    var paramsJSONString1 = jsonEncode(
        {"P_ColumnName": HelpType, "P_strXML": P_HelpXmlData_encoded});

    String paramName = 'P_EncryptedData'; // give the post param a name
    String formBody = paramName + '=' + paramsJSONString1;

    print('data5: $formBody');

    //var url ="http://10.0.1.112/MobileServiceLiveUat_Encrypt/MBService.asmx/MB_EmpExpBooking?";

    //var url ="http://10.0.1.112/JsonResultDemo/Home/MB_HelpMaster22?";
    var url = "http://115.113.27.9/JsonResultDemo/Home/MB_HelpMaster22?";

    final paramDic = {
      "P_EncryptedData": paramsJSONString1,
    };

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': 'application/json',
    };

    http.Response response = await http.post(
      url, // change with your API
      //headers:requestHeaders,
      body: paramDic,
    );

    print("D");
    print(response.body);
    print(response.statusCode);

    print('submitting to backend...');
//    new Future.delayed(new Duration(seconds: 4), () {
//      setState(() {
//        _saving = false;
//      });
//    });
    setState(() {
      _dataavailble = false;
    });

    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      var result1="";
      var msg="";
      var msg1 ="";
      setState(() {

                 for (Map helpdata in responseJson['Table0'] as List) {
                   switch (HelpType) {
                     case "EXP_TrvSubcategory":
                       Exp_SubCategory_help category_help = new Exp_SubCategory_help(
                           SubCategory: helpdata['COL0'].toString(),
                           ExpSubCategoryDescr: helpdata['COL1'].toString(),
                           hdnLocationClassificationAppl:
                           helpdata['HDNLOCATIONCLASSIFICATIONAPPL'].toString());

                       Exp_SubCategory_help1.add(category_help);
                       break;
                     case "EXP_City":
                     case "EXP_ExpPurpose":
                     case "EXP_SharingWith":
                     case "EXP_ExpTrvMode":
                       Exp_SubCategory_help category_help = new Exp_SubCategory_help(
                         SubCategory: helpdata['COL0'].toString(),
                         ExpSubCategoryDescr: helpdata['COL1'].toString(),
                       );

                       Exp_SubCategory_help1.add(category_help);

                       break;
                     case "EXP_CostCenter":
                       Exp_SubCategory_help category_help = new Exp_SubCategory_help(
                           SubCategory: helpdata['COL0'].toString(),
                           ExpSubCategoryDescr: helpdata['COL1'].toString(),
                           hdnLocationClassificationAppl: helpdata['COL2'].toString(),
                           hdnTravelmodeApp: helpdata['COL3'].toString());

                       Exp_SubCategory_help1.add(category_help);
                       break;

                     case "EXP_Carrier":
                       Exp_SubCategory_help category_help = new Exp_SubCategory_help(
                         SubCategory: helpdata['COL1'].toString(),
                         ExpSubCategoryDescr: helpdata['HDNCODE'].toString(),
                       );

                       Exp_SubCategory_help1.add(category_help);
                       break;
                   }

                   // _userDetails.add(Exp_SubCategory_help.fromJson(user));
                 }






      });

//      return (responseJson['Table0'] as List)
//          .map((p) => Exp_SubCategory_help.fromJson(p))
//          .toList();

    } else if (response.statusCode == 502) {
     // var responseJson = json.decode(response.body);
      //return (responseJson);
      return  ShowFilterDialog(context,"Error 502 Unable to load help category");
      throw Exception('Connection timed out');
    }
   else if(response.statusCode == 500){
      //throw Exception('Failed to load SubCategory');
      return  ShowFilterDialog(context,"Error 505 Unable to load  help category");
    }
    else if (response.statusCode == 404) {
      // var responseJson = json.decode(response.body);
      //return (responseJson);
      return  ShowFilterDialog(context,"Error 404 Unable to load help category");
      throw Exception('Connection timed out');
    }
  }

  @override
  void initState() {
    super.initState();

    //getUserDetails();

    setState(() {
      _helptype = widget.helptype;
      _ParamStr4 = widget.ParamStr4;
      _ParamStr1 = widget.ParamStr1;
      _ParamStr2 = widget.ParamStr2;
      _FltrColumn = widget.FltrColumn;
      _ParamStr3 = widget.ParamStr3;
      _Helpname = widget.Helpname;
      print("param4" + _ParamStr4);
      print("param1" + _ParamStr1);
      print("param2" + _ParamStr2);
      print("FltrColumn" + _FltrColumn);
      print("_ParamStr3" + _ParamStr3);
      CallSubCategory1(_helptype);
      print(Exp_SubCategory_help1.length);
    });
  }

  Widget _buildUsersList() {
    print(Exp_SubCategory_help1.length);

    if (_dataavailble) {
      return new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      return new ListView.separated(
        separatorBuilder: (context, index) => Divider(
              color: Colors.black12,
            ),
        itemCount: Exp_SubCategory_help1.length,
        itemBuilder: (context, index) {
          return new Card(
            child: Exp_SubCategory_help1.isEmpty
                ? new ListTile(
//            leading: new CircleAvatar(
//              backgroundImage: new NetworkImage(
//                _searchResult[i].profileUrl,
//              ),
//            ),
                    title: new Text("No Search Found" + ' '),
                  )
                : new ListTile(
//            leading: new CircleAvatar(
//              backgroundImage: new NetworkImage(
//                _userDetails[index].profileUrl,
//              ),
//            ),

                    title: new Text(Exp_SubCategory_help1[index].SubCategory +
                        '-' +
                        Exp_SubCategory_help1[index].ExpSubCategoryDescr),
                    onTap: () {
                      print("selected" +
                          Exp_SubCategory_help1[index].ExpSubCategoryDescr);
                      _sendDataBack(
                          context,
                          Exp_SubCategory_help1[index].SubCategory,
                          Exp_SubCategory_help1[index].ExpSubCategoryDescr,
                          Exp_SubCategory_help1[index]
                              .hdnLocationClassificationAppl);
                    }),
            margin: const EdgeInsets.all(0.0),
          );
        },
      );
    }
  }

  Widget _buildSearchResults() {
    return new ListView.separated(
      separatorBuilder: (context, index) => Divider(
            color: Colors.black12,
          ),
      itemCount: Exp_SubCategory_helpSearch.length,
      itemBuilder: (context, i) {
        return new Card(
          child: Exp_SubCategory_helpSearch.length == 0
              ? new ListTile(
                  title: new Text("No Search Found" + ' '),
                )
              : new ListTile(
//            leading: new CircleAvatar(
//              backgroundImage: new NetworkImage(
//                _searchResult[i].profileUrl,
//              ),
//            ),
                  title: new Text(Exp_SubCategory_helpSearch[i].SubCategory +
                      '- ' +
                      Exp_SubCategory_helpSearch[i].ExpSubCategoryDescr),
                  onTap: () {
                    print("selected" +
                        Exp_SubCategory_helpSearch[i].ExpSubCategoryDescr);
                    _sendDataBack(
                        context,
                        Exp_SubCategory_helpSearch[i].SubCategory,
                        Exp_SubCategory_helpSearch[i].ExpSubCategoryDescr,
                        Exp_SubCategory_helpSearch[i]
                            .hdnLocationClassificationAppl);
                  }),
          margin: const EdgeInsets.all(0.0),
        );
      },
    );
  }

  Widget _buildSearchBox() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        child: new ListTile(
          leading: new Icon(Icons.search),
          title: new TextField(
            controller: controller,
            decoration: new InputDecoration(
                hintText: 'Search', border: InputBorder.none),
            onChanged: onSearchTextChanged,
          ),
          trailing: new IconButton(
            icon: new Icon(Icons.cancel),
            onPressed: () {
              controller.clear();
              onSearchTextChanged('');
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return new Column(
      children: <Widget>[
        new Container(
            color: Theme.of(context).primaryColor, child: _buildSearchBox()),
        new Expanded(
            child: Exp_SubCategory_helpSearch.length != 0 ||
                    controller.text.isNotEmpty
                ? _buildSearchResults()
                : _buildUsersList()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Enter '+_Helpname),
        elevation: 0.0,
      ),
      body: _buildBody(),
      resizeToAvoidBottomPadding: true,
    );
  }

  onSearchTextChanged(String text) async {
    Exp_SubCategory_helpSearch.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    Exp_SubCategory_help1.forEach((Exp_SubCategory_help) {
      if (Exp_SubCategory_help.SubCategory.toLowerCase().contains(text) ||
          Exp_SubCategory_help.SubCategory.toUpperCase().contains(text) ||
          Exp_SubCategory_help.ExpSubCategoryDescr.toLowerCase()
              .contains(text) ||
          Exp_SubCategory_help.ExpSubCategoryDescr.toUpperCase().contains(text))
        Exp_SubCategory_helpSearch.add(Exp_SubCategory_help);
      print(text);
    });

    setState(() {});
  }

  void _sendDataBack(BuildContext context, String subcategory,
      String subcategoryDesc, String hdnLocationClassification) {
    String textToSendBack = "vilas";
    debugPrint("br :$subcategory");
    debugPrint("br :$subcategoryDesc");
    debugPrint("br :$hdnLocationClassification");
    Navigator.pop(
        context, [subcategory, subcategoryDesc, hdnLocationClassification]);
  }


  ShowFilterDialog(context, review) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                height: 200.0,
                width: 200.0,
                child: new GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(height: 50.0),
                            Container(
                              height: 50.0,
                              decoration: BoxDecoration(color: Colors.blue),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),

                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Container(
                                    child: new Text(review,
                                        style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                                     ),
                              ),

                            ],
                          ),
                        ),

                        SizedBox(height: 25.0),
                        FlatButton(

                              child: Text(
                                'OKAY',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    color: Colors.blue),
                              ),



                            onPressed: ()  {
                              Navigator.of(context).pop();


                            },


                            color: Colors.transparent)
                      ],
                    )),
              ));
        });
  }
}
