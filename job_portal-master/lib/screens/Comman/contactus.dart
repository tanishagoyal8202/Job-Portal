import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact Us',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text('Contact Us'),
          backgroundColor: Colors.cyan[800],
          centerTitle: true,
          leading:IconButton(icon:Icon(Icons.arrow_back),
              onPressed: ()=>Navigator.pop(context,false)),
        ),

        body: SingleChildScrollView(
          child:
          new Container(
            margin: new EdgeInsets.only(top: 50.0),
            alignment: Alignment.center,
            child: new Column(
                children: <Widget>[
                  new Text('JOB-SHOP'),
                  new Text('Our working hours: Monday to Friday,'),
                  new Text('10:00 AM - 6:00 PM'),
                  new Container(
                      margin: new EdgeInsets.only(top: 50.0),
                      alignment: Alignment.center,
                      child: new Column(
                          children: <Widget>[
                            new Text('ADDRESS',style: TextStyle(fontWeight: FontWeight.bold)),
                            new Text(' '),
                            new Text('Ziasy Consultancy Pvt. Ltd.'),
                            new Text('Satguru Parinay, 1st Floor,'),
                            new Text('Indore, India - 452001'),
                            new Text('(Phone No - 898654998)'),
                          ]
                      )
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}


