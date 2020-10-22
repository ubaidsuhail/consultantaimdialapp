import 'package:flutter/material.dart';
import 'dart:async';
import 'package:consultantaimdialapp/registerationscreens/loginregister.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    MoveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.25),
                  child:Image(image: AssetImage("images/consultancylogo.jpg"),width: 180.0,height: 180.0,)
              ),

              Expanded(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("AIMDIAL",style: TextStyle(fontSize: 35.0,color: Colors.grey),),
                    ],
                  )
              ),

              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        )
    );
  }


  void MoveToNextScreen() async
  {
    Timer(
      Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(seconds:3),
          pageBuilder: (context, __, ___) => LoginRegister(),
        ),
      ),
    );
  }






}
