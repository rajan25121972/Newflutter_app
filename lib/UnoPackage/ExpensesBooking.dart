import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Class/BoookingStatefullWidget.dart';
import 'package:flutter_app/Class/BoookingStatefullWidget.dart';
import 'package:flutter_app/Class/ExpenseData.dart';
import 'package:flutter_app/Class/ListviewFilter.dart';
import 'package:flutter_app/Class/dateValidator.dart';
import 'package:flutter_app/UnoPackage/SubCategory_help.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

//class ExpenseBooking1 extends StatelessWidget {
//  ExpenseBooking1({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: 'Expense Booking Details',
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      //home: BookingPage(),
//      home: ExpenseBooking(),
//    );
//  }
//}

class ExpenseBooking extends StatefulWidget {
  static String tag = 'ExpenseBooking';

  final int getpassedkey;


  const ExpenseBooking({Key key, this.getpassedkey}) : super(key: key);

  @override
  _ExpenseBookingState createState() => new _ExpenseBookingState();
}

class _ExpenseBookingState extends State<ExpenseBooking> {
  DateValidator datevalidator = new DateValidator();

  final expense_booking_scaffoldKey = new GlobalKey<ScaffoldState>();
  final expense_booking_formKey = new GlobalKey<FormState>();

  final TextEditingController __ExpVoucherStartdateController =
      new TextEditingController(text: "");
  final TextEditingController __ExpVoucherEnddateController =
      new TextEditingController(text: "");
  final TextEditingController __ExpNoofDaysController =
      new TextEditingController(text: "");
  final TextEditingController __ExpDescriptionController =
      new TextEditingController(text: "");
  final TextEditingController __ExpFromLocationController =
      new TextEditingController(text: "Mumbai");
  final TextEditingController __ExpTravelModeController =
      new TextEditingController(text: "Auto");
  final TextEditingController __ExpTravelTypeController =
      new TextEditingController(text: "Domestic");
  final TextEditingController __ExpCarrierController =
      new TextEditingController(text: "Carrier");
  final TextEditingController __ExpFlightTrainNoController =
      new TextEditingController(text: "101");
  final TextEditingController __ExpToLocationController =
      new TextEditingController(text: "Thane");

  final TextEditingController __ExpLimintAmtController =
      new TextEditingController(text: "");
  final TextEditingController __ExpShareController =
      new TextEditingController(text: "NO");
  final TextEditingController __ExpShareWithController =
      new TextEditingController(text: "10017");
  final TextEditingController __ExpAmountController =
      new TextEditingController(text: "");
  final TextEditingController __ExpRemarksController =
      new TextEditingController(text: "");
  final TextEditingController __ExpPurposeController =
      new TextEditingController(text: "");
  final TextEditingController __ExpCostCenterController =
      new TextEditingController(text: "");

  final FocusNode _ExpVoucherStartdateFocus = FocusNode();
  final FocusNode _ExpVoucherEnddateFocus = FocusNode();
  final FocusNode _ExpNoofDaysFocus = FocusNode();
  final FocusNode _ExpDescriptionControllerFocus = FocusNode();

  int _counter = 0;
  String _ExpStartDate = "";
  String _ExpEndDate = "";
  String _ExpNoOfDays = "";
  String _ExpSubCategory = "";
  String _ExpDescription = "";
  String _ExpShare = "";
  String _ExpShareWith = "";
  String _ExplimitAmt = "";
  String _ExpFromLocation = "";
  String _ExpToLocation = "";
  String _ExpTravelMode = "";
  String _ExpTravelType = "";
  String _ExpCarrier = "";
  String _ExpFlightTrainNo = "";
  String _ExpAmount = "";
  String _ExpRemarks = "";
  String _ExpPurpose = "";
  String _ExpCostCenter = "";

  String _ExpPurpose_desc = "";
  String _FromCity = "";
  String _TravelMode = "";
  String _TravelType = "";
  String _Carrier = "";
  String _FlightTrainNo = "";
  String _LocationClassificationAppl = "";
  String _TrvModeApp = "";
  String _LimitApp = "";
  String _LimiRes = "";
  String _TrvModeSequence = "";
  String _hdnConveyance = "";
  String _hdnActualLimAmt = "";
  String _hdnScanAttach = "";
  String _hdnMobDoc = "";
  String _PolicyApp = "";
  String _CarrieCode = "";
  String _UnsettleADvFlg = "";
  String _LodgingAlert = "";
  String _ShareAppl = "";
  String _ProductCode = "";
  String _CarrierTrvTyp = "";

  DateTime selectedDate = DateTime.now();
  int getpassedindex = null;
  var getpassedindexstr = "";
  var hdnLocationClassificationAppl = "";
  var subcategoryvalue = "";
  var _dropdownValue = 'NO';
  int _radioValue1 = -1;
  int _TravelTyperadioValue = -1;
  List<ExpenseData> _expensesDataList = BookingPage1.expensesDataList;

  //show hide widget
  bool isExpenseCarrier = true;
  bool isShare_widget = false;
  bool isShareWith_widget = false;
  bool isTravelMode_widget = true;
  bool isTravelType_widget = true;
  bool isTo_Location_widget = true;
  bool isFrom_Location_widget = true;
  bool isExpenseCarrier_wdget = true;
  bool isLimitAmount_widget = true;
  bool isFlightTrainNo_widget = true;



  final AsyncMemoizer _memoizer = AsyncMemoizer();
  final AsyncMemoizer _memoizer1 = AsyncMemoizer();
  final AsyncMemoizer _memoizer2 = AsyncMemoizer();
  final AsyncMemoizer _memoizer3 = AsyncMemoizer();

  //List<ExpenseData> _expensesDataList = [];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    setState(() {
      getpassedindex = widget.getpassedkey;
      if (getpassedindex == null) {
      } else {
        if (getpassedindexstr == getpassedindex.toString()) {
          print('alredy got key');
        } else {
          print('no need for key');
          EditExpenseData(getpassedindex);
          getpassedindexstr = getpassedindex.toString();
        }
      }

      print("you passed key " + widget.getpassedkey.toString());
    });

    final Exp_start_date_widget = Expanded(
      flex: 8, // 60%
      child: Container(
        child: new TextFormField(
          controller: __ExpVoucherStartdateController,
          decoration: new InputDecoration(
            labelText: "Start Date",
            fillColor: Colors.white,
          ),

          textInputAction: TextInputAction.next,
          autovalidate: true,

          validator: (val) => validateDateFormat(val,"start_date"),
          onSaved: (val) => _ExpStartDate = val,
          focusNode: _ExpVoucherStartdateFocus,
          onFieldSubmitted: (term) {

            FocusScope.of(context).requestFocus(_ExpVoucherEnddateFocus);
          },
        ),
      ),
    );

    final Exp_start_datepicker_widget = Expanded(
      flex: 2, // 20%
      child: Container(
        //color: Colors.blue,

        child: new IconButton(
          alignment: Alignment.topRight,
          icon: new Icon(
            Icons.date_range,
            color: Colors.blue,
          ),
          onPressed: () => _selectDate(context, "start_date"),
        ),
      ),
    );

    final Exp_VoucherEndDate_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpVoucherEnddateController,
              autovalidate: true,
              decoration: new InputDecoration(
                labelText: "End Date",
              ),

              keyboardAppearance: Brightness.light,
              validator: (val) => validateDateFormat(val,"end_date"),
              onSaved: (val) => _ExpEndDate = val,
              focusNode: _ExpVoucherEnddateFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_ExpNoofDaysFocus);
              },
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
              onPressed: () => _selectDate(context, "end_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_TotalNodays_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpNoofDaysController,
              decoration: new InputDecoration(
                labelText: "No Of Days",
              ),
              keyboardType: TextInputType.datetime,

              enabled: false,
              validator: (val) => val.isEmpty ? 'Value Cannot  Be Empty' : null,
              onSaved: (val) => _ExpNoOfDays = val,
              focusNode: _ExpNoofDaysFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context)
                    .requestFocus(_ExpDescriptionControllerFocus);
              },
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,

//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: openAlertBox,
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
              ),
        ),
      ],
    );

    final Exp_Description_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpDescriptionController,
              decoration: new InputDecoration(
                labelText: "Exp Description",
              ),

              validator: (val) => validateDateFormat(val,"EXP_TrvSubcategory"),

              onSaved: (val) => _ExpDescription = val,
              focusNode: _ExpDescriptionControllerFocus,
              onFieldSubmitted: (value) {

                _ExpDescriptionControllerFocus.unfocus();
              },
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
                Icons.search,
                color: Colors.blue,
              ),

              onPressed: () => Exp_desc_help(context, "EXP_TrvSubcategory"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_From_Location_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpFromLocationController,
              decoration: new InputDecoration(
                labelText: "From Location",
              ),

              validator: (val) => validateDateFormat(val,"From_Location"),
              onSaved: (val) => _ExpFromLocation = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_FromCity"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_To_Location_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpToLocationController,
              decoration: new InputDecoration(
                labelText: "To Location",
              ),

              validator: (val) => validateDateFormat(val,"To_Location"),
              onSaved: (val) => _ExpToLocation = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_City"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_Carrier_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpCarrierController,
              decoration: new InputDecoration(
                labelText: "Carrier",
              ),

              validator: (val) => validateDateFormat(val,"Carrier"),
              onSaved: (val) => _ExpCarrier = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_Carrier"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_FlightTrainNo_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpFlightTrainNoController,
              decoration: new InputDecoration(
                labelText: "Flight / Train No .",
              ),

              validator: (val) => validateDateFormat(val,"Flight"),
              onSaved: (val) => _ExpFlightTrainNo = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,
//            child: new IconButton(
//              alignment: Alignment.topRight,
//              icon: new Icon(
//                Icons.search,
//                color: Colors.blue,
//              ),
//              onPressed: () => Exp_desc_help(context, "EXP_Carrier"),
//              //  _selectDate(context, "voucher_date"),
//            ),
              ),
        ),
      ],
    );

    final Exp_TravelMode_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpTravelModeController,
              decoration: new InputDecoration(
                labelText: "Travel Mode",
              ),

              validator: (val) => validateDateFormat(val,"Travel_Mode"),
              onSaved: (val) => _ExpTravelMode = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_ExpTrvMode"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_TravelType_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpTravelTypeController,
              decoration: new InputDecoration(
                labelText: "Travel Type",
              ),

              validator: (val) => validateDateFormat(val,"Travel_Type"),
              onSaved: (val) => _ExpTravelType = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,
//            child: new IconButton(
//              alignment: Alignment.topRight,
//              icon: new Icon(
//                Icons.search,
//                color: Colors.blue,
//              ),
//              onPressed: () {},
//              //  _selectDate(context, "voucher_date"),
//            ),
              ),
        ),
      ],
    );

    void _handleTravelTypeRadioValueChange(int value) {
      setState(() {
        _TravelTyperadioValue = value;
        switch (_TravelTyperadioValue) {
          case 0:
            print("Domestic");
            _TravelType = "Domestic";
            break;
          case 1:
            print("International");
            _TravelType = "International";
            break;
        }
      });
    }

    final Exp_TravelTypeRadioButton = Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 2, // 60%
          child: Container(
              child: new Text("Type", style: new TextStyle(fontSize: 13.0))),
        ),
        Expanded(
          flex: 1, // 60%
          child: Container(
            child: new Radio(
              value: 0,
              activeColor: Colors.blue,
              groupValue: _TravelTyperadioValue,
              onChanged: _handleTravelTypeRadioValueChange,
            ),
          ),
        ),
        Expanded(
          flex: 3, // 60%
          child: Container(
            child: new Text(
              'Domestic',
              style: new TextStyle(fontSize: 13.0),
            ),
          ),
        ),
        Expanded(
          flex: 1, // 60%
          child: Container(
            child: new Radio(
              value: 1,
              activeColor: Colors.blue,
              groupValue: _TravelTyperadioValue,
              onChanged: _handleTravelTypeRadioValueChange,
            ),
          ),
        ),
        Expanded(
          flex: 3, // 60%
          child: Container(
            child: new Text(
              'International',
              style: new TextStyle(fontSize: 13.0),
            ),
          ),
        ),
        Expanded(
          flex: 1, // 60%
          child: Container(
            child: new Text(
              '',
              style: new TextStyle(fontSize: 13.0),
            ),
          ),
        ),
      ],
//
    );

    final Exp_TravelTypeRadioButton1 = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Radio(
          value: 1,
          activeColor: Colors.blue,
          groupValue: _TravelTyperadioValue,
          onChanged: _handleTravelTypeRadioValueChange,
        ),
        new Text(
          'International',
          style: new TextStyle(fontSize: 16.0),
        ),
      ],
    );

//        children: <Widget>[ new Radio(
//    activeColor: Colors.blue,
//    value: 1,
//    groupValue: _TravelTyperadioValue,
//    onChanged: _handleTravelTypeRadioValueChange,
//    ),
//    new Text(
//    'International',
//    style: new TextStyle(
//    fontSize: 16.0,
//    ),
//    ),]

    final Exp_Purpose_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpPurposeController,
              decoration: new InputDecoration(
                labelText: "Exp Purpose",
              ),

              validator: (val) => validateDateFormat(val,"EXP_ExpPurpose"),
              onSaved: (val) => _ExpPurpose_desc = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_ExpPurpose"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_CostCenter_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpCostCenterController,
              decoration: new InputDecoration(
                labelText: "Cost Center",
              ),

              validator: (val) => validateDateFormat(val,"EXP_CostCenter"),
              onSaved: (val) => _ExpCostCenter = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_CostCenter"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    void _handleRadioValueChange1(int value) {
      setState(() {
        _radioValue1 = value;
        switch (_radioValue1) {
          case 0:
            print("yes");
            _ExpShare = "Y";
            isShareWith_widget = false;
            break;
          case 1:
            isShareWith_widget = true;
            print("No");
            _ExpShare = "N";
            break;
        }
      });
    }

    final Exp_ShareRadioButton = Row(
      children: <Widget>[
        new Text('Share :', style: new TextStyle(fontSize: 16.0)),
        new Radio(
          value: 0,
          activeColor: Colors.blue,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'Yes',
          style: new TextStyle(fontSize: 16.0),
        ),
        new Radio(
          activeColor: Colors.blue,
          value: 1,
          groupValue: _radioValue1,
          onChanged: _handleRadioValueChange1,
        ),
        new Text(
          'No',
          style: new TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );

    final Exp_Share_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpShareController,
              decoration: new InputDecoration(
                labelText: "Share",
              ),
              validator: (val) => val.isEmpty ? 'Value Cannot  Be Empty' : null,
              onSaved: (val) => _ExpShare = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,

//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: openAlertBox,
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
              ),
        ),
      ],
    );

    final Exp_ShareWith_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpShareWithController,
              decoration: new InputDecoration(
                labelText: "Share With",
              ),
              validator: (val) => val.isEmpty ? 'Value Cannot  Be Empty' : null,
              onSaved: (val) => _ExpShareWith = val,
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
                Icons.search,
                color: Colors.blue,
              ),
              onPressed: () => Exp_desc_help(context, "EXP_SharingWith"),
              //  onPressed: () =>  infoDialog(context, "data"),
              //  _selectDate(context, "voucher_date"),
            ),
          ),
        ),
      ],
    );

    final Exp_LimitAmount_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpLimintAmtController,
              decoration: new InputDecoration(
                labelText: "Limit Amount",
              ),
             keyboardType: TextInputType.number,
              validator: (val) => validateDateFormat(val,"Limit_Amount"),
              onSaved: (val) => _ExplimitAmt = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,

//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: openAlertBox,
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
              ),
        ),
      ],
    );

    final Exp_Amount_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpAmountController,
              decoration: new InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              validator: (val) => validateDateFormat(val,"Amount"),
              onSaved: (val) => _ExpAmount = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,

//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: openAlertBox,
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
              ),
        ),
      ],
    );

    final Exp_Remarks_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpRemarksController,
              decoration: new InputDecoration(
                labelText: "Remarks",
              ),

              validator: (val) => validateDateFormat(val,"Remarks"),
              onSaved: (val) => _ExpRemarks = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
              //color: Colors.blue,

//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: openAlertBox,
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
              ),
        ),
      ],
    );

    Widget _getShowHideWidget(bool offstageFlag, Widget Exp_Rema_widget) {
      Offstage offstage = new Offstage(
        offstage: offstageFlag,
        child: Exp_Rema_widget,
      );

      return offstage;
    }

    ;

    return new Scaffold(
      key: expense_booking_scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text("Booking Details",
            style: TextStyle(
                fontFamily: 'Comfortaa',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Form(
                  key: expense_booking_formKey,
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        width: 500.0,
                        //height: 250.0,
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
                                // child: new Text("Testtext", style: new TextStyle(fontSize: 30.0, fontFamily: "Barrio", color: new Color.fromARGB(255, 230, 230, 230))),
                              ),
                              Row(
                                children: <Widget>[
                                  Exp_start_date_widget,
                                  Exp_start_datepicker_widget,
                                ],
                              ),
                              Exp_VoucherEndDate_widget,
                              Exp_TotalNodays_widget,
                              Exp_Description_widget,
                              // _getShowHideWidget(isExpenseCarrier,Exp_Description_widget),

                              _getShowHideWidget(
                                  isShare_widget, Exp_ShareRadioButton),
//                              _getShowHideWidget(
//                                  isShare_widget, Exp_Share_widget),
                              _getShowHideWidget(
                                  isShareWith_widget, Exp_ShareWith_widget),
                              _getShowHideWidget(
                                  isTravelMode_widget, Exp_TravelMode_widget),
                              _getShowHideWidget(isTravelType_widget,
                                  Exp_TravelTypeRadioButton),
//                              _getShowHideWidget(
//                                  isTravelType_widget, Exp_TravelTypeRadioButton1),

                              _getShowHideWidget(
                                  isExpenseCarrier_wdget, Exp_Carrier_widget),
                              _getShowHideWidget(isFlightTrainNo_widget,
                                  Exp_FlightTrainNo_widget),
                              _getShowHideWidget(isFrom_Location_widget,
                                  Exp_From_Location_widget),
                              _getShowHideWidget(
                                  isTo_Location_widget, Exp_To_Location_widget),
                              _getShowHideWidget(
                                  isLimitAmount_widget, Exp_LimitAmount_widget),

                              Exp_Amount_widget,
                              Exp_Remarks_widget,
                              Exp_Purpose_widget,
                              Exp_CostCenter_widget,
                              SizedBox(
                                height: 10.0,
                              ),
                              Divider(
                                color: Colors.grey,
                                height: 4.0,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    width: 70,
                                    child: new RaisedButton(
                                        color: Colors.blue,
                                        child: Text("Add",
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white)),
                                        onPressed: () => _AddData(context),
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0))),
                                  ),
                                  new SizedBox(
                                    width: 5.0,
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: new RaisedButton(
                                        color: Colors.blue,
                                        child: new Text("Delete",
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white)),
                                        onPressed: () {},
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0))),
                                  ),
                                  new SizedBox(
                                    width: 5.0,
                                  ),
                                  SizedBox(
                                    width: 90,
                                    child: new RaisedButton(
                                        color: Colors.blue,
                                        child: new Text("Cancel",
                                            style: new TextStyle(
                                                fontSize: 18.0,
                                                color: Colors.white)),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          // Navigator.pop(context);
                                        },
                                        shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(
                                                    30.0))),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  // get the text in the TextField and send it back to the FirstScreen
  void _sendDataBack(BuildContext context) {
    String textToSendBack = "vilas";
    debugPrint("br :$textToSendBack");
    Navigator.pop(context, textToSendBack);
  }

  Exp_desc_help(BuildContext context, String Helptype) async {
    // Navigator.push returns a Future that will complete after we call
    // Navigator.pop on the Selection Screen!

    String Target = "SubCategory";
    String ColumnName = Helptype;
    String pValue = "%";
    String ParamStr1 = "";
    String ParamStr2 = "10175";
    String ParamStr3 = "";
    String FltrColumn = "ALL";
    String ParamStr4 = "";
    String ParamStr5 = "";
    String ParamStr6 = "";
    String OnlineOffline = "Online";

    switch (Helptype) {
      case "EXP_TrvSubcategory":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: '',
                    ParamStr1: 'STFC',
                    ParamStr2: '10175',
                    FltrColumn: FltrColumn,
                    ParamStr3: 'EMPTR',
                    Helpname:'SubCategory'

                   )),
        );

        setState(() {
          if (__ExpDescriptionController.text != null) {
            debugPrint("bro :${result[0]}");
            subcategoryvalue = result[0];
            _ExpSubCategory = "${result[0]}";
            _ExpDescription = "${result[1]}";
            __ExpDescriptionController.text = "${result[1]}";
            debugPrint("bro1 :${result[1]}");
            debugPrint("hdnlocation :${result[2]}");
            hdnLocationClassificationAppl = result[2];

            switch (result[0]) {
              case "EE002": //DAILY ALLOWANCE

                isShare_widget = true;
                isShareWith_widget = true;
                isTravelMode_widget = true;
                isTo_Location_widget = false;
                isFrom_Location_widget = true;
                //isExpenseCarrier_wdget = false;
                isLimitAmount_widget = false;
                isExpenseCarrier_wdget = true;
                isFlightTrainNo_widget = true;


                _openpopup_module("EXP_FromCity");


                _openpopup_module("Amount");



                break;
              case "EE005": //TOUR  CONVEYANCE":
                isTravelMode_widget = false;
                isFrom_Location_widget = false;
                isTo_Location_widget = false;
                isExpenseCarrier_wdget = true;
                isFlightTrainNo_widget = true;
                break;
              case "EE006": //LODGING":
                isShare_widget = false;
                isShareWith_widget = false;
                isTravelType_widget = false;
                isTravelMode_widget = true;
                isFrom_Location_widget = true;
                isExpenseCarrier_wdget = true;
                isFlightTrainNo_widget = true;
                break;
              case "EE008": //ROOM RENT TAXES":
              case "EE046": //TICKETS CANCELLATION":
              case "EE047": //TOLL CHARGES - TOUR":
              case "EE048": //HALF DAILY ALLOWANCE":
              case "EE052": //TOLL CHARGES - LOCAL":
              case "EE053": //FREIGHT CHARGES":
              case "EE058": // MEETING EXPENSES - MISCELLANEOUS":
              case "EE059": //FOOD EXPENSES":
                isShare_widget = true;
                isShareWith_widget = true;
                isTravelType_widget = true;
                isTravelMode_widget = true;
                isFrom_Location_widget = true;
                isTo_Location_widget = true;
                isLimitAmount_widget = true;
                isExpenseCarrier_wdget = true;
                isFlightTrainNo_widget = true;
                break;
              case "EE009": //TRAVEL MODE":
                isShare_widget = false;
                isShareWith_widget = false;
                isTravelMode_widget = false;
                isTravelType_widget = false;
                isFrom_Location_widget = false;
                isTo_Location_widget = false;
                isLimitAmount_widget = false;
                isExpenseCarrier_wdget = true;
                isFlightTrainNo_widget = true;
                break;
              case "EE051": //LOCAL CONVEYANCE":
                isShare_widget = true;
                isShareWith_widget = true;
                isTravelMode_widget = false;
                isFrom_Location_widget = false;
                isTo_Location_widget = false;
                isLimitAmount_widget = false;
                isExpenseCarrier_wdget = true;
                isFlightTrainNo_widget = true;
                break;

              case "EE060": //BIKE TRANSPORTATION CHARGES":
                isShare_widget = true;
                isShareWith_widget = true;
                isTravelType_widget = true;
                isTravelMode_widget = false;
                isFrom_Location_widget = false;
                isTo_Location_widget = false;
                isLimitAmount_widget = false;
                break;
            }
          }
        });
        break;
      case "EXP_FromCity":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: "EXP_City",
                    ParamStr4: hdnLocationClassificationAppl,
                    ParamStr1: subcategoryvalue,
                    ParamStr2: ParamStr2,
                    FltrColumn: FltrColumn,
                    ParamStr3: '0',
                    Helpname:'From City'
                  )),
        );

        setState(() {
          if (__ExpFromLocationController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpFromLocation = "${result[0]}";
            __ExpFromLocationController.text = "${result[0]}";
            debugPrint("bro1 :${result[1]}");
          }
        });
        break;
      case "EXP_City":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: hdnLocationClassificationAppl,
                    ParamStr1: subcategoryvalue,
                    ParamStr2: ParamStr2,
                    FltrColumn: FltrColumn,
                    ParamStr3: '0',
                    Helpname:'City'
                  )),
        );

        setState(() {
          if (__ExpToLocationController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpToLocation = "${result[0]}";
            __ExpToLocationController.text = "${result[0]}";
            debugPrint("bro1 :${result[1]}");
          }
        });
        break;

      case "EXP_ExpPurpose":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: "",
                    ParamStr1: "AIBHO",
                    ParamStr2: "EMPTR",
                    FltrColumn: FltrColumn,
                    ParamStr3: '0',
                  Helpname:'Exp Purpose'
                  )),
        );

        setState(() {
          if (__ExpPurposeController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpPurpose = "${result[0]}";
            debugPrint("purpose for" + _ExpPurpose);
            _ExpPurpose_desc = "${result[1]}";
            __ExpPurposeController.text = "${result[1]}";
            debugPrint("bro1 :${result[1]}");
          }
        });
        break;
      case "EXP_CostCenter":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: '',
                    ParamStr1: "STFC",
                    ParamStr2: '',
                    FltrColumn: FltrColumn,
                    ParamStr3: '0',
                  Helpname:'Cost Center'
                  )),
        );

        setState(() {
          if (__ExpCostCenterController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpToLocation = "${result[0]}";
            __ExpCostCenterController.text = "${result[0]}";
            debugPrint("bro1 :${result[1]}");
          }
        });
        break;
      case "EXP_SharingWith":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: '',
                    ParamStr1: '',
                    ParamStr2: '',
                    FltrColumn: FltrColumn,
                    ParamStr3: '0',
                  Helpname:'Share With'
                  )),
        );

        setState(() {
          if (__ExpShareWithController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpShareWith = "${result[0]}";
            __ExpShareWithController.text = "${result[0]}";
            debugPrint("bro1 :${result[0]}");
          }
        });
        break;

      case "EXP_Carrier":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: "",
                    ParamStr1: "",
                    ParamStr2: _ExpTravelMode,
                    FltrColumn: FltrColumn,
                    ParamStr3: '',
                  Helpname:'Carrier'
                  )),
        );

        setState(() {
          if (__ExpCarrierController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpCarrier = "${result[0]}";
            __ExpCarrierController.text = "${result[0]}";
            debugPrint("bro1 :${result[1]}");
          }
        });
        break;

      case "EXP_ExpTrvMode":
        final result = await Navigator.push(
          context,
          // We'll create the SelectionScreen in the next step!
          MaterialPageRoute(
              builder: (context) => SubCategory_HelpFilter(
                    helptype: ColumnName,
                    ParamStr4: "",
                    ParamStr1: "",
                    ParamStr2: "",
                    FltrColumn: FltrColumn,
                    ParamStr3: subcategoryvalue,
                  Helpname:'Exp Travel Mode'
                  )),
        );

        setState(() {
          if (__ExpTravelModeController.text != null) {
            debugPrint("bro :${result[0]}");
            _ExpTravelMode = "${result[0]}";
            __ExpTravelModeController.text = "${result[0]}";
            debugPrint("bro1 :${result[1]}");

            if (_ExpTravelMode.toUpperCase().toString() == "BUS" ||
                _ExpTravelMode.toUpperCase().toString() == "PRIVATE CAR") {
              isExpenseCarrier_wdget = true;
              isFlightTrainNo_widget = true;
            } else {
              isExpenseCarrier_wdget = false;
              isFlightTrainNo_widget = false;
            }
          }
        });
        break;
    }
//   final result = await Navigator.push(
//      context,
//      // We'll create the SelectionScreen in the next step!
//      MaterialPageRoute(builder: (context) => SubCategory_HelpFilter(
//        helptype :ColumnName,
//      )),
//    );

    // after the SecondScreen result comes back update the Text widget with it
//    setState(() {
//
//      switch(Helptype)
//      {
//        case "EXP_TrvSubcategory":
//          if (__ExpDescriptionController.text != null) {
//            debugPrint("bro :${result[0]}");
//            _ExpSubCategory = "${result[0]}";
//            __ExpDescriptionController.text = "${result[1]}";
//            debugPrint("bro1 :${result[1]}");
//            debugPrint("hdnlocation :${result[2]}");
//            hdnLocationClassificationAppl = result[2];
//          }
//          break;
//        case "EXP_City":
//          if (__ExpToLocationController.text != null) {
//            debugPrint("bro :${result[0]}");
//            _ExpToLocation = "${result[0]}";
//            __ExpToLocationController.text = "${result[0]}";
//            debugPrint("bro1 :${result[1]}");
//          }
//          break;
//      }
//
//    });

    //    debugPrint("bro :$result");
//      Scaffold.of(context)
//        ..removeCurrentSnackBar()
//        ..showSnackBar(SnackBar(content: Text("$result")));
  }

  var _statdatediff = "";
  var _statdatediff1 ="";
  var _enddatediff ="";
  String todaydate1="";
  var todaydate = new DateTime.now();
  var formatter = new DateFormat('dd/MM/yyyy');
  var formatter1 = new DateFormat('yyyy-MM-dd');

  Future<Null> _selectDate(BuildContext context, String str1) async {



     todaydate1 = formatter.format(todaydate);

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) //&& picked != selectedDate
      setState(() {
        selectedDate = picked;

        String formatted = formatter.format(selectedDate);
        String formatted1 = formatter1.format(selectedDate);
        print(formatted); // something like 2013-04-20
        print(formatted1); // something like 2013-04-20
        // vouchertxt.text = "${selectedDate.toLocal()}";
        switch (str1) {
          case "voucher_date":
            // __ExpVoucherStartdate.text = "${selectedDate.toLocal()}";
            // String todaydate1 = formatter.format(todaydate);
            break;
          case "start_date":
            print("start date" + str1);
            _statdatediff = formatted1;
            _statdatediff1 = formatted;

            __ExpVoucherStartdateController.text = "$formatted";
            if (datevalidator.IscompareDate(
                    todaydate1, formatted, 'Date', 'yyyymm') ==
                1) {
              // txtStartDate.setError("StartDate is greater than CurrentDate...");
              //   txtStartDate.requestFocus();
              print("StartDate is greater than CurrentDate...");
            }

            break;
          case "end_date":
            __ExpVoucherEnddateController.text = "$formatted";
            _enddatediff =formatted;
            DateTime startdate = DateTime.parse(_statdatediff);
            Duration enddate = DateTime.parse(formatted1).difference(startdate);
            String differenceInDays = (enddate.inDays).floor().toString();
            print(differenceInDays);
            if (differenceInDays == "0") {
              var differenceInDays1 = int.parse(differenceInDays) + 1;
              __ExpNoofDaysController.text = differenceInDays1.toString();
            } else {
              var differenceInDays1 = int.parse(differenceInDays) + 1;
              __ExpNoofDaysController.text = differenceInDays1.toString();
            }

            if (datevalidator.IscompareDate(_statdatediff1, formatted, "Date", "yyyymm") == -1) {
              print("EndDate is less Than StartDate...");
              // txtEndDate.requestFocus();
            } else if (datevalidator.IscompareDate(
                    todaydate1,
                formatted,
                    "Date",
                    "yyyymm") ==
                1) {
              print("EndDate is greater Than CurrentDate...");
              // txtEndDate.requestFocus();
            }

            break;


        }
      });
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
        else
          {


             _openpopup_module("StartDate");



          }




        break;
      case "end_date":
        if (value.length == 0)
          return 'Enter End Date';
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
        else
          {
            _openpopup_module("EndDate");


          }
        break;
      case "EXP_TrvSubcategory":
      case "EXP_ExpPurpose":
      case "Remarks":
      case "Amount":
      case "Limit_Amount":
      case "Travel_Type":
      case "Travel_Mode":
      case "Flight":
      case "Carrier":
      case "To_Location":
      case "From_Location":
      case "EXP_CostCenter":
        if(value.length == 0)
          return "Enter "+inputtype;
        break;



    }



  }

  void _AddData(BuildContext context) {
    print("add click");
    final form = expense_booking_formKey.currentState;
    print("form get data");
    if (form.validate()) {
      print("validation input field");
      form.save();
      getpassedindex;
      _counter++;
      print("no of count" + _counter.toString());
      print("voucherDate $__ExpVoucherStartdateController");

//      _ExpNoOfDays
//      _ExpDescription
//      _ExpShare
//      _ExpShareWith
//      _ExplimitAmt
//      _ExpToLocation
//      _ExpAmount
//      _ExpRemarks
//      _ExpPurpose
//      _ExpCostCenter
      // _ExpDescription
      //
//      ExpenseData data = new ExpenseData(1,_ExpStartDate,_ExpEndDate,_ExpNoOfDays,_ExpDescription,_ExpDescription,_ExpShare,_ExpShareWith,
//          _ExpToLocation,_ExplimitAmt, _ExpAmount,_ExpRemarks,_ExpPurpose,_ExpCostCenter);

      var _ExpNoOfDays1 = int.parse(_ExpNoOfDays);
      //assert(_ExpNoOfDays1 is int);
      print(_ExpNoOfDays1);

      var _ExpAmount1 = double.parse(_ExpAmount);
      // assert(_ExpAmount1 is int);
      print(_ExpAmount1);

      switch (_ExpSubCategory) {
        case "EE002": //DAILY ALLOWANCE
          print("Daily " + _ExpSubCategory);
          _ExpFromLocation = "";
          print("Daily1 " + _ExpFromLocation);
          break;
      }

      ExpenseData expensedata = new ExpenseData(
          _counter,
          _ExpStartDate,
          _ExpEndDate,
          _ExpNoOfDays1,
          _ExpSubCategory,
          _ExpDescription,
          _ExpShare,
          _ExpShareWith,
          _ExpToLocation,
          _ExplimitAmt,
          _ExpAmount1,
          _ExpRemarks,
          _ExpPurpose,
          _ExpPurpose_desc,
          _ExpCostCenter,
          _ExpFromLocation,
          _ExpTravelMode,
          _TravelType,
          _ExpCarrier,
          _ExpFlightTrainNo,
          _LocationClassificationAppl,
          _TrvModeApp,
          _LimitApp,
          _LimiRes,
          _TrvModeSequence,
          _hdnConveyance,
          _hdnActualLimAmt,
          _hdnScanAttach,
          _hdnMobDoc,
          _PolicyApp,
          _CarrieCode,
          _UnsettleADvFlg,
          _LodgingAlert,
          _ShareAppl,
          _ProductCode,
          _CarrierTrvTyp);

      print(expensedata.toString());

      setState(() {
        getpassedindex;
      });
      if (getpassedindex == null) {
        //index not exists
        print("index does not exit" + getpassedindex.toString());
        print("please add fresh record");
        _expensesDataList.add(expensedata);
        print(" new total count" + _expensesDataList.length.toString());
      } else {
        // index exists
        print("index  exit" + getpassedindex.toString());
        print("update current index");
        //_expensesDataList.insert(getpassedindex, expensedata);
        _expensesDataList[getpassedindex] = expensedata;
        print(
            "after update total coount" + _expensesDataList.length.toString());
      }

      print("total count" + _expensesDataList.length.toString());
      BookingPage1.expensesDataList = _expensesDataList;
      print("after total count" + _expensesDataList.length.toString());
      Navigator.pop(context, BookingPage1.expensesDataList);

      //iterating across list

//      for (int i = 0; i < _expensesDataList.length; i++) {
//        print(_expensesDataList[i].V_Remarks);
//        ExpenseData expenseData=_expensesDataList[i];
//        print(expenseData.V_Amount);
//      }

//      for (var x = 0; x < _expensesDataList.length; x++) {
//        //ExpenseData expensedata = _expensesDataList.map()
//        print(_expensesDataList[x].toString());
//      }

      // _expensesDataList.forEach((element) => print(element));

//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => BookingPage1(myObject:_expensesDataList)));
//    }

//      Navigator.push(
//          context,
//          new MaterialPageRoute(
//              builder: (__) => new BookingPage1(expensesDataList:_expensesDataList)));

    } else {
      print("no validation done");
    }
  }

  void EditExpenseData(int getpassedindex) {
    ExpenseData expenseData = BookingPage1.expensesDataList[getpassedindex];
    __ExpVoucherStartdateController.text = expenseData.V_StartDate.toString();
    __ExpVoucherEnddateController.text = expenseData.V_EndDate.toString();
    __ExpNoofDaysController.text = expenseData.V_NoOfDays.toString();
    __ExpDescriptionController.text = expenseData.V_ExpDescr.toString();
    __ExpToLocationController.text = expenseData.V_ToCity.toString();
    __ExpLimintAmtController.text = expenseData.V_LimitAmount.toString();
    __ExpShareController.text = expenseData.V_Share.toString();
    __ExpShareWithController.text = expenseData.V_ShareWith.toString();
    __ExpAmountController.text = expenseData.V_Amount.toString();
    __ExpRemarksController.text = expenseData.V_Remarks.toString();
    __ExpPurposeController.text = expenseData.V_ExpPurposeDesc.toString();
    __ExpCostCenterController.text = expenseData.V_CostCenter.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    __ExpVoucherStartdateController.dispose();
    __ExpVoucherEnddateController.dispose();
    __ExpNoofDaysController.dispose();
    __ExpDescriptionController.dispose();
    __ExpToLocationController.dispose();
    __ExpLimintAmtController.dispose();
    __ExpShareController.dispose();
    __ExpShareWithController.dispose();
    __ExpAmountController.dispose();
    __ExpRemarksController.dispose();
    __ExpPurposeController.dispose();
    __ExpCostCenterController.dispose();
    super.dispose();
  }

  infoDialog(context, review) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Review'),
            content: Text(review),
            actions: <Widget>[
              FlatButton(
                child: Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();

                  showReview(context, "data1");
                },
              )
            ],
          );
        });
  }

  showReview(context, review) {

    Widget displaywidget;
    final EndDatepopup =Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpVoucherEnddateController,
              autovalidate: true,
              decoration: new InputDecoration(
                labelText: "End Date",
              ),

              keyboardAppearance: Brightness.light,
              validator: (val) => validateDateFormat(val,"end_date"),
              onSaved: (val) => _ExpEndDate = val,
              focusNode: _ExpVoucherEnddateFocus,
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(_ExpNoofDaysFocus);
              },
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
              onPressed: () => _selectDate(context, "end_date"),
            ),
          ),
        ),
      ],
    );


    final Exp_Amount_widget = Row(
      children: <Widget>[
        Expanded(
          flex: 8, // 60%
          child: Container(
            child: new TextFormField(
              controller: __ExpAmountController,
              decoration: new InputDecoration(
                labelText: "Amount",
              ),
              keyboardType: TextInputType.number,
              validator: (val) => validateDateFormat(val,"Amount"),
              onSaved: (val) => _ExpAmount = val,
            ),
          ),
        ),
        Expanded(
          flex: 2, // 20%
          child: Container(
            //color: Colors.blue,

//                                            child: new IconButton(
//                                              alignment: Alignment.topRight,
//                                              icon: new Icon(
//                                                Icons.date_range,
//                                                color: Colors.blue,
//                                              ),
//                                              onPressed: openAlertBox,
//                                              //  _selectDate(context, "voucher_date"),
//                                            ),
          ),
        ),
      ],
    );


    switch(review)
    {
      case "EndDate":
        displaywidget= EndDatepopup;

        break;
      case "Amount":
        displaywidget=Exp_Amount_widget;
        break;


    }

    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  height: 350.0,
                  width: 200.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(height: 150.0),
                          Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                                color: Colors.teal),
                          ),

                        ],
                      ),
                      SizedBox(height: 20.0),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child:displaywidget,


                      ),


                      SizedBox(height: 15.0),
                      FlatButton(
                          child: Center(
                            child: Text(
                              'OKAY',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 14.0,
                                  color: Colors.teal),
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.transparent)
                    ],
                  )));
        });
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      //first time seen
      Future.delayed(Duration(seconds: 2), () {

        showReview(context,"what");

      });

    } else {
      //alerdy seen
      prefs.setBool('seen', true);
      print("alerdy seeen");

    }
  }

  _openpopup_module(String inputtype) {

    switch(inputtype)
    {
      case "StartDate":
        return  this._memoizer.runOnce(() async {
          await Future.delayed(Duration(seconds: 1));
          return showReview(context,"EndDate");
        });

        break;
      case "EndDate":
        return  this._memoizer1.runOnce(() async {
          await Future.delayed(Duration(seconds: 1));
          return Exp_desc_help(context, "EXP_TrvSubcategory");
        });

        break;
      case "Amount":
        return  this._memoizer3.runOnce(() async {
          await Future.delayed(Duration(seconds: 1));
          return showReview(context,"Amount");
        });
        break;

      case "EXP_FromCity":
       return this._memoizer2.runOnce(() async {
          await Future.delayed(Duration(seconds: 1));
          return Exp_desc_help(context, "EXP_FromCity");
        });
        break;

    }

  }


}
