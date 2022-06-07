
import 'dart:async';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';

import 'package:flutter/material.dart';

import 'package:ninja_jump/components/player.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();

  final game = NinjaJumpGame();

  runApp(GameWidget(game: game));
}

/// This class encapulates the whole game.
class NinjaJumpGame extends FlameGame with HasCollidables {
  @override
  Future<void> onLoad() async {
    unawaited(add(RocketComponent(position: size / 2, size: Vector2.all(20))));

    return super.onLoad();
  }
}