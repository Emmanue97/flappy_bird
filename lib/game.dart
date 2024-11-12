import 'dart:async';
import 'dart:ffi';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappy_bird/componentes/background.dart';
import 'package:flappy_bird/componentes/bird.dart';
import 'package:flappy_bird/componentes/ground.dart';
import 'package:flappy_bird/componentes/pipe_manager.dart';
import 'package:flappy_bird/componentes/score.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flutter/material.dart';

import 'componentes/pipe.dart';


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
  late PipeManager pipeManager;
  late ScoreText scoreText;
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
    //cargar tuverias
    pipeManager = PipeManager();
    add (pipeManager);
    //cargar puntuacion
    scoreText = ScoreText();
    add(scoreText);

  }
  /*
  detector de tap
  */
  @override
  void onTap() {
    bird.flap();
  }
  /*
  Score

  */
  int score = 0;

  void incrementScore(){
    score += 1;
  }

  /*
  Game over

  */
  bool isGameOver = false;

  void gameOver(){
    if (isGameOver) return;

    isGameOver = true;
    pauseEngine();

    //dialogo game over
    showDialog(
    context:buildContext!,
    builder:(context) => AlertDialog(
      title: const Text("Game over"),
      content: Text("Puntuacion: $score" ),
      actions: [
        TextButton(onPressed: () {
          //cambio
          Navigator.pop(context);
          //reinicio
          resetGame();
        } ,
        child: const Text("Restar"))
      ],
    ),
    );
  }
  
  void resetGame(){
    bird.position = Vector2(birdStartx, birdStarty);
    bird.velocity = 0;
    score = 0;
    isGameOver = false;
    //remove las tuverias del juego
    children.whereType<Pipe>().forEach((Pipe pipe)=> pipe.removeFromParent());
    resumeEngine();

  }
}

