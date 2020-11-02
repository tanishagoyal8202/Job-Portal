import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JobDetails extends StatefulWidget {
  @override
  _JobDetailsState createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  String reply = "";
  var result;
  SharedPreferences prefs;

  var isLoader =false;

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
      result =  data['result'];
      print(' $result');
      //String status = data['status'].toString();
      //for (var d in data['result']) {
      if (result != null) {
        setState(() {
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

  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      var id=prefs.getString(Constants.jobId);
      print('$id');
      Map map={"id": id} ;
      apiRequest(Constants.viewJobDetails, map);
    });
  }


  @override
  void initState() {

    super.initState();
    _incrementCounter();

  }


  @override
  Widget build(BuildContext context) {
    return isLoader?Center(child: CircularProgressIndicator(),): MaterialApp(
      title: 'Job Details',

      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: SingleChildScrollView(
          child:
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: new Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('${result["Job Title"]}' ,style: TextStyle(fontWeight:FontWeight.w400,fontSize: 25.0,color: Colors.cyan[800]),

                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('${result["Company"]}',style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                  Text(''),


                  Align(alignment: Alignment.topLeft,child: Text('${result["Location"]}',style: TextStyle(color: Colors.grey),)),
                  Align(alignment: Alignment.topLeft,child: Text('Salary       :  ${result["Salary"]}',style: TextStyle(color: Colors.grey),)),
                  Align(alignment: Alignment.topLeft,child: Text('Apply By   :  ${result["Last date to apply"]}',style: TextStyle(color: Colors.grey))),

                  Divider(
                    color: Colors.black,
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Text('${result["Job description"]}'
                    ),
                  ),
                  Text(''),
                  Align(alignment: Alignment.topLeft,child: Text('Skill(s) Required :${result["Skills required"]}',textAlign: TextAlign.left, )),
                  Text(''),
                  Align(alignment: Alignment.topLeft,child: Text('Experience :${result["Experience required"]}')),
                  Text(''),
                  Align(alignment: Alignment.topLeft,child: Text('Working Days :${result["Working days"]}')),
                  Text(''),
                  Align(alignment: Alignment.topLeft,child: Text('Working Hours :${result["Working hours"]}')),
                  Text(''),
                  RaisedButton(
                    color: Colors.cyan[600],
                    child: const Text('Apply',style:TextStyle(color: Colors.white)),
                    onPressed: (){

                    },
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}


