import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Comman/enterOTP.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/CustomProgressLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterEmail extends StatefulWidget {
  @override
  EnterEmailState createState() => EnterEmailState();
}

class EnterEmailState extends State<EnterEmail> {
  TextEditingController em = new TextEditingController();
  String reply="";

  Future<String> apiRequest(String url, Map jsonMap) async {
    try {
      CustomProgressLoader.showLoader(context);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // var isConnect = await ConnectionDetector.isConnected();
      // if (isConnect) {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();
      String err = data['err'].toString();

      print('$err');

      print('RESPONCE_DATA : ' + status);
      CustomProgressLoader.cancelLoader(context);

      if (status == "1") {
        prefs.setString(Constants.email, em.text);
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => EnterOtp())
        );

        Fluttertoast.showToast(
            msg: "OTP Sent",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if(status == "0"){
        Fluttertoast.showToast(
            msg: "Email is wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      } else if(status == "0"){
        Fluttertoast.showToast(
            msg: "Try Again Some Thing Is Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      else {
        CustomProgressLoader.cancelLoader(context);
        Fluttertoast.showToast(
            msg: "Please check your internet connection....!",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
        // ToastWrap.showToast("Please check your internet connection....!");
        // return response;
      }
    }
    catch (e) {
      CustomProgressLoader.cancelLoader(context);
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }
  validation() async {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (em.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter email",
          toastLength: Toast.LENGTH_SHORT,

          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if(!regex.hasMatch(em.text)){
      Fluttertoast.showToast(
          msg: "Please enter valid email",
          toastLength: Toast.LENGTH_SHORT,

          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else {
      Map map = {"email": '${em.text}'};
      apiRequest(Constants.getOtp, map);
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan[600],
        centerTitle: true,
        title: Text("Reset Password"),
        elevation: 10.0,

      ),
      body: Container(
        decoration: BoxDecoration(

        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0,0.0,8.0,0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: em,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Email"
                ),

                textAlign: TextAlign.start,
              ) ,

              RaisedButton(
                  color: Colors.cyan[400],
                  child: Text("Get OTP"),
                  onPressed:(){
                    validation();
                  }
              )
            ],
          ),
        ),
      ),
    );
  }

}