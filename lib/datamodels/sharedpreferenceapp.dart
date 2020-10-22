import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferenceApp
{

  Future SetConsultantInformation(int ConsultantId , String ConsultantName , String ConsultantDateOfBirth , String ConsultantCellNumber , String ConsultantPassword) async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setInt("consultantid", ConsultantId);
    prefs.setString("consultantname", ConsultantName);
    prefs.setString("consultantdateofbirth", ConsultantDateOfBirth);
    prefs.setString("consultantcellnumber", ConsultantCellNumber);
    prefs.setString("consultantpassword", ConsultantPassword);


  }


  Future<int> GetConsultantId() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("consultantid");
  }

  Future<String> GetConsultantName() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("consultantname");
  }

  Future<String> GetConsultantDateOfBirth() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("consultantdateofbirth");
  }

  Future<String> GetConsultantCellNumber() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("consultantcellnumber");
  }

  Future<String> GetConsultantPassword() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("consultantpassword");
  }


}