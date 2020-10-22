import 'package:flutter/material.dart';

class SelectService extends StatefulWidget {
  @override
  _SelectServiceState createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {

  List<String> serviceList = ["IT" , "TAX" , "PROPERTY" , "REACCURING"] ;
  List<int> serviceNo = [1,2,3,4];
  int selectService = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(0XFF, 0X0E, 0X4C, 0X92)),
        title: Text("Aimdial Consultant",style: TextStyle(fontSize: 30.0,color:Color.fromARGB(0XFF, 0X0E, 0X4C, 0X92),fontWeight: FontWeight.w400),),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
        children: <Widget>[
          Text("Hi, Consultant",style: TextStyle(fontSize: 24.0,color:Color.fromARGB(0XFF, 0X0E, 0X4C, 0X92)),),
          SizedBox(
            height: 10.0,
          ),
          Text("Select your Service",style: TextStyle(fontSize: 16.0,color:Color.fromARGB(0XFF, 0X0E, 0X4C, 0X92)),),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),

          Expanded(
            child: ListView.builder(
                itemCount: serviceList.length,
                padding: EdgeInsets.all(0.0),
                itemBuilder: (BuildContext context , int index){
                  return Container(
                    margin: EdgeInsets.only(top: 10.0,bottom: 10.0,left: MediaQuery.of(context).size.width*0.1),
                    child: Row(
                      children: <Widget>[
                        new Radio(
                          value: serviceNo[index],
                          groupValue: selectService,
                          onChanged: (radValue){

                            setState(() {
                              selectService = radValue;
                            });

                          },
                        ),
                        new Text(
                          serviceList[index],
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  );
                }

            ),
          ),

         Container(
           width: MediaQuery.of(context).size.width*0.9,
           height: MediaQuery.of(context).size.height*0.06,
           child:RaisedButton(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5.0)
             ),
             color:Colors.teal,
             elevation: 0.0,
             onPressed: (){
               print("Go to business list");
               Navigator.pushNamed(context,'BusinessLists');
             },
             child: Text("Select Service",style: TextStyle(fontSize: 20.0,color: Colors.white),),
           ),
         ),

          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),


        ],
        ),
      ),
    );
  }
}
