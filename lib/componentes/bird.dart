
import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/componentes/ground.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Bird extends SpriteComponent with CollisionCallbacks {
/*
Inicia pajaro
*/

/*
posicion y tamaÑo del bird

*/
Bird():super(position: Vector2(birdStartx, birdStarty), size: Vector2(birdWidth, birdHeight) );
  /*
propiedades del mundo
  */
  double velocity=0;

  /*
Cargar
  */
  @override
  FutureOr<void> onLoad() async {
    //cargar bird
    sprite = await Sprite.load('bird.png');
    //añadir hitbox
    add(RectangleHitbox());

  }

  /*
  saltos del pajaro
  */
  void flap(){
    velocity = jumpStrength;
  }
  /*
actualizacio cada segundo
  */
  @override
  void update(double dt) {
    // aplicando la gravedad
    velocity += gravity * dt;
    //actualizacion de la posicion del pajaro en base la velocidad
    position.y += velocity * dt;

  }
  /*
  COLLISION CON OTRO OBJETO

  */
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    //check
    if (other is Ground){
       (parent as FlappyBirdGame).gameOver();
    }
  }
}