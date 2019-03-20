import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_app/AsynkTask/fetchdata.dart';
import 'package:flutter_app/Class/BoookingStatefullWidget.dart';
import 'package:flutter_app/Class/userdata.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as Img;

import 'dart:math' as Math;

//void main() => runApp();

class MyJsonData extends StatefulWidget {
  //final Future<Post> post;
  final Future<UserData> userdata;

  MyJsonData({Key key, this.userdata}) : super(key: key);

  //MyJsonData({Key key, this.post}): super(key: key);

  @override
  _MyJsondataFetch createState() => new _MyJsondataFetch();
}

class _MyJsondataFetch extends State<MyJsonData> {

   Future<UserData> userdata;
   File _image,_image1;
   TextEditingController cTitle = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: MaterialApp(
          title: 'fetch data',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(
                title: Text("Fetch Data"),
              ),
              body: Stack(children: <Widget>[
                Center(
                  child: FutureBuilder<UserData>(
                    future: callWebServiceForLofinUser1("", BookingPage1.expensesDataList),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                         // return Text(snapshot.data.password +
                        print("try again1");
                          return new Text('Retry again !');
                        case ConnectionState.waiting:
                          return new Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(16.0),
                              child:
                               new CircularProgressIndicator()
                          );
                          case ConnectionState.done:
                            if (snapshot.hasData) {
                              return Text(snapshot.data.result +
                                  "\n" +
                                  snapshot.data.Hdr_fk);
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
                       // return Text(snapshot.data.password);
                          },
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[

                      new SizedBox(
                          child: new Container(
                            width: 125.0,
                            height: 125.0,
                            alignment: Alignment.center,
                            child: _image == null
                                ? Text('No image selected.')
                                : Image.file(_image),
                          )),
                      TextField(
                        controller: cTitle,
                        decoration:new InputDecoration(
                          hintText: "Title",
                        ),
                      ),


                      Row(

                        children: <Widget>[
                          RaisedButton(
                            child: Icon(Icons.image),
                            onPressed: getImageGallery,
                          ),
                          RaisedButton(
                            child: Icon(Icons.camera_alt),
                            onPressed: getImageCamera,
                          ),
                          Expanded(child: Container(),),
                          RaisedButton(
                            child: Icon(Icons.cloud_upload),
                            onPressed:(){
                              _upload(_image);
                            },
                          ),
                          RaisedButton(

                            child: Icon(Icons.file_download),
                            onPressed:(){
                              _Download();
                            },
                          ),

                        ],
                      ),
                      new SizedBox(
                          child: new Container(
                            width: 125.0,
                            height: 125.0,
                            alignment: Alignment.center,
                            child: _image1 == null
                                ? Text('No image selected.')
                                : Image.file(_image1),
                          )),
                    ],
                  ),
                ),


              ]))),
    );
  }


  Future getCamera(BuildContext context) async {
   // Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      //_image = image;
      print(image.path);
    // upload1(File(image.path));
      //uploadImageWithhttp(File(image.path));
     // Upload2(File(image.path));
      _upload(File(image.path));
    });
  }


  upload10(File imageFile) async {
    // open a bytestream
    var stream =
    new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    //var uri = Uri.parse("http://ip:8082/composer/predict");

    var uri = Uri.parse("http://10.0.1.112/JsonResultDemo/UploadFile/uploadfile?");
    //var uri = Uri.parse("http://115.113.27.9/JsonResultDemo/UploadFile/uploadfile?");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path),);

    // add file to multipart
    request.files.add(multipartFile);

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  // 'FileName': imageFile != null ? base64Encode(imageFile.readAsBytesSync()) : '',
   uploadImageWithhttp(File imageFile) async {

    print(base64Encode(imageFile.readAsBytesSync()));
     var postBody= jsonEncode({
       "value": "1000123",
         "vouchertype": "TS",
       'FileName': imageFile != null ? base64Encode(imageFile.readAsBytesSync()) : '',
     });

    var imagedata= base64.encode(utf8.encode(imageFile.toString()));

    var paramsJSONString1 = jsonEncode({
      "value": "1000123",
      "vouchertype": "TS",
      "FileName": imagedata ,
    });

    String paramName = 'P_EncryptedData'; // give the post param a name
    String formBody = paramName + '=' + paramsJSONString1;

    final paramDic = {
      "P_EncryptedData": paramsJSONString1,
    };

     //var uri = Uri.parse("http://115.113.27.9/JsonResultDemo/UploadFile/uploadfile?");
     var url = Uri.parse("http://10.0.1.112/JsonResultDemo/Home/uploadfile?");

    http.Response response = await http.post(
      url, // change with your API
      //headers:requestHeaders,
      body: paramDic,
    );




     print(response.body);
     final responseJson = json.decode(response.body);

     print(responseJson);
   }



   upload1(File imageFile) async {
     // to byte stream
     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));

     // get length for http post
     var length = await imageFile.length();

     // string to uri
     var uri = Uri.parse("http://10.0.1.112/JsonResultDemo/UploadFile/uploadfile");

     // new multipart request
     var request = new http.MultipartRequest("POST", uri);

     // if you want more data in the request
     request.fields['vouchertype'] = 'ts';
     request.fields['value'] = '123';

     var multipartFile = new http.MultipartFile('file', stream, length,
         filename: basename(imageFile.path),
         contentType: new MediaType('image', 'png'));

     // add multipart form to request
     request.files.add(multipartFile);

     // send request
     var response = await request.send();

     if (response.statusCode == "200") {
       // do something on success
       print(response);
     }

   }


   Upload2(File imageFile) async {
     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
     var length = await imageFile.length();
     var uploadURL = "http://10.0.1.112/JsonResultDemo/Home/uploadfile?";
     var uri = Uri.parse(uploadURL);

     var request = new http.MultipartRequest("POST", uri);

     var multipartFile = new http.MultipartFile('file', stream, length,
         filename: basename(imageFile.path));
     //contentType: new MediaType('image', 'png'));
     request.fields['P_EncryptedData'] = 'vilas';
     request.files.add(multipartFile);

     var response = await request.send();
     print(response.statusCode);
     response.stream.transform(utf8.decoder).listen((value) {
       print(value);
     });
   }

   Future getImageGallery() async{
     var imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

     final tempDir =await getTemporaryDirectory();
     final path = tempDir.path;

     int rand= new Math.Random().nextInt(100000);

     Img.Image image= Img.decodeImage(imageFile.readAsBytesSync());
     Img.Image smallerImg = Img.copyResize(image, 500);

     var compressImg= new File("$path/image_$rand.jpg")
       ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));


     setState(() {
       _image = compressImg;
     });
   }


   Future getImageCamera() async{
     var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);

     final tempDir =await getTemporaryDirectory();
     final path = tempDir.path;

     int rand= new Math.Random().nextInt(100000);

     Img.Image image= Img.decodeImage(imageFile.readAsBytesSync());
     Img.Image smallerImg = Img.copyResize(image, 500);

     var compressImg= new File("$path/image_$rand.jpg")
       ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));


     setState(() {
       _image = compressImg;
     });
   }


//   Future upload(File imageFile) async{
//     var stream= new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
//     var length= await imageFile.length();
//     var uri = Uri.parse("http://10.0.1.112/JsonResultDemo/Home/uploadfile?");
//
//     var request = new http.MultipartRequest("POST", uri);
//
//     var multipartFile = new http.MultipartFile("image", stream, length, filename: basename(imageFile.path));
//     request.fields['title'] = cTitle.text;
//     request.files.add(multipartFile);
//
//     var response = await request.send();
//
//     if(response.statusCode==200){
//       print("Image Uploaded");
//     }else{
//       print("Upload Failed");
//     }
//     response.stream.transform(utf8.decoder).listen((value) {
//       print(value);
//     });
//   }


   Future _upload(File imageFile) async {

     if (imageFile == null) return;
     String base64Image = base64Encode((imageFile.readAsBytesSync()));
     print(base64Image);
     print (imageFile.path);
     String fileName = imageFile.path.split("/").last;


    print(fileName);
     print("length:"+imageFile.lengthSync().toString());
   //  var uri = Uri.parse("http://10.0.1.112/JsonResultDemo/Home/uploadfile?");
    // var url = "http://115.113.27.9/JsonResultDemo/Home/uploadfile?";
     //var url = "http://10.0.1.112/JsonResultDemo/Home/uploadfile?";
     var url = "http://115.113.27.9/JsonResultDemo/Home/uploadfile?";

     var paramsJSONString1 = jsonEncode({
       "image": base64Image,
       "filename": fileName,
       "filepath": imageFile.path,
     });

     final paramDic = {
       "P_EncryptedData": paramsJSONString1,
     };



     http.Response response = await http.post(
       url, // change with your API
       //headers:requestHeaders,
       body: paramDic,
     );



     await http.post(url,
         body: paramDic).then((res) {
       print(res.statusCode);
       if(res.statusCode==200){
         print("Image Uploaded");
       }else{
         print("Upload Failed");
       }
     }).catchError((err) {
       print(err);
     });
   }



  Future _Download() async
  {
    String iImageID= "2415";
   // var url = "http://10.0.1.112/JsonResultDemo/Down/Downloadfile?";
    var url = "http://115.113.27.9/JsonResultDemo/Down/Downloadfile?";

    var paramsJSONString1 = jsonEncode({
      "iImageID": iImageID,
    });

    final paramDic = {
      "P_EncryptedData": paramsJSONString1,
    };



//    http.Response response = await http.post(
//      url, // change with your API
//      //headers:requestHeaders,
//      body: paramDic,
//    );


//    http.Response response = await http.post(
//      url, // change with your API
//      //headers:requestHeaders,
//      body: paramDic,
//    );

    await http.post(url,
        body: paramDic).then((res)  async {

      print(res.statusCode);
      if(res.statusCode==200){
        print(res.bodyBytes);


        //Directory tempDir = await getTemporaryDirectory();
        Directory appDocDir = await getApplicationDocumentsDirectory();
        String tempPath = appDocDir.path;
        print(tempPath);

      // File file = new File('$tempPath/my_file.jpg');
        File file = new File('$tempPath/${DateTime.now().toUtc().toIso8601String()}.jpg');


      //  File file = new File('$tempPath/my_file.png');
        print("genrated $file");

//        Future<void> writeToFile(ByteData data, String path) {
//          final buffer = data.buffer;
//          return new File(path).writeAsBytes(
//              buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
//        }
        final buffer = res.bodyBytes.buffer;
        await  file.writeAsBytes(buffer.asUint8List(res.bodyBytes.offsetInBytes,res.bodyBytes.lengthInBytes));
        //await file.writeAsBytes(res.bodyBytes);
        //  displayImage(file);
        setState(() {
          _image1=file;
        });


//      var  _base64 = base64Encode(response.bodyBytes);
//        Uint8List bytes = base64.decode(_base64);
//        print("after decoes :$bytes");
//        //getting path for saving
//        Directory appDocDir =  await getApplicationDocumentsDirectory();
//        print(appDocDir);
//        String appDocPath = appDocDir.path;
//        print(appDocPath);
//        new File('$appDocPath/my_file.jpg').writeAsStringSync('myVar: $bytes');
        print("Image Downloaded");
      }else{
        print("Downloaded Failed");
      }
    }).catchError((err) {
      print(err);
    });

// getting a directory path for saving
     // print(response.statusCode);
      //if(response.statusCode==200){
      //  print(response.bodyBytes);

//        Directory tempDir = await getTemporaryDirectory();
//        String tempPath = tempDir.path;
//        print(tempPath);
//        File file = new File('$tempPath/my_file.jpg');
//        print(file);
//        await file.writeAsBytes(response.bodyBytes);

       // Directory appDocDir = await getApplicationDocumentsDirectory();
       // Directory appDocDir = await getTemporaryDirectory();
      //  print(appDocDir);
      //  String appDocPath = appDocDir.path;
       // print(appDocPath);

       // File file = new File('$appDocPath/${DateTime.now().toUtc().toIso8601String()}.jpg');

     //   File file =new File('$appDocPath/my_file1.jpg');
       // print(file);
      //  await file.writeAsBytesSync(response.bodyBytes);


//        File newImage = await file.copy('$appDocPath/${DateTime.now().toUtc().toIso8601String()}.png');
//
//        print("ne file : $newImage");
      //  print("file converted");

        //  displayImage(file);
        //setState(() {
       //   _image1=file;
        //});


//      var  _base64 = base64Encode(response.bodyBytes);
//        Uint8List bytes = base64.decode(_base64);
//        print("after decoes :$bytes");
//        //getting path for saving
//        Directory appDocDir =  await getApplicationDocumentsDirectory();
//        print(appDocDir);
//        String appDocPath = appDocDir.path;
//        print(appDocPath);
//        new File('$appDocPath/my_file.jpg').writeAsStringSync('myVar: $bytes');
       // print("Image Downloaded");
     // }//else{
     //   print("Downloaded Failed");
     // }



  }
}





