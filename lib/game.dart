import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/componentes/bird.dart';


class FlappyBirdGame extends FlameGame with TapDetector {
  /*
    componentes basicos del juego:
    pajaro
    fondo
    ground
    tuberias
    puntuacion
  */
  late Bird bird;
  /*
  cargar
  */
  @override
  FutureOr<void> onLoad() {
    //cargar bird
    bird = Bird();
    add(bird);
  }
  /*
  detector de tap
  */
  @override
  void onTap() {
    bird.flap();

  }
}

