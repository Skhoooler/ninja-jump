/// Animations.dart
///
/// Holds all of the animations for the player

import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/sprite.dart';
import 'package:flame/image_composition.dart';

class PlayerAnimations {
  static const double defaultPlayerSize = 450;
  static const double animationSpeed = .15;

  /// Returns the Player Idle animation
  static Future<SpriteAnimationComponent> idle() async {
    return await _setAnimation('Idle.png', 8);
  }

  /// Returns the Player Jump animation
  static Future<SpriteAnimationComponent> jump() async {
    return await _setAnimation('Jump.png', 2);
  }

  /// Returns the Player Attack animation
  static Future<SpriteAnimationComponent> attack() async {
    return await _setAnimation('Attack1.png', 2);
  }

  /// Sets the animation from the selected Player Animation Sprite Sheet file
  static Future<SpriteAnimationComponent> _setAnimation(String file, int frames) async {
    // Load the sprite sheet as an image
    final Image spriteSheetImage = await Flame.images.load(file);

    // Create a Sprite Sheet object out of the image
    final spriteSheet =
        SpriteSheet(image: spriteSheetImage, srcSize: Vector2.all(200));

    // Create an animation object out of the Sprite Sheet object
    final animation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed);

    // Return the SpriteAnimationComponent
    return SpriteAnimationComponent(
      animation: animation,
      size: Vector2.all(defaultPlayerSize),
      position: Vector2(0, 0),
    );
  }
}