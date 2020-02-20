

import 'dart:developer';

import 'package:flutter/widgets.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String navigateTo){
    log('Redirected to $navigateTo');
    return navigatorKey.currentState.pushNamed(navigateTo);
  }
}