import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footeur/beans/joueur.dart';

class Partie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Partie();
  }

}

class _Partie extends State<Partie>{


  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              image: DecorationImage(
                image: ExactAssetImage("assets/terrain.jpg"), fit: BoxFit.fill
              )
            ),
          ),
          Joueur(post: "Attaquant", x: 0, y: 0, numero: 9, recoit: true),
          Joueur(post: "Attaquant", x: 0, y: 0, numero: 9, recoit: false)
        ],
      ),
    );
  }

}
