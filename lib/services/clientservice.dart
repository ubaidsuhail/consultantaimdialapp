import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:percent_indicator/percent_indicator.dart';
class ClientService extends StatefulWidget {
  @override
  _ClientServiceState createState() => _ClientServiceState();
}

class _ClientServiceState extends State<ClientService> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 28.0,),
        GestureDetector(
            onTap: (){

            },
            child:Container(
              width: MediaQuery.of(context).size.width*0.88,
              height: MediaQuery.of(context).size.height*0.1,
              //color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width*0.8,
                        margin: EdgeInsets.only(top: 10.0),
                        //color: Colors.green,
                        child:AutoSizeText(
                          'Med - EX Private Limited',
                          style: TextStyle(fontSize: 22.0),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          minFontSize: 22.0,
                        ),
                      ),

                      Padding(
                          padding: EdgeInsets.only(top:10.0),
                          child:Icon(Icons.keyboard_arrow_down,size: 20.0,)
                      )
                    ],
                  ),
                  Text("Office 203 Crown Plaza"),
                ],
              ),
            )
        ),

        SizedBox(height:15.0),

        Expanded(
            child:SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.88,
                    height: MediaQuery.of(context).size.height*0.1,
                    // color:Colors.green,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text("Services",style: TextStyle(color: Colors.black54,fontSize: 18.0),),
                            Text("5",style: TextStyle(color: Colors.black,fontSize: 25.0),)
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Text("Invoices",style: TextStyle(color: Colors.black54,fontSize: 18.0),),
                            Text("1",style: TextStyle(color: Colors.black,fontSize: 25.0),)
                          ],
                        ),

                        Column(
                          children: <Widget>[
                            Text("Task",style: TextStyle(color: Colors.black54,fontSize: 18.0),),
                            Text("8",style: TextStyle(color: Colors.black,fontSize: 25.0),)
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height:5.0),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 0.5,
                    color: Colors.grey,
                  ),

                  SizedBox(height:5.0),

                  Center(
                      child:Icon(Icons.keyboard_arrow_down,size: 25.0,)
                  ),

                  SizedBox(height:25.0),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3.5,
                    color: Colors.grey[300],
                  ),


                  SizedBox(height:5.0),

                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.45,
                      //color: Colors.red,
                      child:ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context , int index){
                            return Padding(
                              padding: EdgeInsets.only(top: 10.0),
                              //color: Colors.blue,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(height: 3.0,),
                                  Container(
                                    width:MediaQuery.of(context).size.width*0.9,
                                    margin: EdgeInsets.only(left: 8.0),
                                    child:AutoSizeText(
                                      'Private Limited Company Formation',
                                      style: TextStyle(fontSize: 15.0),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 15.0,
                                    ),
                                  ),
                                  Container(
                                    width:MediaQuery.of(context).size.width*0.9,
                                    margin: EdgeInsets.only(left: 8.0),
                                    child:AutoSizeText(
                                      'SECP | FBR',
                                      style: TextStyle(fontSize: 14.0,color: Colors.grey),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 14.0,
                                    ),
                                  ),

                                  SizedBox(height:12.0),
                                  Container(
                                    width:MediaQuery.of(context).size.width*0.9,
                                    margin: EdgeInsets.only(left: 8.0),
                                    child:AutoSizeText(
                                      'Progress Bar',
                                      style: TextStyle(fontSize: 14.0,color: Colors.black54),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 15.0,
                                    ),
                                  ),

                                  SizedBox(height:2.0),

                                  LinearPercentIndicator(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    lineHeight: 10.0,
                                    percent: 0.5,
                                    backgroundColor: Colors.grey[300],
                                    progressColor: Colors.green,
                                  ),

                                  Container(
                                    width:MediaQuery.of(context).size.width*0.9,
                                    margin: EdgeInsets.only(left: 8.0),
                                    child:AutoSizeText(
                                      '7 out of 15 steps are completed',
                                      style: TextStyle(fontSize: 14.0,color: Colors.grey),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      minFontSize: 15.0,
                                    ),
                                  ),

                                  SizedBox(height:8.0),

                                  Center(
                                    child:GestureDetector(
                                        onTap: (){
                                          Navigator.pushNamed(context, "ViewInsights");
                                        },
                                        child:Text("View Insights",style: TextStyle(color: Colors.blue),)
                                    ),
                                  ),

                                  SizedBox(height:2.0),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 3.0,
                                    color: Colors.grey[300],
                                  ),

                                ],
                              ),
                            );
                          }

                      )
                  ),

                  SizedBox(height:4.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 3.0,
                    color: Colors.grey[300],
                  ),

                  SizedBox(height:6.0),

                  GestureDetector(
                      onTap: (){

                      },

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width*0.25,
                            height: MediaQuery.of(context).size.height*0.06,
                            margin: EdgeInsets.only(right: 20.0),
                            color:Colors.teal,
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.add,color: Colors.white,),
                                Text("Services",style: TextStyle(color: Colors.white),),
                              ],
                            ),

                          ),
                        ],
                      )
                  ),

                  SizedBox(
                    height: 10.0,
                  ),


                ],
              ),
            )),






      ],
    );
  }
}
