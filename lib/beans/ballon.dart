import 'package:flutter/material.dart';

class Ballon extends AnimatedWidget {
  final icon;
  const Ballon(
      {Key? key, required Animation<double> animation, required this.icon})
      : super(key: key, listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1);
  static final _sizeTween = Tween<double>(begin: 0, end: 25);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
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
  }
}

