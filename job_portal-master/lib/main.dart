import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/Provider/homepage_provider.dart';
import 'package:job_portal/screens/onboarding.dart';
import 'package:job_portal/screens/seekers/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(new MaterialApp(
  theme:
  ThemeData(primaryColor: Colors.blueGrey),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
)
);
class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  String loginStatus="FALSE";
  String loginType="Seeker";
  void initState(){
    super.initState();
    _incrementCounter();

  }
  _incrementCounter() async {
    var _duration = new Duration(seconds: 2);
    return new Timer( _duration,navigationPage);
  }
  Future navigationPage() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      loginStatus = prefs.getString(Constants.loginStatus);
      loginType = prefs.getString(Constants.loginType);
    });
    if (loginStatus=="TRUE"){
      if(loginType=="Provider"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePageProvider()));}
      else if(loginType=="Seeker"){
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => HomePage()));}

    }
    else {
      Timer(Duration(seconds: 2),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => OnBoarding())));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.cyan[400]),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /*CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25.0,
                      child: Image(image: AssetImage("assets/123.png"),
                      ) *//*Icon(
                        Icons.explore,
                        color: Colors.blueGrey,
                        size: 40.0,
                      ),*//*
                    ),*/
                    Container(
                        width: 200.0,
                        height: 200.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/123.png"),
                            )
                        )
                    ),

                    Padding(padding: EdgeInsets.only(top: 10.0),
                    ),
                    Text(
                      "JOB-SHOP",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Happy Job searching! " ,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,

                        )),Padding(
                      padding: EdgeInsets.only(top: 5.0),
                    ),Text("Best place to get hired And to hire best suitable candidates at as well" ,textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}