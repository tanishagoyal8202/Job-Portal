import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/seekers/jobdetails.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: '',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(



        body: Center(child: SwipeList()));
  }
}

class SwipeList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListItemWidget();
  }
}
class ListItemWidget extends State<SwipeList> {
  var isLoader =false;
  String reply = "";
  var result;
  var id;
  SharedPreferences prefs;

  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<String> getData(String url ) async {
    try {
      setState(() {
        isLoader=true;

      });
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      // CustomProgressLoader.showLoader(context);
      //  var isConnect = await ConnectionDetector.isConnected();
      // if (isConnect) {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      request.headers.set('content-type' , 'application/json');
      // request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      //you should check the response.statusCode
      reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      result =  data['result'];

      if(result!=null){

        setState(() {
          isLoader=false;
        });
      }


    }

    catch (e) {
      setState(() {
        isLoader=false;

      });
      // CustomProgressLoader.cancelLoader(context);
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

  @override
  void initState() {
    super.initState();
    this.getData(Constants.viewJobs);
    _incrementCounter();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body:Container(

        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.2, 0.4, 0.6, 0.8],
            colors: [
              // Colors are easy thanks to Flutter's Colors class.
              Colors.grey[300],
              Colors.grey[400],
              Colors.grey,
              Colors.grey[800],
            ],
          ),
        ),

        child:
        isLoader?Center(child: CircularProgressIndicator(),):ListView.builder(

          itemCount: result == null ? 0 : result.length,
          itemBuilder: (BuildContext context, int index) {
            return new  Card(
              elevation: 10,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("${result[index]["Job Title"]}",style: TextStyle(
                          fontSize: 20,
                          color: Colors.cyan[600],
                        ),
                          textAlign: TextAlign.left,),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Place                  :${result[index]["Location"]}",style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text("Category            :${result[index]["Category"]}",style: TextStyle(
                          fontSize:15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Text("Status                 :${result[index]["Status"]}",style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Text("Skills Required  :${result[index]["Skills required"]}",style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Text("Apply By             :${result[index]["Last date to apply"]}",style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Divider( thickness: .9,
                            color: Colors.black
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom:5.0),
                          child: Align(
                              alignment: Alignment.bottomRight,
                              child:
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: FlatButton(
                                  color: Colors.cyan,
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  splashColor: Colors.cyanAccent,
                                  onPressed: () {
                                    setState(() {
                                      id= result[index]["_id"];

                                    });
                                    prefs.setString(Constants.jobId, id);
                                    Navigator.push(context,new MaterialPageRoute(
                                        builder: (BuildContext context) => JobDetails()));
                                  },
                                  child: Text(
                                    "View Details",
                                    style: TextStyle(fontSize: 10.0),
                                  ),
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}