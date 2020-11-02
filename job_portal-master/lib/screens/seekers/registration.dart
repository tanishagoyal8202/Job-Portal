import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:job_portal/screens/seekers/login.dart';

import '../CustomProgressLoader.dart';
/*import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';*/

class Registration extends StatefulWidget {
  @override
  RegistrationFormState createState() {
    return RegistrationFormState();
  }



}

class RegistrationFormState extends State<Registration> {

  TextEditingController name = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController currentIndustry = new TextEditingController();
  TextEditingController qualification = new TextEditingController();
  TextEditingController annualSalary = new TextEditingController();


  String reply;


  Future<String> apiRequest(String url, Map jsonMap) async {
    try {
      CustomProgressLoader.showLoader(context);

      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      // todo - you should check the response.statusCode
      var reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      Map data = json.decode(reply);
      String status = data['status'].toString();

      print('RESPONCE_DATA : ' + status);

      CustomProgressLoader.cancelLoader(context);

      if (status == "1") {
        Fluttertoast.showToast(
            msg: "Successfully Register",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            backgroundColor: Colors.grey,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.push(  context,
            new MaterialPageRoute(builder: (BuildContext context) => LoginSeeker()));
        return reply;
      } else  {
        Fluttertoast.showToast(
            msg: "Try Again ,Some Thing Went Wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,

            backgroundColor: Colors.black26,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
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

  Future validation() async {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);

    if (name.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (qualification.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter Company Name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (address.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter address",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (email.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (gender.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (!regex.hasMatch(email.text)) {
      Fluttertoast.showToast(
          msg: "Please enter valid email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (mobile.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter mobile no",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (mobile.text.length != 10) {
      Fluttertoast.showToast(
          msg: "Please enter 10 digit mobile no",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (password.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (password.text.length < 6) {
      Fluttertoast.showToast(
          msg: "Password atleast 6 character",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Map map = {
        "name": '${name.text}',
        "gender": '${gender.text}',
        "address": '${address.text}',
        "current_industry": '${currentIndustry.text}',
        "mobile": '${mobile.text}',
        "annual_salary": '${annualSalary.text}',
        "email": '${email.text}',
        "password": '${password.text}',
        "qualification": '${qualification.text}'
      };
      apiRequest(Constants.signUpSeeker, map);
    }
  }

  /*Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }*/
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(

      appBar: AppBar( backgroundColor: Colors.cyan[800],
        title: new Text("Registration"),
        centerTitle: true,
      ),
      body:
      SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            /*new Container(
              child:new
              Padding(
                padding:EdgeInsets.all(10.0),
                child: RaisedButton(
                  color: Colors.red[200],
                  onPressed: getImage,
                  child: Text('Image Picker',style: new TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),),
                ),
              ),
              alignment: Alignment(0.0, 0.0),

            ),*/
            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'John Cena',
                  labelText: 'Name',
                ),
                minLines: 1,
                controller: name,
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.wc),
                  hintText: 'male',
                  labelText: 'Gender',
                ),
                minLines: 1,
                controller: gender,
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'john@gmail.com',
                  labelText: 'Email',
                ),
                minLines: 1,
                controller: email,
              ),
            ),  new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_on),
                  hintText: '19,Vishnupuri',
                  labelText: 'Address',
                ),
                minLines: 1,
                controller: address,

              ),
            ),  new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_android),
                  hintText: '9977238308',
                  labelText: 'Mobile No',
                ),
                minLines: 1,
                controller: mobile,
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.business),
                  hintText: 'eg- IT',
                  labelText: 'Current Industry',
                ),
                controller: currentIndustry,
                minLines: 1,

              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.school),
                  hintText: 'eg- B.Tech',
                  labelText: 'Qualification',
                ),
                controller: qualification,
                minLines: 1,

              ),
            ),
            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  hintText: 'eg- 5 lakh',
                  labelText: 'Annual Salary',
                ),
                controller: annualSalary,
                minLines: 1,

              ),
            ),

            new Container(
              child:new Padding(
                padding:EdgeInsets.all(5.0),
                child: RaisedButton(
                  color: Colors.red[300],
                  onPressed:validation ,
                  child: Text('Register ',style: new TextStyle(fontSize: 17.0,
                    color: Colors.white,
                  ),
                  ),
                ),
              ),
              alignment: Alignment(0.0, 0.0),

            ),
          ],
        ),
      ),
    );
  }
}