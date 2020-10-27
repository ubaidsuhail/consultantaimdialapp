import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:consultantaimdialapp/datamodels/sharedpreferenceapp.dart';
import 'package:http/http.dart';
import 'package:consultantaimdialapp/datamodels/apisurl.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';



class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var dbMaskFormatter = new MaskTextInputFormatter(mask: '##-##-####', filter: { "#": RegExp(r'[0-9]') });

  final _updateForm = GlobalKey<FormState>();

  TextEditingController _updateName = TextEditingController();
  TextEditingController _updateDateOfBirth = TextEditingController();
  TextEditingController _updateCellNumber = TextEditingController();
  TextEditingController _updatePassword = TextEditingController();
  int _consultantId;
  SharedPreferenceApp shPrefApp = SharedPreferenceApp();

  String convertDateOfBirth = "";
  String updateBirthDate = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    GetUserInformation();

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Form(
          key: _updateForm,
          child:  Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height*0.06,
              ),
              Text("Profile",style: TextStyle(color: Colors.teal,fontWeight: FontWeight.w400),textScaleFactor: 2.5,),

              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,top: 20.0),
                child: TextFormField(
                  controller: _updateName,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Full name should not be empty';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    hintText: "Full Name",
                    hintStyle: TextStyle(color: Colors.green[800]),

                  ),

                ),

              ),




              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,top: 20.0),
                child: TextFormField(
                    controller: _updateDateOfBirth,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Date of birth should not be empty';
                      }
                      else if (value.length < 10)
                      {
                        return 'Enter Correct date format';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "DD-MM-YYYY",
                      hintStyle: TextStyle(color: Colors.green[800]),
                    ),

                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      dbMaskFormatter,
                      //WhitelistingTextInputFormatter.digitsOnly
                    ]

                ),

              ),



              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,top: 20.0),
                child: TextFormField(
                    enabled: false,
                    controller: _updateCellNumber,
//                  validator: (value) {
//                    if (value.isEmpty) {
//                      return 'Cell Phone Number should not be empty';
//                    }
//                    else if (value.length < 11)
//                    {
//                      return 'Enter Correct Phone No format';
//                    }
//                    return null;
//                  },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      hintText: "Cell Number",
                      hintStyle: TextStyle(color: Colors.green[800]),
                    ),

                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(11),
                      WhitelistingTextInputFormatter.digitsOnly
                    ]

                ),

              ),

              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1,right: MediaQuery.of(context).size.width*0.1,top: 20.0),
                child: TextFormField(
                  controller: _updatePassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password should not be empty';
                    }
                    return null;
                  },

                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[300]),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.green[800]),

                  ),

                  //obscureText: false,

                ),

              ),


              Container(
                width:MediaQuery.of(context).size.width*0.7,
                height:MediaQuery.of(context).size.height*0.06 ,
                margin: EdgeInsets.only(top:30.0),
                child:RaisedButton(
                  onPressed: (){
                    if(_updateForm.currentState.validate()) {
                      UpdateUserInformation();

                    }
                    else{
                      print("register invalid");
                    }
                  },
                  color: Colors.teal,
                  child: Text("Update",style: TextStyle(color: Colors.white),),
                ),
              ),



            ],
          ),
        )


    );
  }


  void GetUserInformation() async
  {

    convertDateOfBirth = await shPrefApp.GetConsultantDateOfBirth();

    print("Before convert date of birth"+convertDateOfBirth);

    _updateName.text = await shPrefApp.GetConsultantName();
    _updateDateOfBirth.text = convertDateOfBirth.substring(8,10) + "-" + convertDateOfBirth.substring(5,7) + "-" + convertDateOfBirth.substring(0,4);
    _updateCellNumber.text = await shPrefApp.GetConsultantCellNumber();
    _updatePassword.text = await shPrefApp.GetConsultantPassword();

    setState(() {

    });
  }


  void UpdateUserInformation() async
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

    _consultantId = await shPrefApp.GetConsultantId();

    updateBirthDate = _updateDateOfBirth.text.substring(6,10) + "-" + _updateDateOfBirth.text.substring(3,5) + "-" + _updateDateOfBirth.text.substring(0,2);

//    print(_clientId);
//    print(_updateName.text);
//    print(updateBirthDate);
//    print(_updateCellNumber.text);
//    print(_updatePassword.text);


    String url = updateApi;

    String json = '{"ConsultantId":"$_consultantId","ConsultantName":"${_updateName.text}","ConsultantDateOfBirth":"${updateBirthDate}","ConsultantCellNumber":"${_updateCellNumber.text}","ConsultantPassword":"${_updatePassword.text}"}';

    Response response = await post(url, body: json);

    print("status code is:${response.statusCode}");
    print("response body is:${response.body}");


    if (response.statusCode == 200 && response.body.toString() == "1")
    {
      Navigator.of(context, rootNavigator: true).pop();


      await shPrefApp.SetConsultantInformation(_consultantId , _updateName.text , updateBirthDate , _updateCellNumber.text , _updatePassword.text);



      //Set Toast message
      Fluttertoast.showToast(
          msg: "Profile Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0
      );



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
