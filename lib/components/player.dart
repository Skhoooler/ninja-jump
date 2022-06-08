/// Player.dart
///
/// Handles all of the behaviors and animations of the player

import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';

class Player extends SpriteAnimationComponent with HasGameRef {
  /// Player fields
  SpriteAnimationComponent playerAnimation;

  /// Constructor takes an SpriteAnimationComponent
  Player({required this.playerAnimation}) : super();

  /// Sets the size of the player animation (assumes it is a square)
  void setSize(double size) {
    playerAnimation.size = Vector2.all(size);
  }

  /// Sets the position of the player animation
  void setPosition(double x, double y) {
    playerAnimation.position = Vector2(x, y);
  }
  void setPositionByVector(Vector2 position) {
    playerAnimation.position = position;
  }
}
