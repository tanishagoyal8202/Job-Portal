import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_portal/screens/seekers/login.dart';
import 'package:job_portal/screens/Provider/login_provider.dart';
import 'package:job_portal/screens/seekers/login.dart';


class Choose extends StatefulWidget {
  @override
  ChoosePageState createState() {
    return ChoosePageState();
  }
}
class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const RaisedGradientButton({
    Key key,
    @required this.child,
    this.gradient,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(gradient: gradient, boxShadow: [
        BoxShadow(

          color: Colors.grey[500],
          offset: Offset(0.0, 1.5),
          blurRadius: 1.5,
        ),
      ]),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

class ChoosePageState extends State<Choose> {



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFFE0F7FA),
                Color(0xFF80DEEA),
                Color(0xFF26C6DA),
                Color(0xFF0097A7),
              ],
            ),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*Container(
                    //alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.fromLTRB(70, 60, 70, 20),
                     child: RaisedButton(
                       child: Text('Tap To Get a Job '),
                       elevation: 30,
                         onPressed:(){
                           Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => LoginSeeker()));
                     }

                     ),
                  ),*/
              Container(
                //alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(70, 60, 70, 20),
                child:
                RaisedGradientButton(
                    child: Text(
                      'Tap To Get a Job',
                      style: TextStyle(color: Colors.white),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[Colors.grey[350], Colors.grey[700]],
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context) => LoginSeeker()));

                    }
                ),
              ),
              Container(
                //alignment: Alignment.bottomCenter,
                padding: EdgeInsets.fromLTRB(70, 60, 70, 20),
                child:
                RaisedGradientButton(
                    child: Text(
                      'Tap To Provide A Job',
                      style: TextStyle(color: Colors.white),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[Colors.grey[350], Colors.grey[700]],
                    ),
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(BuildContext context) => LoginProvider()));


                    }
                ),
                /* RaisedButton(
                        child: Text('Tap To Provide A Job '),
                      elevation: 30,
                      //padding: EdgeInsets.all(10),
                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder:(BuildContext context) => LoginProvider()));
                   }
                   ),*/
              ),
              /*const SizedBox(height: 20),

                 RaisedButton(
                   onPressed: () {},
                   textColor: Colors.white,
                   padding: const EdgeInsets.all(0.0),
                   child: Container(
                     decoration: const BoxDecoration(
                       gradient: LinearGradient(

                         colors: <Color>[
                           Color(0xFF0D47A1),
                           Color(0xFF1976D2),
                           Color(0xFF42A5F5),
                         ],
                       ),
                     ),
                     padding: const EdgeInsets.all(10.0),
                     child: const Text(
                         'Gradient Button',
                         style: TextStyle(fontSize: 20)
                     ),
                   ),
                 ),*/
            ],
          ),
        ),
      ),

    );
  }

}