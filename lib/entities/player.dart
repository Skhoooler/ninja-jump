/// Player.dart
///
/// Handles all of the behaviors and entities of the player

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';

import 'package:ninja_jump/entities/player_status.dart';

import 'enemy.dart';

class Player extends SpriteAnimationGroupComponent
    with HasGameRef, CollisionCallbacks {

  static double animationSpeed = .15;
  static Vector2 startingPosition = Vector2(-150, 100);

  double _jumpIndex = -50;
  double jumpSpeed = 1.4;
  static bool jumping = false;
  static bool falling = false;
  static bool moving = false;
  static bool alive = true;

  /// Constructor takes an SpriteAnimationComponent
  Player({
    required Vector2 position,
    required Vector2 size,
    required Map<PlayerStatus, SpriteAnimation> animations,
  }) : super(position: position, size: size, animations: animations);

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    if (other is Enemy) {
      alive = false;
    }

    super.onCollision(intersectionPoints, other);
  }


  @override
  void update(double dt) async {
    super.update(dt);

    /// Handle Jumping
    if (alive) {
      if (jumping) {
        current = PlayerStatus.jumping;

        y = startingPosition.y - (-(.1 * _jumpIndex * _jumpIndex) + 250);
        _jumpIndex += jumpSpeed;

        if (_jumpIndex > 0 && _jumpIndex < 50) {
          current = PlayerStatus.falling;
        }
        else if (_jumpIndex > 50) {
          y = startingPosition.y;
          current = PlayerStatus.running;
          jumping = false;
          _jumpIndex = -50;
        }
        moving = true;
      }
    } else {
      current = PlayerStatus.dying;
      moving = false;
    }
  }

  /// Calls this when the player component is loaded in for the first time
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    //add(RectangleHitbox());
    position = startingPosition;
    current = PlayerStatus.idle;
  }

  static bool isMoving() => moving;
}
