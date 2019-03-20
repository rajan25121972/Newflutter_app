

 import 'package:intl/intl.dart';

class DateValidator {



    int IscompareDate(String P_StartDate, String P_EndDate, String mode,String dateFormat){
     try{
       /*  SimpleDateFormat formatterDateTime = new SimpleDateFormat("dd/mm/yyyy hh:mm aa");
        SimpleDateFormat formatterDate = new SimpleDateFormat("dd/MM/yyyy");
        SimpleDateFormat formatterTime = new SimpleDateFormat("hh:mm aa");
        */

       var formatter = new DateFormat('dd/MM/yyyy');
       var formatter1 = new DateFormat('yyyy-MM-dd');
       //String formatted = formatter.format(selectedDate);
     //  String formatted1 = formatter1.format(selectedDate);
     //  print(formatted); // something like 2013-04-20
     //  print(formatted1); // something like 2013-04-20
       // vouchertxt.text = "${selectedDate.toLocal()}";



       DateTime date1,date2;

       date1 = formatter.parse(P_StartDate.toString());

       date2 = formatter.parse(P_EndDate.toString());

       return  date2.compareTo(date1);

     }
     catch (ex){

     print("data error"+ex.toString());
     return  -2;
     }
   }





}