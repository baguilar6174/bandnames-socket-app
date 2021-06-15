import 'package:flutter/material.dart';

import 'package:band_names/ui/router.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Band Names App',
      // Initial route application.
      initialRoute: 'home',
      // Application routes.
      routes: customRoutes,
    );
  }
}