import 'package:flutter/widgets.dart';
import 'package:quick_chat/screens/DetailPage.dart';
import 'package:quick_chat/screens/LoginPage.dart';
import 'package:quick_chat/screens/MyHomePage.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => MyHomePage(),
  "/detail" : (BuildContext context) => DetailPage(),
  "/login" : (BuildContext context) => LoginPage(),
};