import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent with HasGameRef {

  Player()
  : super(
    size: Vector2.all(50.0)
  );

  @override
  Future<void> onLoad() async {
    super.onLoad();
  }
}