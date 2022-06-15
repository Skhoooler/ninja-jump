import 'dart:ui';

import 'package:flame/src/sprite_animation.dart';
import 'package:ninja_jump/entities/player.dart';

import 'package:vector_math/vector_math_64.dart';

import 'enemy.dart';
import 'enemy_status.dart';

class EyeEnemy extends Enemy {
  late final Vector2 startingPosition;
  final double _startingHeight;
  final Vector2 _screenSize;
  final double speed;

  EyeEnemy({
    required Vector2 position,
    required Vector2 size,
    required Map<EnemyStatus, SpriteAnimation> animations,
    required Vector2 screenSize,
    double? startingHeight,
    double? speed,
  })  : _startingHeight = startingHeight ?? -20,
        _screenSize = screenSize,
        speed = 5,
        super(position: position, size: size, animations: animations);

  @override
  void update(double dt) async {
    if (Player.isMoving()) {
      x -= speed;
    }

    super.update(dt);
  }

  @override
  Future<void> onLoad() async {
    startingPosition = Vector2(_screenSize.x * 1.5, _startingHeight);
    position = startingPosition;

    current = EnemyStatus.running;

    transform.scale = Vector2(-1, 1);
    await super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }
}
