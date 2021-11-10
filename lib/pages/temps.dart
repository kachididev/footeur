import 'dart:async';

import 'package:flutter/material.dart';

class TempsDeJeu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TempsDeJeu();
  }
}

class _TempsDeJeu extends State<TempsDeJeu> {
  Timer? timer;
  int t = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Cool! ${timer}");
    timer = Timer.periodic(const Duration(seconds: 1), (ti) {
      //print("Cool! ${ti.tick}");
      setState(() {
        t = ti.tick;
      });
    });
    //print("Cool! ${timer!.tick}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 100,
      width: 50,
      child: Center(
        child: Text(
          "$t",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
