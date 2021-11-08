import 'package:flutter/material.dart';

class Joueur extends StatefulWidget {

  int? numero;
  double? x, y;
  String? post;
  bool? recoit;

  Joueur({this.numero, this.x,this.y, this.post,this.recoit});

  @override
  State<StatefulWidget> createState() {
    return _Joueur();
  }

}

class _Joueur extends State<Joueur> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Align(
        alignment: Alignment(widget.x!,widget.y!),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            height: 50,
            width: 50,
            child: Center(
              child: Text("${widget.numero}",
                style: TextStyle(
                    color: widget.recoit! ? Colors.blue: Colors.red,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25)
            ),
          ),
        ),
      ),
    );
  }

}