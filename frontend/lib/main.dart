import 'package:flutter/material.dart';
import 'package:flutter_login_ui/Home_page.dart';
import 'package:flutter_login_ui/import_page.dart';
import 'package:flutter_login_ui/login_screen.dart';
import 'package:flutter_login_ui/priorities_page.dart';
import 'package:flutter_login_ui/profile_page.dart';
import 'package:flutter_login_ui/schedule_page.dart';
import 'package:flutter_login_ui/signup_screen.dart';
import 'package:flutter_login_ui/settings_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder> {
        '/signup_screen': (BuildContext context) => SignupPage(),
        '/home_page': (BuildContext context) => HomePage(),
        '/profile_page': (BuildContext context) => ProfilePage(),
        '/priorities_page': (BuildContext context) => PrioritiesPage(),
        '/schedule_page': (BuildContext context) => SchedulePage(),
        '/import_page': (BuildContext context) => ImportPage(),
        '/settings_page': (BuildContext context) => SettingsPage(),
      },
      home:LoginScreen(),
    );
  }
}