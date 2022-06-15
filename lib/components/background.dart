import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:ninja_jump/entities/player.dart';
import '../main.dart';

class BackgroundComponent extends ParallaxComponent<NinjaJumpGame> {
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax(
      [
        ParallaxImageData('back 3.png'),
        ParallaxImageData('back 2.png'),
        ParallaxImageData('back 1.png')
      ],
      velocityMultiplierDelta: Vector2(2, 0),
      baseVelocity: Vector2(0, 0),
    );
  }
  @override
  void update(double dt) {
    if (Player.isMoving()){
      parallax?.baseVelocity = Vector2(30, 0);

    }

    super.update(dt);
  }
}
