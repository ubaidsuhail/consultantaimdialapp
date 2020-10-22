import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';


class BusinessList extends StatefulWidget {
  @override
  _BusinessListState createState() => _BusinessListState();
}

class _BusinessListState extends State<BusinessList> {

  List businessList = ["Med - EX Private Limited","COCA COLA","PEPSI CO","BRAND H2O","AA LOGICS"];
  List businessOwner = ["Taimoor Aimdali","Ubaid Suhail","Taha Hasan","Jammel Qadri","Noman Ansari"];
  List businessAddress = ["Gulshan Iqbal,Karachi,Pakistan","North Nazimabad,Karachi,Pakistan","North Karachi,Karachi,Pakistan","Defence,Karachi,Pakistan","Clifton,Karachi,Pakistan"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(0XFF, 0X0E, 0X4C, 0X92)),
        title: Center(child:Text("Business List",style: TextStyle(fontSize: 30.0,color:Color.fromARGB(0XFF, 0X0E, 0X4C, 0X92),fontWeight: FontWeight.w400),)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top:10.0),
        child: ListView.builder(
            padding: EdgeInsets.all(0.0) ,
            itemCount: businessList.length,
            itemBuilder: (BuildContext context , int index){
              return GestureDetector(
              onTap: (){
                //print("Businesses");
                Navigator.pushNamed(context, 'BottomBars');
              },
                child:Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 15.0,right: 15.0,top: 5.0,bottom: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.teal),
                      color: Colors.teal,
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15.0,),
                    Center(
                      child:Padding(
                        padding:EdgeInsets.all(5.0) ,
                      child:AutoSizeText(
                      businessList[index],
                      style: TextStyle(fontSize: 24.0,color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 24.0,
                    ),
                      ),
                    ),

                    SizedBox(height: 20.0,),

                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    child:AutoSizeText(
                      'Name: '+businessOwner[index],
                      style: TextStyle(fontSize: 16.0,color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 16.0,
                    )
                    ),

                    SizedBox(height: 8.0,),

                    Padding(
                      padding: EdgeInsets.only(left: 5.0),
                    child:AutoSizeText(
                      'Address:'+businessAddress[index]+".",
                      style: TextStyle(fontSize: 16.0,color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 16.0,
                    )
                    ),

                    SizedBox(height: 20.0,),
                  ],
                ),
                )
              );
            }

        ),
      ),
    );
  }
}
