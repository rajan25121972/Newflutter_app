import 'package:flutter/material.dart';
import 'package:flutter_app/AsynkTask/fetchdata.dart';
import 'package:flutter_app/Class/MyJsonData.dart';
import 'package:flutter_app/Class/Post.dart';

class BookingPage extends StatefulWidget {
  static String tag = 'Booking-page';



  @override
  _BookingPageState createState() => new _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {

  TextEditingController VoucherDateController = new TextEditingController();

  List<Post> growableList = new List();

  @override
  Widget build(BuildContext context) {

    String _text = "initial";

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/logo.png'),
      ),
    );



    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'vilasjdhv639@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final voucherDate = TextField(
      keyboardType: TextInputType.text,
      controller: VoucherDateController,
      autofocus: false,

      decoration: InputDecoration(
        hintText: '20/02/2019',

        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final tourstartddate = TextFormField(
      autofocus: false,

      initialValue: '20/02/2019 10:55 AM',
     // obscureText: true,
      decoration: InputDecoration(
        hintText: '20/02/2019 10:55 AM',
       // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final tourendddate = TextFormField(
      autofocus: false,

      initialValue: '20/02/2019 10:55 AM',
      //obscureText: true,
      decoration: InputDecoration(
        hintText: '20/02/2019 10:55 AM',
        //contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      //  border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );


    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );



    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {

          //Navigator.of(context).pushNamed(HomePage.tag);
          setState((){
            print(VoucherDateController.text);
            //dummy data


// Navigate to second screen with data
          //  Navigator.push(context, new MaterialPageRoute(builder: (context) => new SecondScreenWithData(person: new Person("Priyank","28"))));
           // _text = VoucherDateController.text;
           // Navigator.push(context, new MaterialPageRoute(builder: (context) => MyJsonData( userdata:  callWebServiceForLofinUser1(VoucherDateController.text,"abc"))));
           // MaterialPageRoute(builder: (context) => MyJsonData( userdata: callWebServiceForLofinUser())),
          });


        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Booking Details")),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0 ),
          children: <Widget>[


            //email,
            SizedBox(height: 10.0),
            voucherDate,
            SizedBox(height: 10.0),
            tourstartddate,
            SizedBox(height: 10.0),
            tourendddate,

            SizedBox(height: 24.0),

            SizedBox(height: 24.0),
            loginButton,
            new Text("Text Input: $_text"),
            forgotLabel
          ],
        ),
      ),
    );

  }



}