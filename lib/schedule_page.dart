import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
//Todo: Age, timezone, Academic TImeZone
class SchedulePage extends StatefulWidget {
  @override
  _schedulePageState createState() => _schedulePageState();
}

class _schedulePageState extends State<SchedulePage> {
  bool _rememberMe = false;

Widget _buildSch(){
    return Container(
        child: SfCalendar(
          view: CalendarView.week,
          firstDayOfWeek: 1, // Monday
        ));
  }
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          Navigator.of(context).pushNamed('/priorities_page');
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Next',
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
        title: Text("Schedule"),
      ),
        body: SfCalendar(
          view: CalendarView.week,
          firstDayOfWeek: 1, // Monday
        ),


                      //_buildLoginBtn(),


    );
  }
}
