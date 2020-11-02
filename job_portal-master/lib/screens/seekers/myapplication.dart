import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: camel_case_types
class MyApplications extends StatelessWidget {
  Icon cusIcon =Icon(Icons.search);
  Widget cusSearchBar =Text("Home");
  @override
  Widget build(BuildContext context) {
    //TODO: implement build
    return MaterialApp(
        title: '  ',
        debugShowCheckedModeBanner:false,
        home: Scaffold(

            body: SingleChildScrollView(
              child: Column(children: <Widget>[


                IconButton(
                  onPressed: (){
                    setState(() {
                      if(this.cusIcon.icon==Icons.search){
                        this.cusIcon=Icon(Icons.cancel);
                        this.cusSearchBar=TextField(
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Jobs",
                          ),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),

                        );
                      } else{
                        this.cusIcon =Icon(Icons.search);
                        this.cusSearchBar =Text("   ");
                      }
                    }
                    );
                  },
                  icon: cusIcon,
                ),

              ],




              ),
            )));
  }

  void setState(Null Function() param0) {}

}



