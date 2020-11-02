import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Comman/resetpage.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/CustomProgressLoader.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnterOtp extends StatefulWidget {
  @override
  EnterOtpState createState() => EnterOtpState();
}

class EnterOtpState extends State<EnterOtp> {
  String _otp = "";
  String reply="";
  String email="";
  var _otpSymbols = ["\u{25CB}","\u{25CB}","\u{25CB}","\u{25CB}","\u{25CB}"];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPreferences prefs;

  Future<String> apiRequest(String url, Map jsonMap) async {
    try {
      CustomProgressLoader.showLoader(context);
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


      print('RESPONCE_DATA : ' + status);
      CustomProgressLoader.cancelLoader(context);

      if (status == "1") {

        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => ResetPage())
        );

        Fluttertoast.showToast(
            msg: "Reset Password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if(status == "0"){
        Fluttertoast.showToast(
            msg: "Email Does not Exist",
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
  }
  Map map;
  _incrementCounter() async
  {
    prefs = await SharedPreferences.getInstance();

  }
  onclick(){
    setState(() {
      email=prefs.getString(Constants.email);
      print("$email");
      map={
        "email": email,
        "otp":_otp
      } ;
    });
    apiRequest(Constants.checkOtp, map);
  }

  void _handleKeypadClick(String val) {
    setState(() {
      if (_otp.length < 5){
        _otp = _otp + val;
        for (int i=0; i < _otp.length; i++)
          _otpSymbols[i] = "\u{25CF}";
      }
    });
  }

  void _handleKeypadDel() {
    setState(() {
      if (_otp.length > 0) {
        _otp = _otp.substring(0,_otp.length - 1);
        for (int i = _otp.length; i < 5; i++)
          _otpSymbols[i] = "\u{25CB}";
      }
    });
  }

  void _handleSubmit() {
    if (_otp.length == 5){
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Entered OTP is $_otp'),
      ));
      onclick();}
    else
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('OTP has to be of 5 digits'),
        backgroundColor: Colors.red,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Reset Password"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <
                Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Enter the OTP received',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    _otpSymbols[0],
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    _otpSymbols[1],
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    _otpSymbols[2],
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    _otpSymbols[3],
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                  ),
                  Text(
                    _otpSymbols[4],
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w200),
                  )
                ],
              )
            ]),
            Container(
              color: Colors.blue[50],
              padding: EdgeInsets.only(top: 10),
              child: Column(

                  children: <Widget>[
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('1');
                            },
                            child: Text('1',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('2');
                            },
                            child: Text('2',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('3');
                            },
                            child: Text('3',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('4');
                            },
                            child: Text('4',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('5');
                            },
                            child: Text('5',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('6');
                            },
                            child: Text('6',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('7');
                            },
                            child: Text('7',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('8');
                            },
                            child: Text('8',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          ),
                          FlatButton(
                            onPressed: () {
                              _handleKeypadClick('9');
                            },
                            child: Text('9',
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                    Container(

                      margin: const EdgeInsets.only(bottom: 10.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {
                                _handleKeypadDel();
                              },
                              child: Text('\u{232b}',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            ),
                            FlatButton(
                              onPressed: () {
                                _handleKeypadClick('0');
                              },
                              child: Text('0',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            ),
                            FlatButton(
                              onPressed: () {
                                _handleSubmit();
                              },
                              child: Text('\u{2713}',
                                  style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400)),
                            )
                          ]),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );


  }
}