import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/constants.dart';
import 'package:flutter_login_ui/login_screen.dart';
//import 'package:table_calendar/table_calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter_login_ui/signup_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Settings"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Navigator.of(context).pushNamed('/schedule_page');
          }
        )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
                elevation: 4.0,
                margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
             child: Column(
               children: <Widget>[
                 ListTile(
                   title: Text("Profile"),
                   tileColor: Colors.lightBlueAccent,
                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                 ),
                 ListTile(
                   title: Text("Name"),
                   trailing: Icon(Icons.edit),
                    onTap: (){
                  //Open edit name
                  },
              ),
              ListTile(
                title: Text("Email ID"),
                trailing: Icon(Icons.edit),
                onTap: (){
                  //Open edit email ID
                },
              ),
              ListTile(
                title: Text("Password"),
                trailing: Icon(Icons.edit),
                onTap: (){
                  //Open edit Password
                },
              ),
              ListTile(
                title: Text("Current Time Zone"),
                trailing: Icon(Icons.edit),
                onTap: (){
                  //Open edit Current Time Zone
                },
              ),
              ListTile(
                title: Text("University Time Zone"),
                trailing: Icon(Icons.edit),
                onTap: (){
                  //Open edit University Time Zone
                },
              ),

          ]
             )

      ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Text("Scheduling"),
                        tileColor: Colors.lightBlueAccent,
                    ),
                    ListTile(
                        title: Text("Import Calendars"),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: (){
                          Navigator.of(context).pushNamed('/settings_import');
                         },
                    ),
                    ListTile(
                      title: Text("Change Priorities"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        Navigator.of(context).pushNamed('/settings_priorities');
                      },
                    ),

                    SwitchListTile(
                      title: Text("Notifications"),
                      activeColor: Colors.blue,
                      value: true,
                      onChanged: (val){}
                    ),
                    ListTile(
                      title: Text("Sleep Time"),
                      //To Do: display set sleep time
                      trailing: Icon(Icons.edit),
                      onTap: () {
                        // edit sleep time option
                      },
                    ),
            ]
              )
            ),
          Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("View"),
                  tileColor: Colors.lightBlueAccent,
                ),
                SwitchListTile(
                  value: false,
                  onChanged: (val){
                    //change to true
                  },
                  title: Text("24-Hour Format"),
                ),
                SwitchListTile(
                  value: false,
                  onChanged: (val){
                    // To Do: change the value
                  },
                  title: Text("Dark-Mode"),
                )
    ]
      )
      ),
            Card(
              elevation: 4.0,
              margin: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 1.0),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
           child: RaisedButton(
          elevation: 5.0,
          onPressed: () {
            signOutGoogle();
            Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context){return LoginScreen();}), ModalRoute.withName('/'));
          },
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          color: Colors.white,
          child: Text(
            'Sign Out',
            style: TextStyle(
              color: Color(0xFF527DAA),
              letterSpacing: 1.5,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
        ),
            )

    ]

                )

      )
    );
  }
}
