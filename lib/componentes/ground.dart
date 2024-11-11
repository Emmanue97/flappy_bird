import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import '../game.dart';

class Ground extends SpriteComponent  with HasGameRef<FlappyBirdGame>, CollisionCallbacks {
//Int
Ground(): super();

/*
Load

*/
@override
  FutureOr<void> onLoad() async {
    //tamaño y posiion  x2 scrrol infinito
    size = Vector2( 2* gameRef.size.x, groundHeight);
    position =  Vector2(0, gameRef.size.y - groundHeight);
    // cargar ground imagen
    sprite = await Sprite.load('ground.png');

    //colision
    add (RectangleHitbox());

  }
  /*
actualizar

*/
@override
  void update(double dt) {
    //mover ground a la izquierda
    position.x -= groundScroollingSpeed * dt;
    //scrool infinito
    if(position.x + size.x / 2 <=0){
      position.x = 0; 
          }

  }
}