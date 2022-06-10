import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flutter/rendering.dart';

import 'package:ninja_jump/components/player.dart';

/// Handles taps on the left side of the screen which cause the
/// player to jump

class JumpController extends PositionComponent with HasGameRef, TapCallbacks {

  double width;
  double height;

  JumpController({
    required this.width,
    required this.height,
  }) : super(anchor: Anchor.centerLeft);


  // Make it transparent. It is only for receiving input from the player
  final _transparentPaint = Paint()
    ..color = const Color(0xFF245600);

  @override
  void onTapDown(TapDownEvent event) {
    // Set the player to jump
    Player.jumping = true;
  }

  /// Handles rendering the Jump Controller
  @override
  void render(Canvas canvas) {
    size[0] = width;
    canvas.drawRect(size.toRect(), _transparentPaint);
  }
}