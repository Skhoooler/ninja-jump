import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';

import 'package:flutter/material.dart';

import 'package:ninja_jump/components/player.dart';
import 'package:ninja_jump/animations/playerAnimations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();

  final game = NinjaJumpGame();

  runApp(GameWidget(game: game));
}

/// This class encapsulates the whole game.
class NinjaJumpGame extends FlameGame {
  final Vector2 startingPosition = Vector2(-150, 100);

  @override
  Future<void> onLoad() async {
    /*final idleSpriteSheetImage = await images.load('Idle.png');
    final idleSpriteSheet =
        SpriteSheet(image: idleSpriteSheetImage, srcSize: Vector2.all(200));
    final idleAnimation =
        idleSpriteSheet.createAnimation(row: 0, stepTime: .15);

    Player player = Player(
        playerAnimation: SpriteAnimationComponent(
            animation: idleAnimation,
            size: Vector2.all(450),
            position: Vector2(0, 0),));//Vector2(-150, 100)));
    add(player.playerAnimation);*/

    PlayerAnimations.idle().then((animation) {
      Player player = Player(playerAnimation: animation);
      player.setPositionByVector(startingPosition);
      add(player.playerAnimation);
    });
  }
}
