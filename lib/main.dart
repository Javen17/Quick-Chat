import 'package:flutter/material.dart';
import 'package:quick_chat/routes.dart';
import 'package:quick_chat/theme/app_theme.dart';

void main() => runApp(QuickChatApp());

class QuickChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/login',
        routes: routes,
      );
  }
}



