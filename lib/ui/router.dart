import 'package:flutter/material.dart';

import 'package:band_names/ui/pages/status/status_page.dart';
import 'package:band_names/ui/pages/home/home_page.dart';

var customRoutes = <String, WidgetBuilder> {
  'home'  : (BuildContext context) => HomePage(),
  'status': (BuildContext context) => StatusPage(),
};
