import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';

import 'enemy_status.dart';

abstract class Enemy extends SpriteAnimationGroupComponent
    with HasGameRef, CollisionCallbacks {

  bool _alive;

  Enemy({
    required Vector2 position,
    required Vector2 size,
    required Map<EnemyStatus, SpriteAnimation> animations,
}) : _alive = true, super(position: position, size: size, animations: animations);

  void resize(Size size) {}

  bool isDead() {
    return _alive;
  }


}
