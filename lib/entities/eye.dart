import 'dart:ui';

import 'package:flame/src/sprite_animation.dart';

import 'package:vector_math/vector_math_64.dart';

import 'enemy.dart';
import 'enemy_status.dart';

class EyeEnemy extends Enemy {
  late final Vector2 startingPosition;
  final double _startingHeight;

  EyeEnemy({
    required Vector2 position,
    required Vector2 size,
    required Map<EnemyStatus, SpriteAnimation> animations,
    double? startingHeight,
  })  : _startingHeight = startingHeight ?? size[1] / 2,
        super(position: position, size: size, animations: animations);

  @override
  Future<void> onLoad() async {
    startingPosition = Vector2(size[0] + 100, _startingHeight);
    current = EnemyStatus.running;
    await super.onLoad();
  }
  @override
  void render(Canvas canvas) {
    super.render(canvas);
    transform.scale;// = Vector2(-1, 0);
  }
}
