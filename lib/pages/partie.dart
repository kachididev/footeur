import 'dart:async';
import 'dart:math';
import 'package:rive/rive.dart';
import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:footeur/beans/ballon.dart';
import 'package:footeur/beans/joueur.dart';

import 'temps.dart';

class Partie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Partie();
  }
}

class _Partie extends State<Partie> with SingleTickerProviderStateMixin {
  late double xa = 0, ya = 0;
  String titre = 'vide';

  @override
  void dispose() {
    //time!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  int mesBut = 0;
  int butAdv = 1;

  bool anim = true;

  bool corner = false; //corner = true;
  bool penalite = false; //penalite = true;
  bool out = false;

  bool adversaire = false;
  int numeroDuJoueur = 1;
  //
  double constance = 0.09;
  //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: 100,
                child: TempsDeJeu(),
                color: Colors.red.shade900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: 60,
                width: 50,
                child: Center(
                  child: Text(
                    "$mesBut",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                color: Colors.yellow.shade900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Transform.rotate(
                angle: 53.4,
                transformHitTests: false,
                child: Container(
                  height: 60,
                  width: 50,
                  child: Center(
                    child: Text(
                      "$butAdv",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  color: Colors.yellow.shade900,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: 100,
                child: Transform.rotate(
                  angle: 53.4,
                  transformHitTests: false,
                  child: TempsDeJeu(),
                ),
                color: Colors.blue.shade900,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              left: 50,
              right: 50,
              bottom: 50,
            ),
            child: Stack(
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
                  y: -0.05,
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
                  y: -0.05,
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
                  y: 0.9 / 10,
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
                  y: -0.9 / 10,
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
                //////////////////////////////
                adversaire
                    ? Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment(0.5, -6 / 10),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(75),
                            ),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(75),
                                  ),
                                ),
                                onPressed: jouer,
                                child: Text("Jouer"),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment(-0.5, 6 / 10),
                          child: Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(75),
                            ),
                            child: Container(
                              height: 150,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(75),
                                  ),
                                ),
                                onPressed: jouer,
                                child: Text("Jouer"),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(75),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                //////////////////////////////
                AnimatedAlign(
                  alignment: Alignment(xa, ya),
                  duration: const Duration(milliseconds: 1000),
                  child: maBalle(),
                ),
                adversaire
                    ? Padding(
                        padding: const EdgeInsets.all(5),
                        child: Align(
                          alignment: const Alignment(-0.6, -6 / 10),
                          child: Card(
                            elevation: 2,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: ExactAssetImage("assets/$titre.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Padding(
                        padding: EdgeInsets.all(5),
                        child: Align(
                          alignment: Alignment(0.6, 6 / 10),
                          child: Card(
                            elevation: 2,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.transparent,
                                image: DecorationImage(
                                  image: ExactAssetImage("assets/$titre.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                //////////////////////////////
                AnimatedAlign(
                  alignment: Alignment(xa, ya),
                  duration: const Duration(milliseconds: 1000),
                  child: maBalle(),
                ),
                /*
          AnimatedAlign(
            alignment: const Alignment(1, -1),
            duration: const Duration(milliseconds: 1000),
            child: maBalle(),
          ),
          */
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //but();
        },
        child: Icon(Icons.dialer_sip),
      ),
    );
  }

  void jouer() {
    Random rnd = new Random();
    //int r = min + rnd.nextInt(max - min);
    int d1 = rnd.nextInt(7);
    int d2 = rnd.nextInt(7);

    d1 = d1 == 0 ? 1 : d1;
    if (penalite || out || corner) {
      d2 = 0;
      corner = false;
      out = false;
      penalite = false;
    } else if (d2 == 0) {
      d2 = 1;
    } else {
      d2 = d2;
    }
    //d2 = penalite || out || corner
    //  ? d2
    //: d2 == 0
    //  ? 1
    //: d2;
    //
    if (adversaire) {
      //adversaire
      //
      notreAction(d1 + d2); //d1 + d2
    } else {
      //
      adversaireAction(d1 + d2); //d1 + d2
    }

    //
    setState(() {
      print("jouer! $adversaire == $d1  +  $d2");
    });
  }

  void jourPenalite() {
    //
  }

  notreAction(int valeur) {
    //
    if (numeroDuJoueur == 1) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: (6 / 10));
        //
        numeroDuJoueur = 5;
        adversaire = false;
        titre = "5b";
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        //
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 0.5);
        numeroDuJoueur = 9;
        adversaire = true;
        titre = "9r";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 9 / 10, y: -0.05);
        numeroDuJoueur = 10;
        adversaire = false;
        titre = "10b";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //Il a marqué!//
        moveBall(x: 0, y: 0);
        adversaire = true;
        titre = "vide";
      }
    } else if (numeroDuJoueur == 2) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 6 / 10);
        numeroDuJoueur = 5;
        adversaire = false;
        titre = "5b";
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.05);
        numeroDuJoueur = 10;
        adversaire = true;
        titre = "10r";
      } else if (valeur == 4) {
        //
        moveBall(x: 0, y: 3 / 10);
        numeroDuJoueur = 4;
        adversaire = false;
        titre = "4b";
      } else if (valeur == 5) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = false;
        titre = "6b";
      } else if (valeur == 7) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: 9 / 10, y: -0.5);
        numeroDuJoueur = 7;
        adversaire = false;
        titre = "7b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        //But//
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 3) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 1);
        numeroDuJoueur = 1;
        adversaire = false;
        titre = "1b";
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.05);
        numeroDuJoueur = 10;
        adversaire = true;
        titre = "10r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: -(9 / 10), y: -0.05);
        numeroDuJoueur = 8;
        adversaire = false;
        titre = "8b";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 4) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 6 / 10);
        numeroDuJoueur = 5;
        adversaire = false;
        titre = "5b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: -(9 / 10), y: 6 / 10);
        numeroDuJoueur = 3;
        adversaire = false;
        titre = "3b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 9) {
        //
        moveBall(x: -9 / 10, y: -6 / 10);
        numeroDuJoueur = 2;
        adversaire = true;
        titre = "2r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 5) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 3 / 10);
        numeroDuJoueur = 4;
        adversaire = false;
        titre = "4b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11b";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: -(9 / 10), y: 6 / 10);
        numeroDuJoueur = 3;
        adversaire = false;
        titre = "3b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 9) {
        //
        moveBall(x: -9 / 10, y: -6 / 10);
        numeroDuJoueur = 2;
        adversaire = true;
        titre = "2r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 6) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 4) {
        //
        moveBall(x: -(9 / 10), y: -0.05);
        numeroDuJoueur = 8;
        adversaire = false;
        titre = "8b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 3 / 10);
        numeroDuJoueur = 4;
        adversaire = false;
        titre = "4b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; But
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      } else if (valeur == 9) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = false;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 7) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        ///
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 4) {
        //
        moveBall(x: -(9 / 10), y: -0.05);
        numeroDuJoueur = 8;
        adversaire = false;
        titre = "8b";
      } else if (valeur == 5) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = false;
        titre = "6b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -6 / 10);
        numeroDuJoueur = 5;
        adversaire = true;
        titre = "5r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; But
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; Penalty
        adversaire = false;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; But
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 8) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: -(9 / 10), y: 6 / 10);
        numeroDuJoueur = 3;
        adversaire = false;
        titre = "3b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: -6 / 10);
        numeroDuJoueur = 3;
        adversaire = true;
        titre = "3r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -6 / 10);
        numeroDuJoueur = 5;
        adversaire = true;
        titre = "5r";
      } else if (valeur == 8) {
        //
        moveBall(x: -1, y: -1);
        //numeroDuJoueur = 5; corner
        corner = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: 0.5);
        numeroDuJoueur = 9;
        adversaire = true;
        titre = "9r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: -0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; But
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 9) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = false;
        titre = "6b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: -0.5);
        numeroDuJoueur = 7;
        adversaire = false;
        titre = "7b";
      } else if (valeur == 5) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: -0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -6 / 10);
        numeroDuJoueur = 5;
        adversaire = true;
        titre = "5r";
      } else if (valeur == 8) {
        //
        moveBall(x: 1, y: -1);
        //numeroDuJoueur = 5; Corner
        corner = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; But
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: 1);
        //numeroDuJoueur = 5; Out
        adversaire = true;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 10) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 1);
        //numeroDuJoueur = 5; Out
        adversaire = true;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.05);
        numeroDuJoueur = 10;
        adversaire = true;
        titre = "10r";
      } else if (valeur == 4) {
        //
        moveBall(x: 0, y: 1);
        //numeroDuJoueur = 5; Out
        adversaire = true;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 5) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 6) {
        //
        moveBall(x: 9 / 10, y: -0.5);
        numeroDuJoueur = 7;
        adversaire = false;
        titre = "7b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: -1, y: -1);
        //numeroDuJoueur = 5; Corner
        corner = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: -0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 11) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //Out
        //
        moveBall(x: 0, y: 1);
        //numeroDuJoueur = 5;
        adversaire = true;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 4) {
        //
        moveBall(x: 0, y: 1);
        //numeroDuJoueur = 5; Out
        adversaire = true;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 5) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 6) {
        //
        moveBall(x: 1, y: -1);
        //numeroDuJoueur = 5; Corner
        corner = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 7) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; But
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 10) {
        //
        moveBall(x: 9 / 10, y: -0.05);
        numeroDuJoueur = 10;
        adversaire = false;
        titre = "10b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = false;
        titre = "vide";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: -0.9 / 10);
        adversaire = true;
        titre = "vide";
        showMessage("Jolie but");
      }
      //
    }
    //
  }

  //notreActionIndividuel(int numeroJoueur, int numeroDe)
  Widget maBalle() {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: ExactAssetImage("assets/ball-01.png"),
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  //
  adversaireAction(int valeur) {
    //
    if (numeroDuJoueur == 1) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 6 / 10);
        numeroDuJoueur = 5;
        adversaire = false;
        titre = "5b";
      } else if (valeur == 3) {
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 4) {
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 6) {
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 7) {
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        moveBall(x: 9 / 10, y: -0.05);
        numeroDuJoueur = 10;
        adversaire = false;
        titre = "10b";
      } else if (valeur == 9) {
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        moveBall(x: 0, y: 0);
        //Il a marqué!
        //numeroDuJoueur = 5;
        titre = "vide";
        adversaire = false;
      }
    } else if (numeroDuJoueur == 2) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 6 / 10);
        numeroDuJoueur = 5;
        adversaire = false;
        titre = "5b";
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.05);
        numeroDuJoueur = 10;
        adversaire = true;
        titre = "10r";
      } else if (valeur == 4) {
        //
        moveBall(x: 0, y: 3 / 10);
        numeroDuJoueur = 4;
        adversaire = false;
        titre = "4b";
      } else if (valeur == 5) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = false;
        titre = "6b";
      } else if (valeur == 7) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: 9 / 10, y: -0.5);
        numeroDuJoueur = 7;
        adversaire = false;
        titre = "7b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0.9 / 10);
        adversaire = false;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 3) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 1);
        numeroDuJoueur = 1;
        adversaire = false;
        titre = "1b";
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.05);
        numeroDuJoueur = 10;
        adversaire = true;
        titre = "10r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: -(9 / 10), y: -0.05);
        numeroDuJoueur = 8;
        adversaire = false;
        titre = "8b";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0.9 / 10);
        adversaire = false;
        titre = "vide";
        showMessage("Jolie but");
      }
    } else if (numeroDuJoueur == 4) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 6 / 10);
        numeroDuJoueur = 5;
        adversaire = false;
        titre = "5b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: -(9 / 10), y: 6 / 10);
        numeroDuJoueur = 3;
        adversaire = false;
        titre = "3b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 9) {
        //
        moveBall(x: -9 / 10, y: -6 / 10);
        numeroDuJoueur = 2;
        adversaire = true;
        titre = "2r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0);
        adversaire = true;
        titre = "vide";
        showMessage("vous avez marqué!!! Yooooooh!");
      }
    } else if (numeroDuJoueur == 5) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 3 / 10);
        numeroDuJoueur = 4;
        adversaire = false;
        titre = "4b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: -(9 / 10), y: 6 / 10);
        numeroDuJoueur = 3;
        adversaire = false;
        titre = "3b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 9) {
        //
        moveBall(x: -9 / 10, y: -6 / 10);
        numeroDuJoueur = 2;
        adversaire = true;
        titre = "2r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0);
        adversaire = true;
        titre = "vide";
        showMessage("Joli Buuuutt!!!");
      }
    } else if (numeroDuJoueur == 6) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 4) {
        //
        moveBall(x: -(9 / 10), y: -0.05);
        numeroDuJoueur = 8;
        adversaire = false;
        titre = "8b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 3 / 10);
        numeroDuJoueur = 4;
        adversaire = false;
        titre = "4b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        //numeroDuJoueur = 5; But
        adversaire = false;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 10) {
        //
        moveBall(x: -(9 / 10), y: -0.5);
        numeroDuJoueur = 11;
        adversaire = false;
        titre = "11b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0.9 / 10);
        adversaire = false;
        titre = "vide";
        showMessage("Joli Buuuutt!!!");
      }
    } else if (numeroDuJoueur == 7) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //Out//
        moveBall(x: 0, y: -1);
        //numeroDuJoueur = 8;
        titre = "vide";
        adversaire = false;
        showMessage("Sortie de ball");
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 4) {
        //
        moveBall(x: -(9 / 10), y: -0.05);
        numeroDuJoueur = 8;
        adversaire = false;
        titre = "8b";
      } else if (valeur == 5) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = false;
        titre = "6b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -6 / 10);
        numeroDuJoueur = 5;
        adversaire = true;
        titre = "5r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        //numeroDuJoueur = 5; But
        adversaire = false;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: 0);
        //numeroDuJoueur = 5; Penalty
        adversaire = true;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        //numeroDuJoueur = 5; But
        adversaire = false;
        titre = "vide";
      }
    } else if (numeroDuJoueur == 8) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: -(9 / 10), y: 6 / 10);
        numeroDuJoueur = 3;
        adversaire = false;
        titre = "3b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: -6 / 10);
        numeroDuJoueur = 3;
        adversaire = true;
        titre = "3r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: 6 / 10);
        numeroDuJoueur = 2;
        adversaire = false;
        titre = "2b";
      } else if (valeur == 5) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: -0.5);
        numeroDuJoueur = 9;
        adversaire = false;
        titre = "9b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -6 / 10);
        numeroDuJoueur = 5;
        adversaire = true;
        titre = "5r";
      } else if (valeur == 8) {
        //
        moveBall(x: -1, y: 1);
        //numeroDuJoueur = 5; corner
        corner = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: 0.5);
        numeroDuJoueur = 9;
        adversaire = true;
        titre = "9r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: 0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        //numeroDuJoueur = 5; But
        adversaire = false;
        titre = "vide";
      }
    } else if (numeroDuJoueur == 9) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: 0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = false;
        titre = "6b";
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 4) {
        //
        moveBall(x: 9 / 10, y: -0.5);
        numeroDuJoueur = 7;
        adversaire = false;
        titre = "7b";
      } else if (valeur == 5) {
        //
        moveBall(x: 0, y: -3 / 10);
        numeroDuJoueur = 4;
        adversaire = true;
        titre = "4r";
      } else if (valeur == 6) {
        //
        moveBall(x: 0, y: 0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -6 / 10);
        numeroDuJoueur = 5;
        adversaire = true;
        titre = "5r";
      } else if (valeur == 8) {
        //
        moveBall(x: 1, y: 1);
        //numeroDuJoueur = 5; Corner
        corner = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        //numeroDuJoueur = 5; But
        adversaire = false;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        //numeroDuJoueur = 5; Out
        adversaire = false;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0.9 / 10);
        adversaire = false;
        titre = "vide";
        showMessage("Joli Buuuutt!!!");
      }
    } else if (numeroDuJoueur == 10) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //
        moveBall(x: 0, y: -1);
        //numeroDuJoueur = 5; Out
        adversaire = false;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 3) {
        //
        moveBall(x: -9 / 10, y: 0.05);
        numeroDuJoueur = 10;
        adversaire = true;
        titre = "10r";
      } else if (valeur == 4) {
        //
        moveBall(x: 0, y: -1);
        //numeroDuJoueur = 5; Out
        adversaire = false;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 5) {
        //
        moveBall(x: 9 / 10, y: 0.5);
        numeroDuJoueur = 11;
        adversaire = true;
        titre = "11r";
      } else if (valeur == 6) {
        //
        moveBall(x: 9 / 10, y: -0.5);
        numeroDuJoueur = 7;
        adversaire = false;
        titre = "7b";
      } else if (valeur == 7) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 8) {
        //
        moveBall(x: -1, y: 1);
        //numeroDuJoueur = 5; Corner
        corner = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 9) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 10) {
        //
        moveBall(x: 0, y: 0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 12) {
        //But//
        moveBall(x: 0, y: 0.9 / 10);
        adversaire = false;
        titre = "vide";
        showMessage("Joli Buuuutt!!!");
      }
    } else if (numeroDuJoueur == 11) {
      if (valeur == 1) {
        //N'arrivera jamais dans ce context
      } else if (valeur == 2) {
        //Out//
        moveBall(x: 0, y: -1);
        adversaire = false;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 3) {
        //
        moveBall(x: 9 / 10, y: 0.05);
        numeroDuJoueur = 8;
        adversaire = true;
        titre = "8r";
      } else if (valeur == 4) {
        //
        moveBall(x: 0, y: -1);
        //numeroDuJoueur = 5; Out
        adversaire = false;
        titre = "vide";
        showMessage("Sortie de ball");
      } else if (valeur == 5) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        numeroDuJoueur = 6;
        adversaire = true;
        titre = "6r";
      } else if (valeur == 6) {
        //
        moveBall(x: 1, y: 1);
        //numeroDuJoueur = 5; Corner
        corner = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 7) {
        //
        moveBall(x: -9 / 10, y: 0.5);
        numeroDuJoueur = 7;
        adversaire = true;
        titre = "7r";
      } else if (valeur == 8) {
        //
        moveBall(x: 0, y: -0.9 / 10);
        //numeroDuJoueur = 5; But
        adversaire = false;
        titre = "vide";
        showMessage("Joli Buuuutt!!!");
      } else if (valeur == 9) {
        //
        moveBall(x: 0, y: -1);
        numeroDuJoueur = 1;
        adversaire = true;
        titre = "1r";
      } else if (valeur == 10) {
        //
        moveBall(x: 9 / 10, y: -0.05);
        numeroDuJoueur = 10;
        adversaire = false;
        titre = "10b";
      } else if (valeur == 11) {
        //
        moveBall(x: 0, y: 0.76);
        //numeroDuJoueur = 5; Penalité
        penalite = true;
        adversaire = true;
        titre = "vide";
      } else if (valeur == 12) {
        //But//
        adversaire = false;
        moveBall(x: 0, y: 0.9 / 10);
        titre = "vide";
        showMessage("Joli Buuuutt!!!");
      }
      //
    }
    //
  }

  //
  moveBall({double x: 0, double y: 0}) {
    xa = x == 0 && y == 0 ? 0 : x + constance;
    ya = y;
  }

  //
  showMessage(String message) {
    print(message);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.down,
        backgroundColor: Colors.black,
        duration: const Duration(seconds: 4),
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  but() {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pop();
    });
    showDialog(
        context: context,
        builder: (context) {
          return Material(
            color: Colors.transparent,
            child: Center(
              child: Container(
                height: 200,
                width: 200,
                child: RiveAnimation.asset(
                  'assets/liquid_download.riv',
                ),
              ),
            ),
          );
        });
  }
}
