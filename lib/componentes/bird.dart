
import 'dart:async';

import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';

class Bird extends SpriteComponent{
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
}