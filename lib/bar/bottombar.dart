import 'package:flutter/material.dart';
import 'package:consultantaimdialapp/services/clientservice.dart';
import 'package:consultantaimdialapp/registerationscreens/updateprofile.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> with SingleTickerProviderStateMixin {
  TabController tabs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = new TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: tabs,
        children: <Widget>[
          ClientService(),
          UpdateProfile(),
        ],
      ),

      bottomNavigationBar: Material(
        //color: Colors.blue,
        elevation: 5.0,
        child: TabBar(
          controller: tabs,
          indicatorColor:Colors.transparent,
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.black54,
          tabs: <Widget>[
            Tab(child: Column(
              children: <Widget>[
                Padding(
                    padding:EdgeInsets.only(top: 5.0),
                    child:
                    Icon(Icons.home)),
                Text('Home',style: TextStyle(fontSize: 12.0),)
              ],
            )),



            Tab(child: Column(
              children: <Widget>[
                Padding(
                    padding:EdgeInsets.only(top: 5.0),
                    child:
                    Icon(Icons.create)),
                Text('Profile',style: TextStyle(fontSize: 12.0),)
              ],
            )),
          ],
        ),
      ),


    );
  }
}
