import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/constants.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CalendarController _controller;

  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context).pushNamed('/home_page');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Done',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Home"),
      ),
      body: ListView(
        children: [
          Container(
            margin:EdgeInsets.all(6.0),
            color: Colors.orange,
            child: Card(
              clipBehavior: Clip.antiAlias,
              // color: Colors.black87,
              child: new InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/priorities_page');
                },

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TableCalendar(
                      initialCalendarFormat: CalendarFormat.week,
                      calendarStyle: CalendarStyle(
                          todayColor: Colors.black,
                          selectedColor: Theme.of(context).primaryColor,
                          todayStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              color: Colors.white
                          )
                      ),
                      headerStyle: HeaderStyle(
                        centerHeaderTitle: true,
                        formatButtonDecoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        formatButtonTextStyle: TextStyle(
                            color: Colors.white
                        ),
                        formatButtonShowsNext: false,

                      ),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      /*onDaySelected: (date, events) {
                  print(date.toIso8601String());
                },*/
                      builders: CalendarBuilders(
                        selectedDayBuilder: (context, date, events) => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Text
                            (date.day.toString(), style: TextStyle(color: Colors.white),),
                        ),
                        todayDayBuilder: (context, date, events)  => Container(
                          margin: const EdgeInsets.all(4.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.orange,

                            shape: BoxShape.circle,
                          ),
                          child: Text
                            (date.day.toString(), style: TextStyle(color: Colors.white),),
                        ),
                      ),
                      calendarController: _controller,)
                  ],

                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}