import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footeur/beans/ballon.dart';
import 'package:footeur/beans/joueur.dart';

class Partie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Partie();
  }
}

class _Partie extends State<Partie> {
  @override
  void initState() {
    super.initState();
  }

  bool adversaire = false;
  //
  double? x, y = 0;
  //

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
                image: ExactAssetImage("assets/terrain.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Joueur(
            post: "2ème attaquant",
            x: -(9 / 10),
            y: -0.5,
            numero: 11,
            recoit: true,
          ),
          Joueur(
            post: "milieux offensifs",
            x: 9 / 10,
            y: -0.25,
            numero: 10,
            recoit: true,
          ),
          Joueur(
            post: "avant-centre",
            x: 0,
            y: -0.5,
            numero: 9,
            recoit: true,
          ),
          Joueur(
            post: "milieux offensifs",
            x: -(9 / 10),
            y: -0.25,
            numero: 8,
            recoit: true,
          ),
          Joueur(
            post: "milieux défensifs",
            x: 9 / 10,
            y: -0.5,
            numero: 7,
            recoit: true,
          ),
          Joueur(
            post: "milieux défensifs",
            x: 0,
            y: 0.5 / 10,
            numero: 6,
            recoit: true,
          ),
          Joueur(
            post: "libéro",
            x: 0,
            y: 6 / 10,
            numero: 5,
            recoit: true,
          ),
          Joueur(
            post: "stoppeur",
            x: 0,
            y: 3 / 10,
            numero: 4,
            recoit: true,
          ),
          Joueur(
            post: "arrières latéraux",
            x: -(9 / 10),
            y: 6 / 10,
            numero: 3,
            recoit: true,
          ),
          Joueur(
            post: "arrières latéraux",
            x: 9 / 10,
            y: 6 / 10,
            numero: 2,
            recoit: true,
          ),
          Joueur(
            post: "gardien",
            x: 0,
            y: 1,
            numero: 1,
            recoit: true,
          ),
          ////////////////////////////////////////////////////////////////////////
          Ballon(x: x, y: y),

          ///
          Joueur(
            post: "2ème attaquant",
            x: 9 / 10,
            y: 0.5,
            numero: 11,
            recoit: false,
          ),
          Joueur(
            post: "milieux offensifs",
            x: -9 / 10,
            y: 0.5 / 10,
            numero: 10,
            recoit: false,
          ),
          Joueur(
            post: "avant-centre",
            x: 0,
            y: 0.5,
            numero: 9,
            recoit: false,
          ),
          Joueur(
            post: "milieux offensifs",
            x: 9 / 10,
            y: 0.5 / 10,
            numero: 8,
            recoit: false,
          ),
          Joueur(
            post: "milieux défensifs",
            x: -9 / 10,
            y: 0.5,
            numero: 7,
            recoit: false,
          ),
          Joueur(
            post: "milieux défensifs",
            x: 0,
            y: -0.5 / 10,
            numero: 6,
            recoit: false,
          ),
          Joueur(
            post: "libéro",
            x: 0,
            y: -6 / 10,
            numero: 5,
            recoit: false,
          ),
          Joueur(
            post: "stoppeur",
            x: 0,
            y: -3 / 10,
            numero: 4,
            recoit: false,
          ),
          Joueur(
            post: "arrières latéraux",
            x: 9 / 10,
            y: -6 / 10,
            numero: 3,
            recoit: false,
          ),
          Joueur(
            post: "arrières latéraux",
            x: -9 / 10,
            y: -6 / 10,
            numero: 2,
            recoit: false,
          ),
          Joueur(
            post: "gardien",
            x: 0,
            y: -1,
            numero: 1,
            recoit: false,
          ),
        ],
      ),
    );
  }
}
