
import 'package:flutter_app/Class/ExpenseData.dart';
import 'package:flutter_app/Class/Expsubcategory_help.dart';
import 'package:flutter_app/Class/Post.dart';
import 'package:flutter_app/Class/userdata.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/3');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    return Post.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

Future<UserData> callWebServiceForLofinUser(
    String Username1, String pass1) async {
  final paramDic = {
    "username": Username1,
    "password": pass1,
  };

  // http://10.0.1.112/MobileServiceLiveUat_Encrypt/MBService.asmx
  final loginData = await http.post(
    "http://10.0.1.112/JsonResultDemo/Home/HellowWorld", // change with your API
    //"http://115.113.27.9/JsonResultDemo/Home/HellowWorld"
    body: paramDic,
  );

  print(loginData.body);

  return UserData.fromJson(json.decode(loginData.body));
}

Future<UserData> callWebServiceForLofinUser1 (
    String VoucherDate, List<ExpenseData> ExpenseDataList) async {
  print(VoucherDate);
  var P_expXmlData = "";
  var P_AdvDetXmlData = "";
  var P_PayDetXmlData = "";
  var P_UserLogXmlData = "";
  var error = "";
  var decData = "";

  String Val_V_StartDate   =  "";
  String Val_V_EndDate   =  "";
  var expensebuffer = new StringBuffer();
  expensebuffer.write("<Dataset>");
  print(ExpenseDataList.length);
  double P_Totalsum = 0;
  for (int i = 0; i < ExpenseDataList.length; i++) {
    ExpenseData expenseData = ExpenseDataList[i];
    print("vilas your city is" + expenseData.V_ToCity);

        String Val_PkId   =  expenseData.PkId.toString();
         Val_V_StartDate   =  expenseData.V_StartDate;
         Val_V_EndDate   =  expenseData.V_EndDate;
        String Val_V_NoOfDays   =  expenseData.V_NoOfDays.toString();
        String Val_ExpSubcategory = expenseData.V_ExpSubcategory;
        String Val_ExpDescr  =   expenseData.V_ExpDescr;
        String Val_V_Share   =  expenseData.V_Share;
        String Val_V_ShareWith   =  "";//expenseData.V_ShareWith;
        String Val_V_ToCity   =  expenseData.V_ToCity;
        String Val_V_LimitAmount   =  expenseData.V_LimitAmount;
        String Val_V_Amount   =  expenseData.V_Amount.toString();
        String Val_V_Remarks   =  expenseData.V_Remarks;
        String Val_V_ExpPurpose   =  expenseData.V_ExpPurpose;
        String Val_V_ExpPurposeDesc   =  expenseData.V_ExpPurposeDesc;
        String Val_V_CostCenter   =  expenseData.V_CostCenter;
        String Val_V_FromCity   =  expenseData.V_FromCity;
        String Val_V_TravelMode   =  expenseData.V_TravelMode;
        String Val_V_TravelType   =  expenseData.V_TravelType;
        String Val_V_Carrier   =  expenseData.V_Carrier;
        String Val_V_FlightTrainNo   =  expenseData.V_FlightTrainNo;
        String Val_V_LocationClassificationA   =  expenseData.V_LocationClassificationAppl;
        String Val_V_TrvModeApp   =  expenseData.V_TrvModeApp;
        String Val_V_LimitApp   =  expenseData.V_LimitApp;
        String Val_V_LimiRes   =  expenseData.V_LimiRes;
        String Val_V_TrvModeSequence   =  expenseData.V_TrvModeSequence;
        String Val_V_hdnConveyance   =  expenseData.V_hdnConveyance;
        String Val_V_hdnActualLimAmt   =  expenseData.V_hdnActualLimAmt;
        String Val_V_hdnScanAttach   =  expenseData.V_hdnScanAttach;
        String Val_V_hdnMobDoc   =  expenseData.V_hdnMobDoc;
        String Val_V_PolicyApp   =  expenseData.V_PolicyApp;
        String Val_V_CarrieCode   =  expenseData.V_CarrieCode;
        String Val_V_UnsettleADvFlg   =  expenseData.V_UnsettleADvFlg;
        String Val_V_LodgingAlert   =  expenseData.V_LodgingAlert;
        String Val_V_ShareAppl   =  expenseData.V_ShareAppl;
        String Val_V_ProductCode   =  expenseData.V_ProductCode;
        String Val_V_CarrierTrvType   =  expenseData.V_CarrierTrvType;

    P_Totalsum= P_Totalsum +expenseData.V_Amount;
    // P_expXmlData="<Dataset><Table><All>Y</All><ExpSubCategory>EE002</ExpSubCategory><ExpSubCategoryDesc>Val_ExpSubCategoryDesc</ExpSubCategoryDesc><CostCenter>AIBHO</CostCenter><ExpPurpose>P0002</ExpPurpose><ExpPurposeDesc>ANNUAL BOARD MEETING2016</ExpPurposeDesc><Sharing>N</Sharing><SharingWith></SharingWith><TrvMode></TrvMode><TravelType></TravelType><Carrier></Carrier><CarrierCode></CarrierCode><Flight></Flight><StartDate>20/02/2019</StartDate><EndDate>20/02/2019</EndDate><NoOfDays>1</NoOfDays><FromLocation></FromLocation><TourCity>THALAIVASAL</TourCity><LimitAmt>0.00</LimitAmt><GrossAmt>0.0</GrossAmt><DeductionAmt>0.0</DeductionAmt><Amount>100.00</Amount><CreditCardAdjAmount>0.00</CreditCardAdjAmount><NetPayble>100.00</NetPayble><Remarks>test</Remarks><PolicyApp>y</PolicyApp><ProductCode></ProductCode><PK_ID>0</PK_ID><CrdtcrdXml><Dataset><chk/><CompShrtDescr/><Empcode/><CreditCardNumber/><PostingDate/><TranDate/><Supplier/><Amount/><AdjustedAmt/><BalanceAmt/><curAdjustedAmount/><pk_id/></Dataset></CrdtcrdXml><LocationClassificationAppl>y</LocationClassificationAppl><TrvModeApp>0</TrvModeApp><limitApp>n</limitApp><TablelimitAmt>0.00</TablelimitAmt><limiRes>n</limiRes><TrvModeSequence></TrvModeSequence><hdnconveyance></hdnconveyance><Sharing_Actual></Sharing_Actual></Table></Dataset>";

    //expensebuffer.write("<Table><All>Y</All><ExpSubCategory>"+Val_ExpSubCategory+"</ExpSubCategory><ExpSubCategoryDesc>"+Val_ExpSubCategoryDesc+"</ExpSubCategoryDesc><CostCenter>"+Val_CostCenter+"</CostCenter><ExpPurpose>P0002</ExpPurpose><ExpPurposeDesc>"+Val_ExpPurposeDesc+"</ExpPurposeDesc><Sharing>N</Sharing><SharingWith></SharingWith><TrvMode></TrvMode><TravelType></TravelType><Carrier></Carrier><CarrierCode></CarrierCode><Flight></Flight><StartDate>"+Val_StartDate+"</StartDate><EndDate>"+Val_EndDate+"</EndDate><NoOfDays>"+Val_NoOfDays+"</NoOfDays><FromLocation></FromLocation><TourCity>"+Val_ToCity+"</TourCity><LimitAmt>"+Val_LimitAmount+"</LimitAmt><GrossAmt>0.0</GrossAmt><DeductionAmt>0.0</DeductionAmt><Amount>"+Val_Amount+"</Amount><CreditCardAdjAmount>0.00</CreditCardAdjAmount><NetPayble>"+Val_Amount+"</NetPayble><Remarks>"+Val_Remarks+"</Remarks><PolicyApp>y</PolicyApp><ProductCode></ProductCode><PK_ID>0</PK_ID><CrdtcrdXml><Dataset><chk/><CompShrtDescr/><Empcode/><CreditCardNumber/><PostingDate/><TranDate/><Supplier/><Amount/><AdjustedAmt/><BalanceAmt/><curAdjustedAmount/><pk_id/></Dataset></CrdtcrdXml><LocationClassificationAppl>y</LocationClassificationAppl><TrvModeApp>0</TrvModeApp><limitApp>n</limitApp><TablelimitAmt>0.00</TablelimitAmt><limiRes>n</limiRes><TrvModeSequence></TrvModeSequence><hdnconveyance></hdnconveyance><Sharing_Actual></Sharing_Actual></Table>");

    expensebuffer.write("<Table><All>Y</All><ExpSubCategory>"+Val_ExpSubcategory+"</ExpSubCategory><ExpSubCategoryDesc>"+Val_ExpDescr+"</ExpSubCategoryDesc><CostCenter>"+Val_V_CostCenter+"</CostCenter><ExpPurpose>"+Val_V_ExpPurpose+"</ExpPurpose><ExpPurposeDesc>"+Val_V_ExpPurposeDesc+"</ExpPurposeDesc><Sharing>"+Val_V_Share+"</Sharing><SharingWith>"+Val_V_ShareWith+"</SharingWith><TrvMode>"+Val_V_TravelMode+"</TrvMode><TravelType>"+Val_V_TravelType+"</TravelType><Carrier>"+Val_V_CarrierTrvType+"</Carrier><CarrierCode></CarrierCode><Flight>"+Val_V_FlightTrainNo+"</Flight><StartDate>"+Val_V_StartDate+"</StartDate><EndDate>"+Val_V_EndDate+"</EndDate><NoOfDays>"+Val_V_NoOfDays+"</NoOfDays><FromLocation>"+Val_V_FromCity+"</FromLocation><TourCity>"+Val_V_ToCity+"</TourCity><LimitAmt>"+Val_V_LimitAmount+"</LimitAmt><GrossAmt>0.0</GrossAmt><DeductionAmt>0.0</DeductionAmt><Amount>"+Val_V_Amount+"</Amount><CreditCardAdjAmount>0.00</CreditCardAdjAmount><NetPayble>"+P_Totalsum.toString()+"</NetPayble><Remarks>"+Val_V_Remarks+"</Remarks><PolicyApp>y</PolicyApp><ProductCode></ProductCode><PK_ID>0</PK_ID><CrdtcrdXml><Dataset><chk/><CompShrtDescr/><Empcode/><CreditCardNumber/><PostingDate/><TranDate/><Supplier/><Amount/><AdjustedAmt/><BalanceAmt/><curAdjustedAmount/><pk_id/></Dataset></CrdtcrdXml><LocationClassificationAppl>y</LocationClassificationAppl><TrvModeApp>0</TrvModeApp><limitApp>n</limitApp><TablelimitAmt>0.00</TablelimitAmt><limiRes>n</limiRes><TrvModeSequence></TrvModeSequence><hdnconveyance></hdnconveyance><Sharing_Actual></Sharing_Actual></Table>");

  }

  expensebuffer.write("</Dataset>");
  print("new data"+expensebuffer.toString());
  P_expXmlData =expensebuffer.toString();
  var data = jsonEncode({
    'username': "",
    'password': ['flutter', 'snippets'],
    'versions': '0.0.20',
    'task': 13511,
  });
// data == '{"framework":"Flutter","tags":["flutter","snippets"],"versions":"0.0.20","task":13511}'

  // String ExpDetXmlData_P="<Dataset><Table><All>Y</All><ExpSubCategory>EE002</ExpSubCategory><ExpSubCategoryDesc>DAILYALLOWANCE</ExpSubCategoryDesc><CostCenter>AIBHO</CostCenter><ExpPurpose>P0002</ExpPurpose><ExpPurposeDesc>ANNUAL BOARD MEETING2016</ExpPurposeDesc><Sharing>N</Sharing><SharingWith></SharingWith><TrvMode></TrvMode><TravelType></TravelType><Carrier></Carrier><CarrierCode></CarrierCode><Flight></Flight><StartDate>20/02/2019</StartDate><EndDate>20/02/2019</EndDate><NoOfDays>1</NoOfDays><FromLocation></FromLocation><TourCity>THALAIVASAL</TourCity><LimitAmt>0.00</LimitAmt><GrossAmt>0.0</GrossAmt><DeductionAmt>0.0</DeductionAmt><Amount>100.00</Amount><CreditCardAdjAmount>0.00</CreditCardAdjAmount><NetPayble>100.00</NetPayble><Remarks>test</Remarks><PolicyApp>y</PolicyApp><ProductCode></ProductCode><PK_ID>0</PK_ID><CrdtcrdXml><Dataset><chk/><CompShrtDescr/><Empcode/><CreditCardNumber/><PostingDate/><TranDate/><Supplier/><Amount/><AdjustedAmt/><BalanceAmt/><curAdjustedAmount/><pk_id/></Dataset></CrdtcrdXml><LocationClassificationAppl>y</LocationClassificationAppl><TrvModeApp>0</TrvModeApp><limitApp>n</limitApp><TablelimitAmt>0.00</TablelimitAmt><limiRes>n</limiRes><TrvModeSequence></TrvModeSequence><hdnconveyance></hdnconveyance><Sharing_Actual></Sharing_Actual></Table></Dataset>',@AdvDetXmlData_P=N'<Dataset><Table><PK_ID /><Select>N</Select><CostCenter /><TRNo /><AdvanceAmt /><AdjustedAmt /><BalanceAdv /><CurrentAdjustAmt /></Table></Dataset>',@PayDetXmlData_P=N'<Dataset><Table><Chk>Y</Chk><PayPKID>0</PayPKID><Select>true</Select><Amount>100.00</Amount><PayToID>10175</PayToID><FavouringName>VARADA CHARY S</FavouringName><PayMode>NEFT</PayMode><AccountNo>00761050038891</AccountNo><IFSCCode>HDFC0000076</IFSCCode><BankName>HDFC BANK</BankName><payablelocation></payablelocation><IntstrNo></IntstrNo><InstrDate></InstrDate></Table></Dataset>',@UserLogXml_P=N'<Dataset><Table><Action /><UserID /><UserName /><Role /><Date /><Remarks /><Designation /></Table></Dataset>";
  print("a");

//  var buffer = new StringBuffer();
//  var buffer2 = new StringBuffer();
//  var buffer3 = new StringBuffer();
//  var buffer4 = new StringBuffer();

  //buffer.write("<Dataset><Table><All>Y</ALL> <ExpSubCategory>EE002</ExpSubCategory><ExpSubCategoryDesc>DAILYALLOWANCE</ExpSubCategoryDesc><CostCenter>AIBHO</CostCenter><ExpPurpose>P0002</ExpPurpose><ExpPurposeDesc>ANNUAL BOARD MEETING2016</ExpPurposeDesc><Sharing>N</Sharing><SharingWith></SharingWith><TrvMode></TrvMode><TravelType></TravelType><Carrier></Carrier><CarrierCode></CarrierCode><Flight></Flight><StartDate>20/02/2019</StartDate><EndDate>20/02/2019</EndDate><NoOfDays>1</NoOfDays><FromLocation></FromLocation><TourCity>THALAIVASAL</TourCity><LimitAmt>0.00</LimitAmt><GrossAmt>0.0</GrossAmt><DeductionAmt>0.0</DeductionAmt><Amount>100.00</Amount><CreditCardAdjAmount>0.00</CreditCardAdjAmount><NetPayble>100.00</NetPayble><Remarks>test</Remarks><PolicyApp>y</PolicyApp><ProductCode></ProductCode><PK_ID>0</PK_ID><CrdtcrdXml><Dataset><chk/><CompShrtDescr/><Empcode/><CreditCardNumber/><PostingDate/><TranDate/><Supplier/><Amount/><AdjustedAmt/><BalanceAmt/><curAdjustedAmount/><pk_id/></Dataset></CrdtcrdXml><LocationClassificationAppl>y</LocationClassificationAppl><TrvModeApp>0</TrvModeApp><limitApp>n</limitApp><TablelimitAmt>0.00</TablelimitAmt><limiRes>n</limiRes><TrvModeSequence></TrvModeSequence><hdnconveyance></hdnconveyance><Sharing_Actual></Sharing_Actual></Table></Dataset>");
  // buffer2.write("<Dataset><Table><PK_ID/><Select>N</Select><CostCenter/><TRNo/><AdvanceAmt/><AdjustedAmt/><BalanceAdv/><CurrentAdjustAmt/></Table></Dataset>");
//  buffer3.write("<Dataset><Table><Chk>Y</Chk><PayPKID>0</PayPKID><Select>true</Select><Amount>100.00</Amount><PayToID>10175</PayToID><FavouringName>VARADA CHARY S</FavouringName><PayMode>NEFT</PayMode><AccountNo>00761050038891</AccountNo><IFSCCode>HDFC0000076</IFSCCode><BankName>HDFC BANK</BankName><payablelocation></payablelocation><IntstrNo></IntstrNo><InstrDate></InstrDate></Table></Dataset>");
  //buffer4.write("<Dataset><Table><Action /><UserID /><UserName /><Role /><Date /><Remarks /><Designation /></Table></Dataset>");

//      var  P_expXml =buffer.toString();
//     var P_AdvDetXmlData =buffer2.toString();
//     var P_PayDetXmlData =buffer3.toString();
//     var P_UserLogXml = buffer4.toString();

  P_AdvDetXmlData =
      "<Dataset><Table><PK_ID/><Select>N</Select><CostCenter/><TRNo/><AdvanceAmt/><AdjustedAmt/><BalanceAdv/><CurrentAdjustAmt/></Table></Dataset>";
  P_PayDetXmlData =
      "<Dataset><Table><Chk>Y</Chk><PayPKID>0</PayPKID><Select>true</Select><Amount>100.00</Amount><PayToID>10175</PayToID><FavouringName>VARADA CHARY S</FavouringName><PayMode>NEFT</PayMode><AccountNo>00761050038891</AccountNo><IFSCCode>HDFC0000076</IFSCCode><BankName>HDFC BANK</BankName><payablelocation></payablelocation><IntstrNo></IntstrNo><InstrDate></InstrDate></Table></Dataset>";
  P_UserLogXmlData =
      "<Dataset><Table><Action /><UserID /><UserName /><Role /><Date /><Remarks /><Designation /></Table></Dataset>";
  // var document = xml.parse(P_UserLogXml).toString();
  // print(document.toString());
  //print(document.toXmlString(pretty: true, indent: '\t'));

  print("Expense" + P_expXmlData.toString());
  print("Advance" + P_AdvDetXmlData.toString());
  print("paymanet" + P_PayDetXmlData.toString());
  print("paymanet" + P_UserLogXmlData.toString());

  // P_UserLogXml1 = utf8.encode((P_UserLogXml)).toString();
//  print(P_UserLogXml.toString());

  final P_expXmlData_encoded = base64.encode(utf8.encode(P_expXmlData));
  print('base641: $P_expXmlData_encoded');

  final P_AdvDetXml_encoded = base64.encode(utf8.encode(P_AdvDetXmlData));
  print('base642: $P_AdvDetXml_encoded');

  final P_PayDetXmlData_encoded = base64.encode(utf8.encode(P_PayDetXmlData));
  print('base643: $P_PayDetXmlData_encoded');

  final P_UserLogXml_encoded = base64.encode(utf8.encode(P_UserLogXmlData));
  print('base644: $P_UserLogXml_encoded');

//  final str2 = utf8.decode(base64.decode(encoded));
//  print(str2);
//  print(P_UserLogXml == str2);
print("Net Payble"+P_Totalsum.toString());
  var paramsJSONString = jsonEncode({
    "P_action": "I",
    "P_Company": "STFC",
    "P_unit": "AIBHO",
    "P_voucherno": "",
    "P_voucherDate": Val_V_StartDate,
    "P_TRStrtDate": Val_V_StartDate,
    "P_TREndDate": Val_V_EndDate,
    "P_TotAmount": P_Totalsum,
    "P_AdvAdjAmt": "0.0",
    "P_CreAdjAmt": "0.0",
    "P_NetPayable": P_Totalsum,
    "P_RecUnit": "",
    "P_RecieptMode": "",
    "P_GLCode": "",
    "P_InstruNo": "",
    "P_InstruDate": "",
    "P_InstBankName": "",
    "P_InstBnkBranch": "",
    "P_InstrAmt": "0.00",
    "P_UserRole": "NH",
    "P_UserDept": "ACCOUNTS",
    "P_ExpDetXmlData": P_expXmlData_encoded,
    "P_AdvDetXmlData": P_AdvDetXml_encoded,
    "P_PayDetXmlData": P_PayDetXmlData_encoded,
    "P_UserLogXml": P_UserLogXml_encoded,
    "P_Username": "VARADA CHARY S",
    "P_ComponentCode": "",
    "P_UserId": "stf10175",
    "P_SysDate": "",
    "P_bnkshrt": "",
    "P_UniqueCode": "",
    "P_VoucherType": "EMPTR",
    "P_VoucherstartTime": "02:39PM",
    "P_VoucherEndTime": "02:40PM",
    "P_AdvRequired": "Y",
    "P_WithTRNo": ""
  });

  String paramName = 'P_EncryptedData'; // give the post param a name
  String formBody = paramName + '=' + paramsJSONString;

  print('data5: $formBody');

  //var url ="http://10.0.1.112/MobileServiceLiveUat_Encrypt/MBService.asmx/MB_EmpExpBooking?";
  //var url ="http://10.0.1.112/JsonResultDemo/Home/MB_EmpExpBooking22?";
  var url = "http://115.113.27.9/JsonResultDemo/Home/MB_EmpExpBooking22?";

  final paramDic = {
    "P_EncryptedData": paramsJSONString,
  };
//
//  HttpClient httpClient = new HttpClient();
//  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url),);
//  request.headers.set('content-type', 'application/json');
//
//  request.add(utf8.encode(encryptedData));
//  HttpClientResponse response = await request.close();
//  // todo - you should check the response.statusCode
//  String reply = await response.transform(utf8.decoder).join();
//  httpClient.close();

  Map<String, String> requestHeaders = {
    'Content-type': 'application/json; charset=utf-8',
    'Accept': 'application/json',
  };

  final loginData = await http.post(
    url, // change with your API
    //headers:requestHeaders,
    body: paramDic,
  );

  // http://10.0.1.112/MobileServiceLiveUat_Encrypt/MBService.asmx

  print("C");

  print(loginData.statusCode);
  if (loginData.statusCode == 200) {
    try {
      print(loginData.body);
      var data = loginData.body.toString();

      data = data.replaceAll('<?xml version="1.0" encoding="utf-8"?>', '');
      //print("New String:"+data);
      data = data.replaceAll('<string xmlns="http://tempuri.org/">', '');
      //  print("New String1:"+data);
      //data = data.replaceAll('</string>','');
      print("New String2" + data);

      return UserData.fromJson(json.decode(loginData.body));
    } catch (e) {
      print(e.toString());
      //print(e.error);
      final error1 = {
        "TABLE0": [
          {
            "RESULT": "1002",
            "MESSAGE": e.toString(),
          }
        ]
      };
      print("encrypted" + jsonEncode(error1));
      return UserData.fromJson(json.decode(loginData.body));
    }
  } else {
    print("unkonwn error");
    throw Exception('Failed to load Data');
  }

  //return  e.toString();
}

Future<List<Exp_SubCategory_help>> CallSubCategory(
    String SubCategoryType) async {
  print(SubCategoryType);

  var P_SubCategoryXmlData = "";

  P_SubCategoryXmlData =
      "<Dataset><Table><pValue>%</pValue><ParamStr1>STFC</ParamStr1><ParamStr2>10175</ParamStr2><ParamStr3>EMPTR</ParamStr3><FltrColumn>ALL</FltrColumn><pgno>0</pgno><p_RecPerPage>100000</p_RecPerPage><ParamStr4></ParamStr4><ParamStr5></ParamStr5><ParamStr6></ParamStr6></Table></Dataset>";
  print("SubCategory" + P_SubCategoryXmlData.toString());

  final P_SubCategoryXmlData_encoded =
      base64.encode(utf8.encode(P_SubCategoryXmlData));
  print('SubCategory_Encoded: $P_SubCategoryXmlData_encoded');

  var paramsJSONString1 = jsonEncode({
    "P_ColumnName": "EXP_TrvSubcategory",
    "P_strXML": P_SubCategoryXmlData_encoded
  });

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
  if (response.statusCode == 200) {
    var responseJson = json.decode(response.body);

    return (responseJson['Table0'] as List)
        .map((p) => Exp_SubCategory_help.fromJson(p))
        .toList();
  } else if (response.statusCode == 502) {
    var responseJson = json.decode(response.body);
    return (responseJson);
    throw Exception('Connection timed out');
  } else {
    throw Exception('Failed to load SubCategory');
  }
}
