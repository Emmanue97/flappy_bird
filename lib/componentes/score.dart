import 'dart:async';
import 'package:flame/components.dart';
import 'package:flappy_bird/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ScoreText extends TextComponent with HasGameRef <FlappyBirdGame>{
  //inicia
  ScoreText() 
  :super(
    text: '0',
    textRenderer: TextPaint(
      style: TextStyle(
        color: Colors.grey.shade900,
        fontSize: 48,
      )
    )
    );
    //cargar
    @override
  FutureOr<void> onLoad() {
   //configurar la poscicion media izquierda
   position = Vector2(
    (gameRef.size.x - size.x)/2,
    //abajo
    gameRef.size.y - size.y - 50,
   );
  }
  //actualizar
  @override
  void update(double dt){
    final newText = gameRef.score.toString();
    if(text != newText ){
      text = newText;
    }
  }
}