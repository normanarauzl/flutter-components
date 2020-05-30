
import 'package:app_demo/src/pages/listview_page.dart';
import 'package:app_demo/src/pages/slider_page.dart';
import 'package:flutter/material.dart';


import 'package:app_demo/src/pages/input_page.dart';
import 'package:app_demo/src/pages/card_page.dart';
import 'package:app_demo/src/pages/alert_page.dart';
import 'package:app_demo/src/pages/avatar_page.dart';
import 'package:app_demo/src/pages/home_page.dart';
import 'package:app_demo/src/pages/animated_container.dart';

Map<String, WidgetBuilder> getApplicationRoutes(){
  final rutas = <String, WidgetBuilder>{
        '/'      : (BuildContext context) => HomePage(),
        'alert'  : (BuildContext context) => AlertPage(),
        'avatar' : (BuildContext context) => AvatarPage(),
        'card'   : (BuildContext context) => CardPage(),
        'inputs'  : (BuildContext context) => InputPage(),
        'sliders' : (BuildContext context) => SliderPage(),
        'animatedContainer': (BuildContext context) => AnimatedContainerPage(),
        'lists'  : (BuildContext context) => ListViewPage()
      };

      return rutas;

}