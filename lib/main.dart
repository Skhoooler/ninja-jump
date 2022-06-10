import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';

import 'package:ninja_jump/components/player.dart';
import 'package:ninja_jump/components/jump_controller.dart';
import 'package:ninja_jump/entity_status.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();

  final game = NinjaJumpGame();

  runApp(GameWidget(game: game));
}

/// This class encapsulates the whole game.
class NinjaJumpGame extends FlameGame
    with HasCollisionDetection, HasTappableComponents {
  final Vector2 startingPosition = Player.startingPosition;
  final double animationSpeed = Player.animationSpeed;

  @override
  void onTapDown(TapDownEvent event) {
    Player.jumping = true;
  }
  
  /// Load the animations into the game
  @override
  Future<void> onLoad() async {
    // Set the player animation to idle at the beginning of the game
    /*PlayerAnimations.attack().then((animation) {
      Player player =
          Player(playerAnimation: animation, status: PlayerStatus.idle);
      player.setPositionByVector(startingPosition);
      add(player.playerAnimation);
    });*/

    /// Load the Jump Controller
    /*unawaited(
      add(
        JumpController(width: size[0], height: size[1]),
      ),
    );*/

    /// Load Player Animations
    // Player Idle Animation
    final playerIdle = await loadSpriteAnimation(
        "Idle.png",
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Jump Animation
    final playerJump = await loadSpriteAnimation(
        "Jump.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Fall Animation
    final playerFall = await loadSpriteAnimation(
        "Fall.png",
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Run Animation
    final playerRun = await loadSpriteAnimation(
        "Run.png",
        SpriteAnimationData.sequenced(
          amount: 8,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Attack1 Animation
    final playerAttack1 = await loadSpriteAnimation(
        "Attack1.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Attack2 Animation
    final playerAttack2 = await loadSpriteAnimation(
        "Attack2.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Die Animation
    final playerDeath = await loadSpriteAnimation(
        "Death.png",
        SpriteAnimationData.sequenced(
          amount: 6,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Player Take Hit Animation
    final playerHit = await loadSpriteAnimation(
        "Take Hit - white silhouette.png",
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: animationSpeed,
          textureSize: Vector2(200, 200),
        ));

    // Map Containing all player animations
    final playerAnimations = {
      PlayerStatus.idle: playerIdle,
      PlayerStatus.running: playerRun,
      PlayerStatus.dying: playerDeath,
      PlayerStatus.falling: playerFall,
      PlayerStatus.jumping: playerJump,
      PlayerStatus.attacking1: playerAttack1,
      PlayerStatus.attacking2: playerAttack2,
      PlayerStatus.hit: playerHit,
    };

    // Add the player component to the Flame component Tree
    unawaited(
      add(
        Player(
          position: size / 2,
          size: Vector2.all(450),
          animations: playerAnimations,
        ),
      ),
    );
    Iterable<Component> descendant = descendants();

    // Return
    return super.onLoad();
  }
}
