import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:consultantaimdialapp/datamodels/apisurl.dart';
import 'package:http/http.dart';
import 'package:consultantaimdialapp/registerationscreens/loginregister.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class VerifyPhoneNumber extends StatefulWidget {
  String consultantName;
  String consultantDateOfBirth;
  String consultantCellNumber;
  String consultantPassword;


  VerifyPhoneNumber({this.consultantName,this.consultantDateOfBirth,this.consultantCellNumber,this.consultantPassword});


  @override
  _VerifyPhoneNumberState createState() => _VerifyPhoneNumberState();
}

class _VerifyPhoneNumberState extends State<VerifyPhoneNumber> {
  final _codeForm = GlobalKey<FormState>();
  TextEditingController _phoneCode = TextEditingController();

  String errorMessage = "";
  String verificationId;
  String clientOtpCellNumber;
  String correctAuthenticate = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print("Full Name:${widget.userName}");
//    print("Date of Birth:${widget.userDateOfBirth}");
//    print("Cell Phone Number:${widget.userCellNumber}");
//    print("Password:${widget.userPassword}");

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child:Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginRegister()));
              },
              child: Icon(Icons.arrow_back),
            ),
            backgroundColor: Colors.teal,
            title: Text("Verify Phone Number"),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                    controller: _phoneCode,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(width: 1.0, color: Colors.teal),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(width: 1.0, color: Colors.teal),
                      ),
                      border: InputBorder.none,

                      fillColor: Colors.white,
                      filled: true,
                    ),
                    style: TextStyle(fontSize: 20.0),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                      WhitelistingTextInputFormatter.digitsOnly
                    ]

                ),


                SizedBox(
                  height: 5.0,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(errorMessage,
                        style: TextStyle(color: Colors.red, fontSize: 13.0)),
                    GestureDetector(
                      onTap: () {
                        SendCode();
                      },
                      child: Text("Send Code",
                        style: TextStyle(color: Colors.teal, fontSize: 15.0),),

                    ),

                  ],
                ),


                Spacer(),

                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.9,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06,
                  margin: EdgeInsets.only(top: 6.0),
                  child: RaisedButton(
                    elevation: 0.0,
                    onPressed: () {
                      //Navigator.pushNamed(context, 'BottomBars');
                      Verify();
                    },
                    color: Colors.teal,
                    child: Text("Verify",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  ),

                ),

                SizedBox(
                  height: 20.0,
                )


              ],),
          )
      )
      ,onWillPop: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginRegister()));
    },);
  }


  void SendCode() async
  {
    print("Send code to");

    Fluttertoast.showToast(
        msg: "Sending code processsing",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red[300],
        textColor: Colors.white,
        fontSize: 16.0
    );


    clientOtpCellNumber = widget.consultantCellNumber.substring(1);
    clientOtpCellNumber = "+92" + clientOtpCellNumber;

    print("Consultant opt number is:${clientOtpCellNumber}");

    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      print("Auto retrieve expire");
      verificationId = verId;
      errorMessage = "Code Expired";
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResent]) {
      verificationId = verId;
      print("verID code sent:${verificationId}");
      setState(() {
        errorMessage = "";
      });
//      smsCodeDialoge(context).then((value){
//        print("Code Sent");
//      });
    };
    final PhoneVerificationCompleted verifiedSuccess = (
        AuthCredential auth) async {
      print("Verification completed");
      CodeExpireTime();
    };
    final PhoneVerificationFailed verifyFailed = (AuthException e) {
      print('Verification failed:${e.message}');

      setState(() {
        errorMessage = "Error in sending verification code";
      });
    };
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: clientOtpCellNumber,
      timeout: Duration(seconds: 2),
      verificationCompleted: verifiedSuccess,
      verificationFailed: verifyFailed,
      codeSent: smsCodeSent,
      codeAutoRetrievalTimeout: null,
    );
  }


  void CodeExpireTime() async{
    print("Code expire starts");
    Timer(
        Duration(seconds: 25),
            (){
          print("Code has been expired now");
          errorMessage = "Code Expired";
        }
    );
  }



  void Verify() async
  {
    print("Verify");


    if (_phoneCode.text == "") {
      setState(() {
        errorMessage = "Text Field can not be empty";
      });
    }

    else if (errorMessage == "Code Expired") {
      setState(() {
        errorMessage = "Code Expired";
      });
    }

    else if (correctAuthenticate == "") {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
          verificationId: verificationId,
          smsCode: _phoneCode.text);


      await FirebaseAuth.instance.signInWithCredential(
          credential).then((user) {
        print("user insert");

        InsertUserData();

      }).catchError((e) {
        print("Error is:${e.message}");
        setState(() {
          errorMessage = "Verification Code is not correct";
        });
      });
    }
  }


  void InsertUserData() async
  {
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child:SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          );
        });

    String url = signupApi;

    String json = '{"ConsultantName":"${widget.consultantName}","ConsultantDateOfBirth":"${widget.consultantDateOfBirth}","ConsultantCellNumber":"${widget.consultantCellNumber}","ConsultantPassword":"${widget.consultantPassword}"}';

    Response response = await post(url, body: json);

    print("status code is:${response.statusCode}");
    print("response body is:${response.body}");

    if (response.statusCode == 200 && response.body.toString() == "1")
    {
      Navigator.of(context, rootNavigator: true).pop();


      //Set Toast message
      Fluttertoast.showToast(
          msg: "Congratulations!Sign up Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => LoginRegister()));
    }

    else if (response.statusCode == 200 && response.body.toString() == "Cell Number Already Exists")
    {

      Navigator.of(context, rootNavigator: true).pop();
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                "Error",
              ),
              content: Text("Cell Number already used"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
  }

}





