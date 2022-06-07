import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();

  final game = NinjaJumpGame();

  runApp(GameWidget(game: game));
}

/// This class encapulates the whole game.
class NinjaJumpGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    final idleSpriteSheetImage = await images.load('Idle.png');
    final idleSpriteSheet =
        SpriteSheet(image: idleSpriteSheetImage, srcSize: Vector2.all(200));
    final idleAnimation = idleSpriteSheet.createAnimation(row: 0, stepTime: .15);

    final playerComponent = SpriteAnimationComponent(
      animation: idleAnimation,
      size: Vector2(200, 200),
    );

    add(playerComponent);
  }
}
