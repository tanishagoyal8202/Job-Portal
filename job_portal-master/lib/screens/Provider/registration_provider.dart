import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:job_portal/screens/Provider/login_provider.dart';
import 'package:job_portal/screens/CustomProgressLoader.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:shared_preferences/shared_preferences.dart';
/*import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';*/

class RegistrationProvider extends StatefulWidget {
  @override
  RegistrationProviderFormState createState() {
    return RegistrationProviderFormState();
  }
}

class RegistrationProviderFormState extends State<RegistrationProvider> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController password = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController companyName = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController phone = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
  TextEditingController cvi = new TextEditingController();

  TextEditingController email = new TextEditingController();
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
            new MaterialPageRoute(builder: (BuildContext context) => LoginProvider()));
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

  /* Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }*/
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
    else if (companyName.text.isEmpty) {
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
    }else if (cvi.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter company verification ID",
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
        "company": '${companyName.text}',
        "address": '${address.text}',
        "phno": '${phone.text}',
        "mobile": '${mobile.text}',
        "registration_no": '${cvi.text}',
        "email": '${email.text}',
        "password": '${password.text}'
      };
      apiRequest(Constants.signUpProvider, map);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
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
              child:TextFormField(
                controller: name,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'John Cena',
                  labelText: 'Name',
                ),
                minLines: 1,
                validator:(value) {
                  if (value.isEmpty) {
                    return 'Please Enter Name';
                  }
                  return null;
                },
              ),
            ),
            new Container(

              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                controller: companyName,
                decoration: const InputDecoration(
                  icon: Icon(Icons.business),
                  hintText: 'ABCD',
                  labelText: 'Company Name',
                ),
                minLines: 1,
                validator:(value) {
                  if (value.isEmpty) {
                    return 'Please Enter Company Name';
                  }
                  return null;
                },
              ),
            ),new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                controller: address,
                decoration: const InputDecoration(
                  icon: Icon(Icons.location_on),
                  hintText: '250, Vishnupuri colony..',
                  labelText: 'Address',
                ),
                minLines: 1,
                validator:(value) {
                  if (value.isEmpty) {
                    return 'Please Enter phone number';
                  }
                  return null;
                },

              ),
            ),
            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                controller: phone,
                decoration: const InputDecoration(
                  icon: Icon(Icons.local_phone),
                  hintText: '9713222232',
                  labelText: 'Phone No.',
                ),
                minLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter phone number';
                  }
                  return null;
                },
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),
              child:TextFormField(
                controller: mobile,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_iphone),
                  hintText: '9898989898',
                  labelText: 'Mobile No.',
                ),
                minLines: 1,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter phone number';
                  }
                  return null;
                },
              ),
            ),  new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                controller: cvi,
                decoration: const InputDecoration(
                  icon: Icon(Icons.business),
                  hintText: 'SIN-no.,TIN',
                  labelText: 'Company Verification Id',
                ),
                minLines: 1,

              ),
            ),  new Container(
              margin: EdgeInsets.all(10.0),
              child:TextField(
                controller: email,
                decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  hintText: 'john@gmail.com',
                  labelText: 'Email',
                ),
                minLines: 1,

              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Enter Password',
                  labelText: 'Password',
                ),
                controller: password,
                obscureText: true,
                minLines: 1,
              ),
            ),

            new Container(
              margin: EdgeInsets.all(10.0),

              child:TextField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: 'Enter Password',
                  labelText: 'Confirm Password',
                ),
                obscureText: true,
                minLines: 1,

              ),
            ),
            new Container(
              child:new Padding(
                padding:EdgeInsets.all(5.0),
                child: RaisedButton(
                  color: Colors.red[300],
                  onPressed: validation,
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