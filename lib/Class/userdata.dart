class UserData {
  final String result;
  final String massage;
  final String Hdr_fk;

  UserData({this.result, this.massage, this.Hdr_fk});

  factory UserData.fromJson(Map<String, dynamic> json) {
    print("data availbale");
    print(json);
    print(json['Table0']);
    var msg = "";
    var msg1 = "";
    var msg2 = "";
    var result1 ="";
    for (var resultkey in json.keys) {
      print(resultkey);
      // prints 1-0001
      json[resultkey][0];

      for(var resultarraykey in json[resultkey][0].keys)
        {
          result1=resultarraykey;

          switch (result1) {
            case "RESULT":
              if (json[resultkey][0]['RESULT'].toString() == "1002") {
                msg = json[resultkey][0]['RESULT'].toString();
                msg1 = json[resultkey][0]['MESSAGE'].toString();
                //
                //msg2 = json['Table0'][0]['HDR_FK'].toString();

              }
              return UserData(result: msg ?? "", massage: msg1 ?? "", Hdr_fk: msg2 ?? "");
              break;
            case "SUCCESS":
              if (json[resultkey][0]['SUCCESS'].toString() == "Success") {
                msg = json[resultkey][0]['SUCCESS'].toString();
                msg1 = json[resultkey][0]['VOUCHERNO'].toString();
                msg2 = json[resultkey][0]['HDR_FK'].toString();
              }
              return UserData(result: msg ?? "", massage: msg1 ?? "", Hdr_fk: msg2 ?? "");
              break;
            case "COLUMN1":

              break;
          }
        }
//      for(var i = 0; i < json[resultkey][0].length; i++){
//        result1= json[resultkey][0][i];
//      }




//      if(json[resultkey]['SUCCESS'].toString() == "Success")
//        {
//          print(json[resultkey]['SUCCESS']);
//          result1 = "SUCCESS";
//        }
//        else if(json[resultkey]['RESULT'].toString() == "1002")
//          {
//            print(json[resultkey]['RESULT']);
//            result1 = "RESULT";
//          }
      // prints red
      // print(json[resultkey]['SUCCESS']);   // prints FF0000
    }




//
//    var result = json['Table0'][0];
//
//    msg = json['Table0'][0]['RESULT'].toString();
//    msg1 = json['Table0'][0]['MESSAGE'].toString();
//    msg2 = json['Table0'][0]['HDR_FK'].toString();
//    print("$result");
//    var result1 ="";
//
//    if(result.contains('RESULT'))
//      {
//        print("RESULT");
//        result1="RESULT";
//      }
//      else if(result.contains('SUCCESS'))
//        {
//          print("SUCCESS");
//          result1="SUCCESS";
//        }
//    switch (result1) {
//      case "RESULT":
//        if (json['Table0'][0]['RESULT'].toString() == "1002") {
//          msg = json['Table0'][0]['RESULT'].toString();
//          msg1 = json['Table0'][0]['MESSAGE'].toString();
//          //msg2 = json['Table0'][0]['HDR_FK'].toString();
//        }
//        break;
//      case "SUCCESS":
//        if (json['Table0'][0]['SUCCESS'].toString() == "Success") {
//          msg = json['Table0'][0]['SUCCESS'].toString();
//          msg1 = json['Table0'][0]['VOUCHERNO'].toString();
//          msg2 = json['Table0'][0]['HDR_FK'].toString();
//        }
//        break;
//    }

//      if (json['Table0'][0]['SUCCESS'].toString() == "Success") {
//        msg = json['Table0'][0]['SUCCESS'].toString();
//        msg1 = json['Table0'][0]['VOUCHERNO'].toString();
//        msg2 = json['Table0'][0]['HDR_FK'].toString();
//      }
//      print("Y : " + json['Table0']);

//      /HDR_FK
//    else
//    if (json.containsKey('Table1')) {
//      print("b");
//      if (json['Table1'][0]['RESULT'].toString() == "1002") {
//        msg = json['Table1'][0]['RESULT'].toString();
//        msg1 = json['Table1'][0]['MESSAGE'].toString();
//        print("c");
//      }
//    }

    print("d");
    print(msg);
    print(msg1);
    print(msg2);

    return UserData(result: msg ?? "", massage: msg1 ?? "", Hdr_fk: msg2 ?? "");
  }
}
