import 'dart:async';

import 'package:flame/components.dart';

class Background extends SpriteComponent{
  //iniciar back posicion y tamaño
  Background(Vector2 size)
      : super(
        size:size,
        position: Vector2(0, 0)
      );
  @override
  FutureOr<void> onLoad() async {
    //cargar  imagen del back
    sprite = await Sprite.load('Background.png');
  }

}