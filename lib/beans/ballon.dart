import 'package:flutter/material.dart';

class Ballon extends AnimatedWidget {
  late double xd = 0, yd = 0;
  late double xa = 0, ya = 0;

  Ballon({
    Key? key,
    required Animation<double> animation,
    required this.xa,
    required this.ya,
    required this.xd,
    required this.yd,
  }) : super(key: key, listenable: animation) {
    _yTween = Tween<double>(begin: ya, end: yd);
    _xTween = Tween<double>(begin: xa, end: xd);
  }

  // Make the Tweens static because they don't change.
  var _yTween; // = Tween<double>(begin: xa, end: xd);
  var _xTween; // = Tween<double>(begin: 0, end: 25);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Align(
        alignment:
            Alignment(_xTween.evaluate(animation), _yTween.evaluate(animation)),
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
      ),
    );

    /*
    Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: Icon(
            icon,
            size: _sizeTween.evaluate(animation),
          ),
        ),
      ),
    );
    */
  }
}
