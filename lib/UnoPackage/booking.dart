import 'package:flutter/material.dart';
import 'package:flutter_app/Class/BoookingStatefullWidget.dart';


class Booking extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Booking Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: BookingPage(),
      home :BookingPage1(),
    );
  }

}

