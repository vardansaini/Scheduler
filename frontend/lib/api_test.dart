import 'dart:developer';
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login_ui/constants.dart';
import "package:googleapis_auth/auth_io.dart";
import 'package:googleapis/calendar/v3.dart';
import 'package:url_launcher/url_launcher.dart';

class ApiTest extends StatefulWidget{
  @override
  _apitestState createState() => _apitestState();
}
class _apitestState extends State<ApiTest> {
  static const _scopes = const [CalendarApi.CalendarScope];
  var _credentials;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}