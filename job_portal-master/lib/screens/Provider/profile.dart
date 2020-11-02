import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:job_portal/screens/Constantss.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import '../Constantss.dart';


bool _isEnabled = false;
bool _canShowButton = false;
bool _canShow= true;
bool _showCamera=false;
// Create a Form widget.

class MyProfile extends StatefulWidget {
  @override
  MyProfileState createState() {
    return MyProfileState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyProfileState extends State<MyProfile> {
  File _pickedImage;

  void _pickImage() async {
    final imageSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Select the image source"),
              actions: <Widget>[
                MaterialButton(
                  child: Text("Camera"),
                  onPressed: () => Navigator.pop(context, ImageSource.camera),
                ),
                MaterialButton(
                  child: Text("Gallery"),
                  onPressed: () => Navigator.pop(context, ImageSource.gallery),
                )
              ],
            )
    );

    if(imageSource != null) {
      final file = await ImagePicker.pickImage(source: imageSource);
      if(file != null) {
        setState(() => _pickedImage = file);
      }
    }
  }

  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
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
      var result1 =  data['result'];
      var result = result1['prodata'];
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
    return reply;
  }
  _incrementCounter() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      id=prefs.getString(Constants.userId);
      print('$id');
      Map map={"id": id} ;
      apiRequest(Constants.providerProfile, map);
    });
  }


  @override
  void initState() {

    super.initState();
    _incrementCounter();

  }

  void tapping(){

    setState(() {
      _isEnabled = ! _isEnabled;
      _canShowButton = !_canShowButton;
      _canShow=! _canShow;
      _showCamera=! _showCamera;
    }
    );
  }/*void tappings(){

    setState(() {
      _isEnabled = ! _isEnabled;
      _canShowButton = !_canShowButton;
      _canShow=! _canShow;
      _showCamera=! _showCamera;
    }
    );
  }*/
  // TextEditingController _textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: Colors.cyan[600],
                title: Text("Profile"),
                centerTitle: true,
                leading: IconButton(icon:Icon(Icons.arrow_back),
                  onPressed:() => Navigator.pop(context, false),
                ),
                actions: <Widget>[
                  _canShow
                      ? IconButton(
                    icon:Icon(Icons.mode_edit),
                    onPressed: () {
                      tapping();
                    },
                  ):SizedBox(),

                  _canShowButton
                      ? IconButton(
                    icon:Icon(Icons.save),
                    onPressed: () {
                      tapping();
                    },
                  ):SizedBox(),
                ]
            ),

            body: isLoader?Center(child: CircularProgressIndicator(),):Material(

              child: SingleChildScrollView(
                child: Container(
                  padding:EdgeInsets.all(25.0),
                  margin: EdgeInsets.only(bottom: 15.0),
                  child:Column(
                      children:<Widget>[
                        Row(
                            children: <Widget>[

                              Padding(
                                  padding: const EdgeInsets.only(left:50.0),
                                  child:
                                  _pickedImage == null ?
                                  Container(
                                      width: 170.0,
                                      height: 170.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage("assets/rose.jpg"),
                                          )
                                      )
                                  ):
                                  Container(
                                      width: 170.0,
                                      height: 170.0,
                                      decoration: new BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: FileImage(_pickedImage),
                                          )
                                      )
                                  )
                                // Image(image: FileImage(_pickedImage))
                              ),
                              _showCamera
                                  ? IconButton(
                                icon:Icon(Icons.photo_camera),
                                onPressed: (){
                                  _pickImage();
                                },

                              ):SizedBox(),
                            ]
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top:10.0,
                            bottom: 10.0,
                          ),
                          child: ListTile(
                            title:new TextFormField(

                                initialValue:name,
                                enabled: _isEnabled,
                                decoration: InputDecoration(
                                  hintText: "User name",
                                ),
                                onChanged:(String string){
                                  setState(() {
                                  });
                                }
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top:10.0,
                            bottom: 10.0,
                            left:14.0,
                            right: 14.0,
                          ),
                          child: TextFormField(
                              initialValue: email,
                              enabled: _isEnabled,
                              decoration:InputDecoration(
                                hintText: "User email",
                              ),
                              onChanged:(String string){
                                setState((){});}),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top:10.0,
                            bottom:10.0,
                            left:14.0,
                            right: 14.0,
                          ),
                          child: TextFormField(
                              initialValue: mobile,
                              enabled: _isEnabled,
                              decoration:InputDecoration(
                                hintText: "Mobile No. ",
                              ),
                              onChanged:(String string){
                                setState((){}
                                );
                              }
                          ),
                        ),
                      ]
                  ),
                ),
              ),
            )
        )
    );
  }
}
class CircleIconButton extends StatelessWidget {
  final double size;
  final Function onPressed;
  final IconData icon;
  CircleIconButton({this.size = 30.0, this.icon = Icons.clear, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onPressed,
        child: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment(0.0, 0.0), // all centered
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey[300]),
                ),
                Icon(
                  icon,
                  size: size * 0.6, // 60% width for icon
                )
              ],
            )
        )
    );
  }
}