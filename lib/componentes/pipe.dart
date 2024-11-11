import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame>{
  //determina el tuvo
  final bool  isTopPipe;

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

    //quitar el tuvo de la pantalla
    if (position.x + size.x <= 0 ){
      removeFromParent();
    }
  }
}