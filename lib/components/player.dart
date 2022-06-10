/// Player.dart
///
/// Handles all of the behaviors and animations of the player

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';

import 'package:ninja_jump/entity_status.dart';

class Player extends SpriteAnimationGroupComponent
    with HasGameRef, CollisionCallbacks {

  static double animationSpeed = .15;
  static Vector2 startingPosition = Vector2(-150, 100);


  int _jumpFrames = 20;
  static bool jumping = false;

  int _fallFrames = 20;
  static bool falling = false;

  /// Constructor takes an SpriteAnimationComponent
  Player({
    required Vector2 position,
    required Vector2 size,
    required Map<PlayerStatus, SpriteAnimation> animations,
  }) : super(position: position, size: size, animations: animations);


  @override
  void update(double dt) async {
    if (jumping) {
      // Set the player to jumping animation
      current = PlayerStatus.jumping;

      // If the player still has jump frames, add 10 to its height, and decrease
      // the its jump frames by 1
      if (_jumpFrames > 0) {
        y -= 11; // Apparently, down is up, so -10 to go up 10 pixels
        _jumpFrames -= 1;
      }
      // Reset the jump values, set the player to fall
      else {
        jumping = false;
        _jumpFrames = 20;

        falling = true;
      }
    }
    if (falling) {
      // Set the player to falling animation
      current = PlayerStatus.falling;

      // If the player still has fall frames, subtract 10 from its height, and
      // decrease its fall frames by 1
      if (_fallFrames > 0) {
        y += 11;
        _fallFrames -= 1;
      }
      // Reset the fall value, set the player to run
      else {
        falling = false;
        _fallFrames = 20;

        current = PlayerStatus.running;
      }
    }
  }

  /// Calls this when the player component is loaded in for the first time
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    position = startingPosition;
    current = PlayerStatus.idle;
  }
}
