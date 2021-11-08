import 'dart:async';

import 'package:flutter/material.dart';
import 'package:footeur/pages/accueil.dart';
import 'package:footeur/pages/partie.dart';
import 'package:footeur/splash.dart';

void main() {
  //runApp(const Footeur());
  runApp(Footeur(Splash()));
  //
  start();
}

start() async {
  //
  Timer(Duration(seconds: 3), () {
    runApp(Footeur(Partie()));
  });
}

class Footeur extends StatelessWidget {
  Footeur(this.vue);

  Widget vue;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.green,
      ),
      home: vue,
    );
  }
}

