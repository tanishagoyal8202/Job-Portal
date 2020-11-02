import 'package:flutter/material.dart';


// ignore: camel_case_types
class Reset extends StatefulWidget {
  @override
  ResetState createState() {
    return ResetState();
  }
}

class ResetState extends State<Reset> {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Reset Password',
      debugShowCheckedModeBanner:false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
          backgroundColor: Colors.cyan[800],
        ),

        body: SingleChildScrollView(),
      ),
    );
  }
}
