import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ViewInsight extends StatefulWidget {
  @override
  _ViewInsightState createState() => _ViewInsightState();
}

class _ViewInsightState extends State<ViewInsight> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back,color: Colors.black,),
          ),
          title:Container(
              width: MediaQuery.of(context).size.width*0.6,
              child:Center(
                child:Text("Services",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300,fontSize: 25.0),),
              )
          )
      ),

      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 8.0,right: 10.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child:AutoSizeText(
                    'Private Limited Company Formation',
                    style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.w400),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 20.0,
                  ),
                ),

                Text("SECP|FBR",style: TextStyle(color: Colors.grey),),

                SizedBox(
                  height: 8.0,
                ),

                Text("Registeration of business as a private limited company in Security & Exchange Commission Pakistan with all pre incorporation compliances.",style: TextStyle(color: Colors.black54,fontSize: 14.5),),

                SizedBox(
                  height: 10.0,
                ),

                Text("Progress Bar",style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.w400),),

                SizedBox(height:4.0),

                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width*0.9,
                  lineHeight: 12.0,
                  percent: 0.7,
                  backgroundColor: Colors.grey[300],
                  progressColor: Colors.green,
                  padding: EdgeInsets.only(left: 6.0),
                ),

                SizedBox(height:4.0),

                Text("7 out of 15 steps are completed",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w400,color: Colors.grey),),

                SizedBox(height: 15.0,),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[700],
                          ),
                          child: Center(
                            child: Text("1",style: TextStyle(color:Colors.white),),
                          ),
                        ),

                        SizedBox(
                          width: 7.0,
                        ),

                        Expanded(
                          child:Text("Filing of trademark application",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),) ,
                        ),

                      ],
                    ),

                    SizedBox(
                        height:6.0
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Center(
                            child: Text("2",style: TextStyle(color:Colors.white),),
                          ),
                        ),

                        SizedBox(
                          width: 7.0,
                        ),

                        Expanded(
                          child:Text("Removal of objection",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),) ,
                        ),

                      ],
                    ),

                    SizedBox(
                        height:6.0
                    ),

                    Row(
                      children: <Widget>[
                        Container(
                          width: 25.0,
                          height: 25.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black54,
                          ),
                          child: Center(
                            child: Text("3",style: TextStyle(color:Colors.white),),
                          ),
                        ),

                        SizedBox(
                          width: 7.0,
                        ),

                        Expanded(
                          child:Text("Certification",style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500),) ,
                        ),

                      ],
                    ),

                  ],
                ),

                SizedBox(
                  height: 18.0,
                ),

                Text("Required documents",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),

                Text("Please upload all these documents in service data folder.",style: TextStyle(color: Colors.grey,fontSize: 15.0),),


                SizedBox(
                  height: 28.0,
                ),

                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey[400],
                        width: 1.0
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.assignment,color: Colors.blue,size: 30.0,),

                                SizedBox(width: 12.0,),

                                Expanded(
                                    child:Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Messaging in the Google My Business app - Android',
                                          ),
                                          TextSpan(
                                            text: ' ',
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                                padding: EdgeInsets.only(bottom: 2.0),
                                                child:Icon(Icons.launch,size: 15.0,color: Colors.black54,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 60.0),
                            child:Divider(
                              thickness: 1.0,
                              height: 10.0,
                              color: Colors.grey[300],
                            ),
                          ),

                        ],
                      ),


                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0),
                            child: Row(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.assignment,color: Colors.blue,size: 30.0,),

                                SizedBox(width: 12.0,),

                                Expanded(
                                    child:Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Flag inappropriate reviews - Android',
                                          ),
                                          TextSpan(
                                            text: ' ',
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                                padding: EdgeInsets.only(bottom: 2.0),
                                                child:Icon(Icons.launch,size: 15.0,color: Colors.black54,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 60.0),
                            child:Divider(
                              thickness: 1.0,
                              height: 10.0,
                              color: Colors.grey[300],
                            ),
                          ),

                        ],
                      ),


                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0),
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.assignment,color: Colors.blue,size: 30.0,),

                                SizedBox(width: 12.0,),

                                Expanded(
                                    child:Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Contacts from Google to verify your business',
                                          ),
                                          TextSpan(
                                            text: ' ',
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                                padding: EdgeInsets.only(bottom: 2.0),
                                                child:Icon(Icons.launch,size: 15.0,color: Colors.black54,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          Padding(
                            padding: EdgeInsets.only(left: 60.0),
                            child:Divider(
                              thickness: 1.0,
                              height: 10.0,
                              color: Colors.grey[300],
                            ),
                          ),

                        ],
                      ),


                      Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 20.0,left: 20.0),
                            child: Row(
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Icon(Icons.assignment,color: Colors.blue,size: 30.0,),

                                SizedBox(width: 12.0,),

                                Expanded(
                                    child:Text.rich(
                                      TextSpan(
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: 'Verify your business',
                                          ),
                                          TextSpan(
                                            text: ' ',
                                          ),
                                          WidgetSpan(
                                            child: Padding(
                                                padding: EdgeInsets.only(bottom: 2.0),
                                                child:Icon(Icons.launch,size: 15.0,color: Colors.black54,)
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                ),

                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                        ],
                      ),




                    ],
                  ),

                ),


                SizedBox(
                  height: 15.0,
                ),


              ],
            ),


          )
      ),
    );
  }
}
