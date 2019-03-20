import 'package:flutter/material.dart';


class expensebooking4 extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Expense  Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: BookingPage(),
      home :Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back! vilas'),
        ),
      ),
    );
  }

}