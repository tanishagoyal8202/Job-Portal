import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  @override
  ResetPageState createState() => ResetPageState();
}

class ResetPageState extends State<ResetPage> {
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
        title: Text('Reset Password'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: <Widget>[

                  TextField(
                    autofocus: false,
                    obscureText: false,
                    keyboardType: TextInputType.visiblePassword,
                    controller: password,
                    decoration: InputDecoration(
                        labelText: "New Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.cyan,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    autofocus: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        labelText: "Confirm Password",

                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.cyan,
                                style: BorderStyle.solid))),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ButtonTheme(
                    minWidth: double.infinity,
                    child: MaterialButton(
                      onPressed: () => {},
                      textColor: Colors.white,
                      color: Colors.cyan[600],
                      height: 50,
                      child: Text("Save Changes"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}