import 'package:job_portal/screens/Comman/contactus.dart';
import 'package:job_portal/screens/Comman/privacypolicy.dart';
import 'package:job_portal/screens/Comman/resetpage.dart';
import 'package:job_portal/screens/Comman/t&c.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/choose.dart';
import 'package:job_portal/screens/seekers/help.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class More extends StatefulWidget {
  @override
  MoreState createState() {
    return MoreState();
  }
}

// ignore: camel_case_types
class MoreState extends State<More> {
  SharedPreferences prefs;
  void showContent() {
    showDialog<Null>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Log out'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text('Are you sure you want to log out?'),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text('Log out'),
              onPressed: _logoutClick,
            ),
          ],
        );
      },
    );
  }
  void _logoutClick() {
    setState(() {

      prefs.setString(Constants.loginStatus,"FALSE");
    });
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
        Choose()), (Route<dynamic> route) => false);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _incrementCounter();
  }

  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'More',
        debugShowCheckedModeBanner:false,
        home: Scaffold(
          body: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.help_outline),
                title: Text('Help'),
                onTap: () {
                  Navigator.push(context,new MaterialPageRoute(
                      builder: (BuildContext context) => JSHelp()));
                },
              ),
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text('Terms & Conditions'),
                onTap: () {
                  Navigator.push(context,new MaterialPageRoute(
                      builder: (BuildContext context) => TermsAndConditions()));
                },
              ),
              ListTile(
                leading: Icon(Icons.copyright),
                title: Text('Privacy Policy'),
                onTap: () {
                  Navigator.push(context,new MaterialPageRoute(
                      builder: (BuildContext context) => PrivacyPolicy()));
                },
              ),
              ListTile(
                leading: Icon(Icons.lock_outline),
                title: Text('Reset Password'),
                onTap: () {
                  Navigator.push(context,new MaterialPageRoute(
                      builder: (BuildContext context) => ResetPage()));
                },
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.push(context,new MaterialPageRoute(
                      builder: (BuildContext context) => ContactUs()));
                },
              ),
              ListTile(
                leading: Icon(Icons.power_settings_new),
                title: Text('Log Out'),
                onTap: () {
                  showContent();
                },
              ),
            ],
          ),
        )
    );
  }
}
