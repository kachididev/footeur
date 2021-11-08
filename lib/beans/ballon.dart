import 'package:flutter/material.dart';

class Ballon extends AnimatedWidget {
  double? x, y = 0;
  Ballon({
    Key? key,
    required Animation<double> animation,
    this.x,
    this.y,
  }) : super(key: key, listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 25);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Padding(
      padding: EdgeInsets.all(5),
      child: Align(
        alignment: Alignment(x!, y!),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage("assets/ball-01.png"),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(25),
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
