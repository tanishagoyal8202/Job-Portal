import 'dart:io';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_portal/screens/Comman/enteremail.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/CustomProgressLoader.dart';
import 'package:job_portal/screens/Provider/homepage_provider.dart';
import 'dart:convert';
import 'package:job_portal/screens/Provider/registration_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends StatefulWidget {
  @override
  LoginProviderFormState createState() {
    return LoginProviderFormState();
  }
}

class LoginProviderFormState extends State<LoginProvider> {
  bool obscureText = true, passwordVisible = false;
  var id;
  int _counter = 0;


  TextEditingController em = new TextEditingController();
  TextEditingController pass = new TextEditingController();
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
      /*for(var d in data['err']){
        print(" ${d}");
        setState(() {
          id=d['id'];

        });
      }*/
      id = data['id'].toString();
      print('$id');
      print('$err');
      print('RESPONCE_DATA : ' + status);
      CustomProgressLoader.cancelLoader(context);

      if (status == "1") {
        prefs.setString(Constants.loginStatus, "TRUE");
        prefs.setString(Constants.loginType, "Provider");
        prefs.setString(Constants.userId, id);
        Navigator.pushReplacement(
            context,
            new MaterialPageRoute(
                builder: (BuildContext context) => HomePageProvider()));

        Fluttertoast.showToast(
            msg: "Login Succesful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      }else if(status == "0"){
        Fluttertoast.showToast(
            msg: "Username and password is wrong",
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
    }else if (pass.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please Enter Password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.black26,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Map map = {"email": '${em.text}',
        "password":'${pass.text}'};
      apiRequest(Constants.loginProvider, map);
    }
  }
  void clickNavigation2(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => RegistrationProvider()));
  } void clickNavigation3(){
    Navigator.push(context,MaterialPageRoute(builder: (context) => EnterEmail()));
  }


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold
      (body: new SingleChildScrollView(child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/1.jpg"),
          fit: BoxFit.fill,
        ),
      ),
      child:new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:80 ,),
              child: Image.asset('login_logo1.png' ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70,left: 20,bottom: 10,right: 20),
              child: Card(
                //margin: EdgeInsets.all(20.0),
                //borderOnForeground: false,
                elevation: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(10.0),
                      child: new TextField(
                        controller: em,
                        textAlign: TextAlign.start,
                        maxLines: 1,
                        decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          hintText: 'john@gmail.com',
                          labelText: 'Email',
                        ),
                      ),
                    ),new Container(
                      margin: EdgeInsets.all(10.0),
                      child: new TextField(
                        textAlign: TextAlign.start,
                        obscureText: obscureText,
                        controller: pass,
                        maxLines: 1,
                        decoration: InputDecoration(
                          icon: Icon(Icons.lock),
                          hintText: 'Enter Password',
                          labelText: 'Password',
                          suffixIcon: IconButton(

                            icon: Icon(
                              // Based on passwordVisible state choose the icon
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black45,
                            ),
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                                if (passwordVisible == false) {
                                  obscureText = true;
                                } else if (passwordVisible == true) {
                                  obscureText = false;
                                }
                              }
                              );
                            },
                          ),
                        ),
                      ),
                      /*  child:TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'john@gmail.com',
                              labelText: 'Email',
                            ),

                            minLines: 1,
                            validator: validateEmail,
                          ),
                        ),
                        new Container(
                          margin: EdgeInsets.all(10.0),

                          child:TextFormField(
                            decoration: const InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Enter Password',
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            minLines: 1,
                            validator: (value) {
                              if (value.length <6) {
                                return 'minimum 6 letter';
                              }
                              return null;
                            },
                          ),*/

                    ),
                  ],
                ),

              ),
            ),
            /*decoration: new BoxDecoration(
                  border: Border.all(),
                  *//*borderRadius: ,*//*
                   *//* boxShadow: [
                      new BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4.0,
                      ),
                    ]),*/
            RaisedButton( elevation: 20,
              focusElevation: 100.0,
              hoverElevation: 100.0,
              color: Colors. cyan,
              onPressed: validation,
              child: Text('Submit',style: new TextStyle(
                fontSize: 17.0,
                color: Colors.white,

              ),
              ),
            ),
            Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    clickNavigation3();
                  },
                  child: Text("Forgot Password?",
                      style: TextStyle(
                          color: Color(0xFF5d74e3),
                          fontSize: 15.0,
                          fontFamily: "Poppins-Bold")),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,110.0,0.0,20.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "New User? ",
                    style: TextStyle(fontFamily: "Poppins-Medium",
                      fontSize: 15.0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      clickNavigation2();
                    },
                    child: Text("SignUp",
                        style: TextStyle(
                            color: Color(0xFF5d74e3),
                            fontSize: 15.0,
                            fontFamily: "Poppins-Bold")),
                  ),
                ],
              ),
            ),
          ]
      ),
    ),
    ),
    );
  }
}