import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/AsynkTask/fetchdata.dart';
import 'package:flutter_app/Class/ExpenseData.dart';
import 'package:flutter_app/Class/MyJsonData.dart';
import 'package:flutter_app/Class/ScanFileData.dart';
import 'package:flutter_app/Class/dateValidator.dart';
import 'package:flutter_app/Class/userdata.dart';
import 'package:flutter_app/UnoPackage/ExpensesBooking.dart';
import 'package:flutter_app/UnoPackage/SubCategory_help.dart';
import 'package:flutter_app/main.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math' as math;

import 'package:http/http.dart' as http;

class BookingPage1 extends StatefulWidget {
  static String tag = 'Booking-page1';
  //static List<ExpenseData> expensesDataList = [];
  static List<ExpenseData> expensesDataList = new List<ExpenseData>();
  static List<ScanFileData> scanFileDataList = new List<ScanFileData>();
  static int passkey = 0;
  Future<List> quiz;

//
//  BookingPage1({this.expensesDataList}); //var myObject;
//  BookingPage1({this.expensesDataList}); //var myObject;

  @override
  _BookingPageState createState() => new _BookingPageState();
}

class _BookingPageState extends State<BookingPage1>
    with TickerProviderStateMixin {
  DateValidator datevalidator = new DateValidator();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();

  final TextEditingController __voucherDateController =
      new TextEditingController();
  final TextEditingController _StartDateController =
      new TextEditingController();
  final TextEditingController _EndDateController = new TextEditingController();

  final TextEditingController __ExpDescriptionController =
      new TextEditingController(text: "");

  String _voucherDate;
  String _StartDate;
  String _EndDate;
  DateTime selectedDate = DateTime.now();
  File _image;
  File scanfile;

  var _statdatediff = "";
  var _statdatediff1 ="";
  var _enddatediff ="";
  String todaydate1="";
  var todaydate = new DateTime.now();
  var formatter = new DateFormat('dd/MM/yyyy');
  var formatter1 = new DateFormat('yyyy-MM-dd');


  AnimationController _controller;
  static const List<IconData> icons = const [Icons.send, Icons.check];

  Future<Null> _selectDate(BuildContext context, String str1) async {

    todaydate1 = formatter.format(todaydate);

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        //  selectedDate = picked;
        // vouchertxt.text = "${selectedDate.toLocal()}";
        selectedDate = picked;
        var formatter = new DateFormat('dd/MM/yyyy');
        String formatted = formatter.format(selectedDate);
        print(formatted); // something like 2013-04-20
        switch (str1) {
          case "voucher_date":
            var now = new DateTime.now();

            String todaydate = formatter.format(now);
            __voucherDateController.text = todaydate;
            break;
          case "start_date":
            print("start date" + str1);
            _statdatediff1 = formatted;
            _StartDateController.text = "$formatted";

            break;
          case "end_date":
            _enddatediff =formatted;
            _EndDateController.text = "$formatted";
            break;
        }
      });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          //onPressed: () => Navigator.of(context).pop(),
          onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardRoute()),
              ),
        ),
        title: new Text("Booking Details",
            style: TextStyle(
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Form(
                  key: formKey,
                  child: new Column(children: <Widget>[
                    new Container(
                        width: 500.0,
                        padding: new EdgeInsets.fromLTRB(10.0, 3.0, 10.0, 10.0),
                        decoration:
                            new BoxDecoration(color: Colors.white, boxShadow: [
                          new BoxShadow(
                            color: Colors.black,
                            blurRadius: 10.0,
                          ),
                        ]),
                        child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              new Container(
                                padding: new EdgeInsets.fromLTRB(
                                    0.0, 0.0, 0.0, 10.0),
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 8, // 60%
                                    child: Container(
                                      //color: Colors.green,

                                      child: new TextFormField(
                                        controller: __voucherDateController,
                                        enabled: false,
                                        decoration: new InputDecoration(
                                          labelText: "Voucher Date",
                                        ),
                                        validator: (val) => val.isEmpty
                                            ? 'Value Cannot  Be Empty'
                                            : null,
                                        onSaved: (val) => _voucherDate = val,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2, // 20%
                                    child: Container(
                                      //color: Colors.blue,

                                      child: new IconButton(
                                        alignment: Alignment.topRight,
                                        icon: new Icon(
                                          Icons.date_range,
                                          color: Colors.blue,
                                        ),
//                                        onPressed: () => _selectDate(
//                                            context, "voucher_date"),
                                        onPressed: () =>
                                            ShowDateDialog(context, "hi"),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                        child: new TextFormField(
                                      controller: _StartDateController,
                                      enabled: false,
                                      decoration: new InputDecoration(
                                          labelText: "Start Date"),

                                      validator: (val) => val.length < 6
                                          ? 'Enter Valid Date'
                                          : null,
                                      onSaved: (val) => _StartDate = val,
                                    )),
                                  ),
                                  Expanded(flex: 2, child: Container()),
                                  Expanded(
                                      flex: 4,
                                      child: Container(
                                        child: new TextFormField(
                                          controller: _EndDateController,
                                          enabled: false,
                                          decoration: new InputDecoration(
                                              labelText: "End Date"),
                                          validator: (val) => val.length < 6
                                              ? 'Enter Valid Date'
                                              : null,
                                          onSaved: (val) => _EndDate = val,
                                        ),
                                      )),
                                ],
                              ),

                              SizedBox(
                                height: 15.0,
                              ),
                              new SizedBox(
                                width: double.infinity,
                                child: new RaisedButton(
                                  child: new Text(
                                    "Expense Details",
                                    style: new TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                  onPressed: () => _submit1(context),
                                  //onPressed: _submit1(context,""),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              new SizedBox(
                                width: double.infinity,
                                child: BookingPage1.expensesDataList.isEmpty
                                    ? Center(child: Text('List is Empty'))
                                    : new ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: BookingPage1
                                            .expensesDataList.length,
                                        itemBuilder: (context, index) =>
                                            this._buildRow(index)),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              new SizedBox(
                                width: double.infinity,
                                child: new RaisedButton(
                                  child: new Text(
                                    "Attachments",
                                    style: new TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.blue,
                                  onPressed: () {},
                                  //onPressed: _submit1(context,""),
                                ),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              new SizedBox(
                                width: double.infinity,
                                child: BookingPage1.scanFileDataList.isEmpty
                                    ? Center(child: Text('List is Empty'))
                                    : new ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: BookingPage1
                                            .scanFileDataList.length,
                                        itemBuilder: (context, index) =>
                                            this._buildRowAttachment(index)),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
//                              new SizedBox(
//                                  child: new Container(
//                                width: 125.0,
//                                height: 125.0,
//                                alignment: Alignment.center,
//                                child: _image == null
//                                    ? Text('No image selected.')
//                                    : Image.file(_image),
//                              )),
//                              SizedBox(
//                                height: 10.0,
//                              ),
//                              new SizedBox(
//                                width: double.infinity,
//                                child: new RaisedButton(
//                                  child: new Text(
//                                    "Send Data",
//                                    style: new TextStyle(color: Colors.white),
//                                  ),
//                                  color: Colors.blue,
//                                  //onPressed: () => _SendDataToServer(context),
//                                  onPressed: () => _showSucessDialog(context),
////                                  onPressed: () => _upload(
////                                      BookingPage1.scanFileDataList,
////                                      "TSAIBHO19030501",
////                                      "169227"),
//                                  //onPressed: _submit1(context,""),
//                                ),
//                              ),
                            ])),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.00),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.00),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          //
                          // Text("${selectedDate.toLocal()}"),
                        ],
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.00),
                    ),

//                        new floatingActionButton: FloatingActionButton(
//                        onPressed: _addItem,
//                        child: Icon(Icons.add),
//                      )
                  ]),
                )),
          ],
        ),
      ),
//      floatingActionButton: new Column(
//        mainAxisSize: MainAxisSize.min,
//        children: new List.generate(icons.length, (int index) {
//          Widget child = new Container(
//            height: 70.0,
//            width: 56.0,
//            alignment: FractionalOffset.topCenter,
//            child: new ScaleTransition(
//              scale: new CurvedAnimation(
//                parent: _controller,
//                curve: new Interval(0.0, 1.0 - index / icons.length / 2.0,
//                    curve: Curves.easeOut),
//              ),
//              child: new FloatingActionButton(
//                heroTag: null,
//                backgroundColor: Colors.blue,
//                tooltip: "Send",
//                mini: true,
//                child: new Icon(icons[index], color: Colors.white),
//                onPressed: () {
//                  print("you presssed" + index.toString());
//                },
//              ),
//            ),
//          );
//          return child;
//        }).toList()
//          ..add(
//            new FloatingActionButton(
//              heroTag: null,
//              child: new AnimatedBuilder(
//                animation: _controller,
//                builder: (BuildContext context, Widget child) {
//                  return new Transform(
//                    transform: new Matrix4.rotationZ(
//                        _controller.value * 0.5 * math.pi),
//                    alignment: FractionalOffset.center,
//                    child: new Icon(
//                        _controller.isDismissed ? Icons.subject : Icons.close),
//                  );
//                },
//              ),
//              onPressed: () {
//                if (_controller.isDismissed) {
//                  _controller.forward();
//                } else {
//                  _controller.reverse();
//                }
//              },
//            ),
//          ),
//      ),
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
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                color: Colors.blue,
                onPressed: () {
                  print("you click Send");
                  _showSucessDialog(context);
                },
                child: Text(
                  'Send ',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white),
                ),
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
                color: Colors.blue,
                onPressed: () {
                  print("you click Send Approval");
                },
                child: Text(
                  'Send Approval',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    __voucherDateController.dispose();
    _StartDateController.dispose();
    _EndDateController.dispose();
    super.dispose();
  }



  void _submit1(BuildContext context) async {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      form.save();

      //performLogin(context);
//      await Navigator.push(
//          context, MaterialPageRoute(builder: (context) => ExpenseBooking()));
//

      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ExpenseBooking(getpassedkey: null)));

      //print(widget.expensesDataList);
      print("click1");
      print(BookingPage1.expensesDataList.length);

      setState(() {
        print("date $_voucherDate");
        print("start $_StartDate");
        print("end $_EndDate");

        print(BookingPage1.expensesDataList.length);
        BookingPage1.expensesDataList;
        for (int i = 0; i < BookingPage1.expensesDataList.length; i++) {
          print(BookingPage1.expensesDataList[i].V_Remarks);
          ExpenseData expenseData = BookingPage1.expensesDataList[i];
          print(expenseData.V_Amount);
        }

        //_SendDataToServer(context);
      });
    } else {


      if (_StartDate.toString() == "") {
        _displaySnackbar("Enter Strat Date");
      }
     else if (_EndDate.toString() == "") {
       return _displaySnackbar("Enter End Date");
      }

    }
    print("click");

    //performLogin(context);

    // ExpenseDetailsAlertBox();
  }

  Future _SendDataToServer(BuildContext context) async {
//    Navigator.push(
//        context,
//        new MaterialPageRoute(
//            builder: (context) => MyJsonData(
//                userdata: callWebServiceForLofinUser1(
//                    _voucherDate, BookingPage1.expensesDataList))));

    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyJsonData(
                userdata: callWebServiceForLofinUser1(
                    _voucherDate, BookingPage1.expensesDataList))));
  }

  void performLogin(BuildContext context) {
    final snackbar = new SnackBar(
      content: new Text(
          "VoucherDate : $_voucherDate, StartDate : $_StartDate, EndDate : $_EndDate"),
    );
    //scaffoldKey.currentState.showSnackBar(snackbar);

    print("a" + _voucherDate + "" + _StartDate);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ExpenseBooking()));

//    Future.delayed(const Duration(milliseconds: 2000), () {
//      setState(() {
//        //Navigator.push(context, new MaterialPageRoute(builder: (context) => MyJsonData( userdata:  callWebServiceForLofinUser1(_voucherDate,_StartDate))));
//      //   Navigator.push(context, new MaterialPageRoute(builder: (context) =>  ExpenseBooking1()));
//
//         Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseBooking1()),
//         );
//      });
//    });
  }

//  ExpenseDetailsAlertBox() {
//    final screenSize = MediaQuery.of(context).size;
//    return showDialog(
//        context: context,
//        barrierDismissible: false,
//        builder: (BuildContext context) {
//          return AlertDialog(
//              shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
//              contentPadding: EdgeInsets.only(top: 10.0),
//              content: Container(
//                  width: double.infinity,
//                  child: ListView(
////                      mainAxisAlignment: MainAxisAlignment.start,
////                     crossAxisAlignment: CrossAxisAlignment.stretch,
////                      mainAxisSize: MainAxisSize.min,
//
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                        mainAxisSize: MainAxisSize.min,
//                        children: <Widget>[
//                          Text(
//                            "Expense Booking",
//                            style: TextStyle(fontSize: 18.0),
//                          ),
//                          Row(
//                            mainAxisSize: MainAxisSize.min,
//                            children: <Widget>[],
//                          ),
//                        ],
//                      ),
//                      SizedBox(
//                        height: 5.0,
//                      ),
//                      Divider(
//                        color: Colors.grey,
//                        height: 4.0,
//                      ),
//                      SingleChildScrollView(
//                        child: Stack(
//                          children: <Widget>[
//                            Padding(
//                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
////                          child: TextField(
////                            decoration: InputDecoration(
////                              hintText: "Add Review",
////                              border: InputBorder.none,
////                            ),
////                            maxLines: 8,
////                          ),
//
//                              child: new Form(
//                                child: new Column(
//                                  children: <Widget>[
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Start Date",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                            //color: Colors.blue,
//
//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: () {},
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "End Date",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                            //color: Colors.blue,
//
//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: () {},
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "No Of Days",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                              //color: Colors.blue,
//
////                                            child: new IconButton(
////                                              alignment: Alignment.topRight,
////                                              icon: new Icon(
////                                                Icons.date_range,
////                                                color: Colors.blue,
////                                              ),
////                                              onPressed: openAlertBox,
////                                              //  _selectDate(context, "voucher_date"),
////                                            ),
//                                              ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              controller:
//                                                  __ExpDescriptionController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Exp Description",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                            //color: Colors.blue,
//
//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.search,
//                                                color: Colors.blue,
//                                              ),
//
//                                              onPressed: () =>
//                                                  Exp_desc_help(context),
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Share",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                              //color: Colors.blue,
//
////                                            child: new IconButton(
////                                              alignment: Alignment.topRight,
////                                              icon: new Icon(
////                                                Icons.date_range,
////                                                color: Colors.blue,
////                                              ),
////                                              onPressed: openAlertBox,
////                                              //  _selectDate(context, "voucher_date"),
////                                            ),
//                                              ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Share With",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                            //color: Colors.blue,
//
//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.search,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: () {},
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Amount",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                              //color: Colors.blue,
//
////                                            child: new IconButton(
////                                              alignment: Alignment.topRight,
////                                              icon: new Icon(
////                                                Icons.date_range,
////                                                color: Colors.blue,
////                                              ),
////                                              onPressed: openAlertBox,
////                                              //  _selectDate(context, "voucher_date"),
////                                            ),
//                                              ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Remarks",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                              //color: Colors.blue,
//
////                                            child: new IconButton(
////                                              alignment: Alignment.topRight,
////                                              icon: new Icon(
////                                                Icons.date_range,
////                                                color: Colors.blue,
////                                              ),
////                                              onPressed: openAlertBox,
////                                              //  _selectDate(context, "voucher_date"),
////                                            ),
//                                              ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Exp Purpose",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                            //color: Colors.blue,
//
//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.search,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: () {},
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                    Row(
//                                      children: <Widget>[
//                                        Expanded(
//                                          flex: 8, // 60%
//                                          child: Container(
//                                            child: new TextFormField(
//                                              // controller: __voucherDateController,
//                                              decoration: new InputDecoration(
//                                                labelText: "Cost Center",
//                                              ),
//                                              validator: (val) => val.isEmpty
//                                                  ? 'Value Cannot  Be Empty'
//                                                  : null,
//                                              // onSaved: (val) => _voucherDate = val,
//                                            ),
//                                          ),
//                                        ),
//                                        Expanded(
//                                          flex: 2, // 20%
//                                          child: Container(
//                                            //color: Colors.blue,
//
//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.search,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: () {},
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
//                                          ),
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      ),
//                      SizedBox(
//                        height: 5.0,
//                      ),
//                      Divider(
//                        color: Colors.grey,
//                        height: 4.0,
//                      ),
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          new RaisedButton(
//                              color: Colors.blue,
//                              child: Text("Add",
//                                  style: new TextStyle(
//                                      fontSize: 18.0, color: Colors.white)),
//                              onPressed: () {},
//                              shape: new RoundedRectangleBorder(
//                                  borderRadius:
//                                      new BorderRadius.circular(30.0))),
//                          new RaisedButton(
//                              color: Colors.blue,
//                              child: new Text("Delete",
//                                  style: new TextStyle(
//                                      fontSize: 18.0, color: Colors.white)),
//                              onPressed: () {},
//                              shape: new RoundedRectangleBorder(
//                                  borderRadius:
//                                      new BorderRadius.circular(30.0))),
//                          new RaisedButton(
//                              color: Colors.blue,
//                              child: new Text("Cancel",
//                                  style: new TextStyle(
//                                      fontSize: 18.0, color: Colors.white)),
//                              onPressed: () {
//                                Navigator.of(context).pop();
//                                // Navigator.pop(context);
//                              },
//                              shape: new RoundedRectangleBorder(
//                                  borderRadius:
//                                      new BorderRadius.circular(30.0))),
//                        ],
//                      ),
//                    ],
//                  )));
//        });
//  }

  Exp_desc_help(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!
    final result = await Navigator.push(
      context,
      // We'll create the SelectionScreen in the next step!
      MaterialPageRoute(builder: (context) => Sub_Category_help()),
    );

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      if (__ExpDescriptionController.text != null) {
        __ExpDescriptionController.text = "$result";
        debugPrint("bro :$result");
      }
    });

    //    debugPrint("bro :$result");
//      Scaffold.of(context)
//        ..removeCurrentSnackBar()
//        ..showSnackBar(SnackBar(content: Text("$result")));
  }

  _buildRow(int index) {
    ExpenseData expenseData = BookingPage1.expensesDataList[index];
    print(expenseData.V_Remarks);
    //return Text("" + expenseData.V_ExpDescr);
    return Card(
        child: new Padding(
      padding:
          new EdgeInsets.only(left: 8.0, top: 0.0, right: 5.0, bottom: 0.0),
      child: new Row(
        children: [
          new Expanded(
              child: GestureDetector(
            onTap: () async {
              // print("you print "+expenseData.V_ExpDescr);
              BookingPage1.passkey = index;
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ExpenseBooking(getpassedkey: index)));
            },
            child: new Column(children: [
              new Text(
                expenseData.V_ExpDescr,
                textScaleFactor: 0.8,
                textAlign: TextAlign.left,
              ),
            ], crossAxisAlignment: CrossAxisAlignment.start),
          )),
          new Expanded(
              child: GestureDetector(
            onTap: () {
              print("you print amount");
            },
            child: new Text(
              expenseData.V_Amount.toString(),
              textScaleFactor: 0.8,
//            textAlign: TextAlign.center,
            ),
          )),
          new Expanded(
              child: new IconButton(
            alignment: Alignment.topRight,
            icon: new Icon(
              Icons.attachment,
              color: Colors.blue,
            ),
            onPressed: ImagePickerAlert,
          )),
        ],
      ),
    ));
  }

  _buildRowAttachment(int index) {
    // static List<ScanFileData> scanFileDataList = new List<ScanFileData>();

    BookingPage1.scanFileDataList[index].V_FileName;
    print(BookingPage1.scanFileDataList[index].V_FileName);

//    return Card(
//        child: new Padding(
//      padding:
//          new EdgeInsets.only(left: 8.0, top: 0.0, right: 5.0, bottom: 0.0),
//      child: new Row(children: [
//        new Expanded(
//            child: new Column(children: [
//          new Text(
//            BookingPage1.scanFileDataList[index].V_FileName,
//            textScaleFactor: 0.8,
//            textAlign: TextAlign.left,
//          ),
//        ], crossAxisAlignment: CrossAxisAlignment.start)),
//      ]),
//    ));

    return Dismissible(
      key: Key(BookingPage1.scanFileDataList[index].V_FileName),
      onDismissed: (direction) {
        setState(() {
          BookingPage1.scanFileDataList.removeAt(index);
        });
      },
      background: Container(color: Colors.red),
      child: Container(
        height: 40.0,
        decoration: BoxDecoration(border: Border.all(width: 0.5)),
        padding: EdgeInsets.all(5.0),
        child: Row(
          children: <Widget>[
            Text(
              BookingPage1.scanFileDataList[index].V_FileName,
              textScaleFactor: 0.8,
              style: TextStyle(
                fontSize: 12.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  Future getCamera(BuildContext context) async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      //_image = image;
      print(image.path);
      scanfile = File(image.path);

      String base64Image = base64Encode((scanfile.readAsBytesSync()));
      print(base64Image);
      String fileName = scanfile.path.split("/").last;

      ScanFileData scanFileData = new ScanFileData("ADD", 0, "", fileName,
          image.path, base64Image, "", "", "", "", "stfc10175");
      BookingPage1.scanFileDataList.add(scanFileData);
    });
  }

  Future getGalary(BuildContext context) async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      //_image = image;
      print(image.path);
      scanfile = File(image.path);

      String base64Image = base64Encode((scanfile.readAsBytesSync()));
      print(base64Image);
      String fileName = scanfile.path.split("/").last;

      ScanFileData scanFileData = new ScanFileData("ADD", 0, "", fileName,
          image.path, base64Image, "", "", "", "", "stfc10175");
      BookingPage1.scanFileDataList.add(scanFileData);
    });
  }

  ImagePickerAlert() {
    final screenSize = MediaQuery.of(context).size;
    return showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(child: Text('Attachments')),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: new IconButton(
                      alignment: Alignment.topRight,
                      icon: new Icon(
                        Icons.camera_alt,
                        color: Colors.blue,
                      ),
                      onPressed: () => getCamera(context),
                      //  _selectDate(context, "voucher_date"),
                    ),
                  ),
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
                      }),
                  FlatButton(
                      child: new IconButton(
                        alignment: Alignment.topRight,
                        icon: new Icon(
                          Icons.picture_as_pdf,
                          color: Colors.blue,
                        ),
                        onPressed: () {},
                        //  _selectDate(context, "voucher_date"),
                      ),
                      onPressed: () {})
                ]),
          );
        });
  }

  void _showSucessDialog(BuildContext context) async {
    // flutter defined function
    Future<UserData> userdata;
    print("capture data $scanfile");

//    var asyncResult2 = await MyJsonData(
//        userdata: callWebServiceForLofinUser1(
//            _voucherDate, BookingPage1.expensesDataList));

//    callWebServiceForLofinUser1(_voucherDate, BookingPage1.expensesDataList)
//        .then((p) => setState(() => print(""+userdata.toString())));

    print("m");

    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Result"),
          content: Center(
            child: FutureBuilder<UserData>(
              future: callWebServiceForLofinUser1(
                  "", BookingPage1.expensesDataList),
              builder: (context, snapshot) {
                print(snapshot);
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    // return Text(snapshot.data.password +
                    print("try again1");
                    return new Text('Retry again !');
                  case ConnectionState.waiting:
                    return new Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        child: new CircularProgressIndicator());
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      var Result = "";
                      var Message = "";
                      print(snapshot.data.result.toString());
                      if (snapshot.data.result.toString() == "Success") {
                        print("scan uploaded!");
                        Result = snapshot.data.result.toString();
                        Message = "Voucher : " +
                            snapshot.data.massage.toString() +
                            "Created !" "\n" +
                            "HdrFk :" +
                            snapshot.data.Hdr_fk.toString();

                        _upload(
                            BookingPage1.scanFileDataList,
                            snapshot.data.massage.toString(),
                            snapshot.data.Hdr_fk.toString());
                      } else if (snapshot.data.result.toString() == "1002") {
                        print("scan uploade  faild !");
                        Result = snapshot.data.result.toString();
                        Message = snapshot.data.massage.toString();
                      }
                      return Text("Result :$Result" + "\n" + "Msg : $Message");
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    //return CircularProgressIndicator();
                    // return Text("");
                    return CircularProgressIndicator();
                  default:
                    if (snapshot.hasError) {
                      print('Error: ${snapshot.error}');
                      return new Text('Error: ${snapshot.error}'); // ne
                    }
                }
//                if (snapshot.hasData) {
//                  return Text(
//                      snapshot.data.password + "\n" + snapshot.data.Hdr_fk);
//                } else {
//                  // return Text("${snapshot.error}");
//                  return CircularProgressIndicator();
//                }

                // return Text("");
              },
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog

            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future _upload(List<ScanFileData> ScanFileListData, String VoucherId,
      String HdrFkId) async {
    var base64Image = "";
    //File scanFile;
    String FilePath = "";
    String fileName = "";
    if (ScanFileListData == null) return;

    for (int i = 0; i < ScanFileListData.length; i++) {
      ScanFileData scanFileData = ScanFileListData[i];
      print(scanFileData.V_FilePath);
      print(scanFileData.V_FileName);
      base64Image = scanFileData.V_FileType.toString();
      fileName = scanFileData.V_FileName.toString();
      print(scanFileData.V_FileType);
      FilePath = scanFileData.V_FilePath;
      print("length" + File(scanFileData.V_FilePath).lengthSync().toString());

      // String base64Image = base64Encode((imageFile.readAsBytesSync()));
      // print(base64Image);
      // print(imageFile.path);
      //  String fileName = imageFile.path.split("/").last;

      //print(fileName);
      print(VoucherId);
      print(HdrFkId);
      //print("length:" + imageFile.lengthSync().toString());
      //var url = Uri.parse("http://10.0.1.112/JsonResultDemo/Home/uploadfile?");
      // var url = "http://115.113.27.9/JsonResultDemo/Home/uploadfile?";
      // var url = "http://10.0.1.112/JsonResultDemo/Home/uploadfile?";
      var url = "http://115.113.27.9/JsonResultDemo/Home/uploadfile?";

      var paramsJSONString1 = jsonEncode({
        "image": base64Image,
        "filename": fileName,
        "filepath": FilePath,
        "VocucherId": VoucherId,
        "VoucherPkId": HdrFkId,
        "vouchertype": 'TS',
        "UserId": "stf10175"
      });

      final paramDic = {
        "P_EncryptedData": paramsJSONString1,
      };

//    http.Response response = await http.post(
//      url, // change with your API
//      //headers:requestHeaders,
//      body: paramDic,
//    );

      await http.post(url, body: paramDic).then((res) {
        print(res.statusCode);
        if (res.statusCode == 200) {
          print(res.body);
          print("Image Uploaded");
        } else {
          print("Upload Failed");
        }
      }).catchError((err) {
        print(err);
      });
    }
  }

  ShowDateDialog(context, review) {
    return showDialog(

        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {

          return Dialog(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
          child: new SingleChildScrollView(
       //
              child: Container(
                height: 450.0,
                width: 200.0,
                child: new GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Column(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(height: 40.0),
                            Container(
                              height: 40.0,
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
                                flex: 8, // 60%
                                child: Container(
                                  //color: Colors.green,

                                  child: new TextFormField(
                                    controller: __voucherDateController,
                                    enabled: false,
                                    decoration: new InputDecoration(
                                      labelText: "Voucher Date",
                                    ),
                                    validator: (val) => val.isEmpty
                                        ? 'Value Cannot  Be Empty'
                                        : null,
                                    onSaved: (val) => _voucherDate = val,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2, // 20%
                                child: Container(
                                  //color: Colors.blue,

                                  child: new IconButton(
                                    alignment: Alignment.topRight,
                                    icon: new Icon(
                                      Icons.date_range,
                                      color: Colors.blue,
                                    ),
                                    onPressed: () =>
                                        _selectDate(context, "voucher_date"),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 8,
                                child: Container(
                                    child: new TextFormField(
                                      enableInteractiveSelection: false,
                                      controller: _StartDateController,
                                      decoration: new InputDecoration(
                                          labelText: "Start Date"),
                                      autovalidate: true,
                                      validator: (val) => validateDateFormat(val,"start_date"),
                                      onSaved: (val) => _StartDate = val,
                                    )),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: new IconButton(
                                      alignment: Alignment.topRight,
                                      icon: new Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () =>
                                          _selectDate(context, "start_date"),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 8,
                                  child: Container(
                                    child: new TextFormField(
                                      controller: _EndDateController,
                                      decoration: new InputDecoration(
                                          labelText: "End Date"),
                                      autovalidate: true,
                                      validator: (val) => validateDateFormat(val,"end_date"),
                                      onSaved: (val) => _EndDate = val,
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    child: new IconButton(
                                      alignment: Alignment.topRight,
                                      icon: new Icon(
                                        Icons.date_range,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () =>
                                          _selectDate(context, "end_date"),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.0),
                        FlatButton(
                            child: Center(
                              child: Text(
                                'OKAY',
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 14.0,
                                    color: Colors.blue),
                              ),
                            ),


                            onPressed: () =>
                                ShowValidation(context),

                            color: Colors.transparent)
                      ],
                    )),
              )
          ),
       );
        });
  }

//  void createSnackBar(String message) {
//    final snackBar = new SnackBar(content: new Text(message),
//        backgroundColor: Colors.red);
//
//    // Find the Scaffold in the Widget tree and use it to show a SnackBar!
//    //Scaffold.of(scaffoldKey).showSnackBar(snackBar);
//  }

  void _displaySnackbar(String validatevalue) {
    scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 5),
        content: Text(
          validatevalue,
        ),
        backgroundColor: Colors.red));
  }

  String validateDateFormat(String value,String inputtype) {

    switch (inputtype) {
      case "voucher_date":
      // __ExpVoucherStartdate.text = "${selectedDate.toLocal()}";
      // String todaydate1 = formatter.format(todaydate);
        break;
      case "start_date":
        print("start date" + value);

        if (value.length == 0)
          return 'Enter Start Date';

        else if (datevalidator.IscompareDate(todaydate1, _statdatediff1, 'Date', 'yyyymm') == 1) {
          // txtStartDate.setError("StartDate is greater than CurrentDate...");
          //   txtStartDate.requestFocus();
          print("StartDate is greater than CurrentDate...");
          return"StartDate is greater than CurrentDate...";

        }

        break;
      case "end_date":


        if (datevalidator.IscompareDate(_statdatediff1, _enddatediff, "Date", "yyyymm") == -1) {
          print("EndDate is less Than StartDate...");
          return"EndDate is less Than StartDate...";
          // txtEndDate.requestFocus();
        } else if (datevalidator.IscompareDate(
            todaydate1, _enddatediff,
            "Date",
            "yyyymm") ==
            1) {
          print("EndDate is greater Than CurrentDate...");
          return "EndDate is greater Than CurrentDate...";
          // txtEndDate.requestFocus();
        }




        break;
    }



  }


  ShowValidation(BuildContext context)
  {
    if (_voucherDate.toString() == "" ) {
      // _displaySnackbar("Enter Strat Date");
    }
    else if (_StartDate.toString() == "") {
      // _displaySnackbar("Enter Strat Date");
    }
    else if (_EndDate.toString() == "") {
      // _displaySnackbar("Enter End Date");
    }

        Navigator.of(context).pop();



  }

}
