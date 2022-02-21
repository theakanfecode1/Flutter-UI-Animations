import 'package:flutter/material.dart';
import 'dart:math';


class FlipRoute extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;
  FlipRoute(this.exitPage, this.enterPage)
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => enterPage,
    transitionsBuilder: _transitionsBuilder(exitPage, enterPage),
  );

  static _transitionsBuilder(exitPage, enterPage) =>
          (context, animation, secondaryAnimation, child) {
        return Stack(
          children: <Widget>[
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset.zero,
                end: Offset(-1.0, 0.0),
              ).animate(animation),
              child: Container(
                color: Colors.white,
                child: Transform(
                  transform: Matrix4.rotationY(animation.value),
                  alignment: FractionalOffset.centerRight,
                  child: exitPage,
                ),
              ),
            ),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: Container(
                color: Colors.black,
                child: Transform(
                  transform: Matrix4.rotationY(min(animation.value, pi / 2)),
                  alignment: FractionalOffset.center,
                  child: enterPage,
                ),
              ),
            )
          ],
        );
      };
}