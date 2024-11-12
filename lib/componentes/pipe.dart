import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame>{
  //determina el tuvo
  final bool  isTopPipe;

  //scoree
  bool scored = false;

  //init
  Pipe(Vector2 position, Vector2 size,{required this.isTopPipe})
      : super(position: position, size: size);

      /*
      load
      */
      @override
  FutureOr<void> onLoad() async {
  //load sprite imagen
  sprite = await Sprite.load(isTopPipe ? 'pipe_top.png' : 'pipe_bottom.png' );

  //aÑadir hitbox de colicion
  add(RectangleHitbox());
  }
  /*
      actualizar
      */
      @override
  void update(double dt) {
    //scroll tuvo a la izquierda
    position.x -= groundScroollingSpeed * dt;

    //verificar si el pajaro pasa por las tuverias
    if (!scored && position.x + size.x < gameRef.bird.position.x ){
      scored = true;
      //incremento cada vez que pase por las tuverias
      if (isTopPipe){
        gameRef.incrementScore();
      }
    }

    //quitar el tuvo de la pantalla
    if (position.x + size.x <= 0 ){
      removeFromParent();
    }
  }
}