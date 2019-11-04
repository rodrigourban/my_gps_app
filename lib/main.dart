import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import "package:gps_onichan/services/location_service.dart";
import 'datamodels/user_location.dart';
import "package:provider/provider.dart";
import "package:gps_onichan/views/home_view.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:gps_onichan/views/login_page.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      builder: (context) => LocationService().locationStream,
      child: MaterialApp(
      title: 'Titulo copado',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage()));
  }
}


class Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserLocation>(
      builder: (context) => LocationService().locationStream,
      child: MaterialApp(title: 'Location Demo', home: HomeView()));
  }
}