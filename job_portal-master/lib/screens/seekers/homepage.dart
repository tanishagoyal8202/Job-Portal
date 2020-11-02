import 'dart:convert';
import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/seekers/jobs.dart';
import 'package:job_portal/screens/seekers/more.dart';
import 'package:job_portal/screens/seekers/myapplication.dart';
import 'package:job_portal/screens/seekers/preferences.dart';
import 'package:job_portal/screens/seekers/resume.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constantss.dart';

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Jobs", Icons.home),
    new DrawerItem("My Preferences", Icons.playlist_add_check),
    new DrawerItem("My Application", Icons.check_circle),
    new DrawerItem("Upload Resume", Icons.insert_drive_file),
    new DrawerItem("More", Icons.more)

  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  var isLoader =false;
  String id;
  String reply = "";
  String name;
  String email;
  String mobile;
  SharedPreferences prefs;
  Future<String> apiRequest(String url , Map jsonMap) async {
    try {
      setState(() {
        isLoader=true;
      });
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type' , 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      //you should check the response.statusCode
      reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      var result =  data['result'];
      print(' $result');
      //String status = data['status'].toString();
      //for (var d in data['result']) {
      if (result != null) {
        setState(() {
          name = result['name'];
          mobile=result['mobile'];
          email=result['email'];
          isLoader=false;
        }
        );

      }
      else {
        setState(() {
          isLoader=false;

        }
        );

      }
    }

    catch (e) {
      setState(() {
        isLoader=false;

      });
      print(e);
      Fluttertoast.showToast(
          msg: e.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return reply;
    }
  }
  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      id=prefs.getString(Constants.userId);
      print('$id');
      Map map={"id": id} ;
      apiRequest(Constants.seekerProfile, map);
    });
  }


  @override
  void initState() {

    super.initState();
    _incrementCounter();

  }

  int _selectedDrawerIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MyApp();
      case 1:
        return new MyPreferences();
      case 2:
        return new MyApplications();
      case 3:
        return new Resume();
      case 4:
        return new More();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.cyan[600],
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                // Box decoration takes a gradient
                gradient: LinearGradient(
                  // Where the linear gradient begins and ends
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  // Add one stop for each color. Stops should increase from 0 to 1
                  stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    // Colors are easy thanks to Flutter's Colors class.
                    Colors.cyan[800],
                    Colors.cyan[400],
                    Colors.cyan,
                    Colors.cyanAccent,
                  ],
                ),
              ),
              accountName: new Text("$name",style: TextStyle(color: Colors.black),),
              accountEmail: new Text('$email',style: TextStyle(color: Colors.black),),

              currentAccountPicture: CircleAvatar(


              ),
            ),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}