import 'package:flutter/material.dart';

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
                          Navigator.of(context).pushNamed('/import_page');
                         },
                    ),
                    ListTile(
                      title: Text("Change Priorities"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: (){
                        Navigator.of(context).pushNamed('/priorities_page');
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
      )
    ]
                )
      )
    );
  }
}
