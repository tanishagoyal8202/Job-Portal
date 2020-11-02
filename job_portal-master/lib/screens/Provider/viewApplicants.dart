import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ViewApplicants extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ViewApplicantsState();
  }
}

class ViewApplicantsState extends State<ViewApplicants> {
  var result;
  SharedPreferences prefs;var isLoader =false;
  String reply = "";
  String id;

  Future<String> getData(String url,jsonMap ) async {
    try {
      setState(() {
        isLoader=true;

      });
      //SharedPreferences prefs = await SharedPreferences.getInstance();
      // CustomProgressLoader.showLoader(context);
      //  var isConnect = await ConnectionDetector.isConnected();
      // if (isConnect) {
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
      if(result!=null){
        print("$result");
        print("$result.length");
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
    // TODO: implement initState
    super.initState();
    _incrementCounter();

  } _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      id=prefs.getString(Constants.jobId);
      print("$id");
      Map map={"id": id} ;
      this.getData(Constants.viewApplicants,map);
    });}

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 20,
        backgroundColor: Colors.cyan[600],
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Container(
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
                        Text("${result[index]["name"]}",style: TextStyle(
                          fontSize: 20,
                          color: Colors.cyan[600],
                        ),
                          textAlign: TextAlign.left,),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0),
                          child: Text("Email                          :${result[index]["email"]}",style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                          ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text("Address                     :${result[index]["address"]}",style: TextStyle(
                          fontSize:15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Text("Mobile No.                :${result[index]["mobile"]}",style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Text("Current Industry       :${result[index]["current_industry"]}",style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Text("Qualification  :${result[index]["qualification"]}",style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                          textAlign: TextAlign.left,),
                        Divider( thickness: .9,
                            color: Colors.black
                        ),

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