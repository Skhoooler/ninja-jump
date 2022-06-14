import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import '../main.dart';

class BackgroundComponent extends ParallaxComponent<NinjaJumpGame>{
  @override
  Future<void> onLoad() async {
    parallax = await gameRef.loadParallax([
      ParallaxImageData('back 3.png'),
      ParallaxImageData('back 2.png'),
      ParallaxImageData('back 1.png')
    ]);
  }
}