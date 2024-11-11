import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/componentes/background.dart';
import 'package:flappy_bird/componentes/bird.dart';
import 'package:flappy_bird/componentes/ground.dart';


class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  /*
    componentes basicos del juego:
    pajaro
    fondo
    ground
    tuberias
    puntuacion
  */
  late Bird bird;
  late Background background;
  late Ground ground;
  /*
  cargar
  */
  @override
  FutureOr<void> onLoad() {
    // cargar back
    background = Background(size);
    add(background);
     //cargar bird
    bird = Bird();
    add(bird);
    //cargar ground
    ground = Ground();
    add (ground);
  }
  /*
  detector de tap
  */
  @override
  void onTap() {
    bird.flap();

  }

  /*
  Game over

  */
  bool isGameOver = false;

  void gameOver(){
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();
  }
}

