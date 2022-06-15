import 'dart:ui';

import 'enemy.dart';

EnemiesFactory enemiesFactory = EnemiesFactory();

class EnemiesFactory {
  List<Enemy> enemies;
  Size _size = Size(0,0);
  double _time = 0;
  EnemiesFactory() : enemies = List<Enemy>.empty();

  @override
  void render(Canvas canvas) {
    for (var enemy in enemies) {
      enemy.render(canvas);
    }
  }

  @override
  void resize(Size size) {
    _size = size;
    for (var enemy in enemies) {
      enemy.resize(size);
    }
  }

  @override
  void update(double t) {
    // Update each enemy
    for (var enemy in enemies) {
      enemy.update(t);
    }

    // Check if any of them have collided or died
    for (int i = enemies.length - 1; i >= 0; i--) {
      if (enemies.elementAt(i).isDead()){
        enemies.removeAt(i);
      }
    }

    // Spawning
    _time += t;
    if (_time > 1) {
      _time -= 1;
      if (enemies.length < 2){

      }
    }
  }
}
