import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

/// By using this key, we can push pages without context
final GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

/// By using selectedRoute we can track the routing screens
var selectedRoute;

/// Instance of DIO class
Dio dio = Dio();

