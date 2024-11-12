import 'dart:math';
import 'package:flame/components.dart';
import 'package:flappy_bird/componentes/pipe.dart';
import 'package:flappy_bird/constants.dart';
import 'package:flappy_bird/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  /*
  actualizacion cada segundo
  para que aparesca una tuveria nueva
  */

  double pipeSpawnTimer = 0;
  @override
  void update(double dt) {
//generar tuverias en intervalos
  pipeSpawnTimer += dt;
  

  if(pipeSpawnTimer > pipeInterval){
    pipeSpawnTimer = 0;
    spawnPipe();
  }
  }

  /*
  SPAWNEA NUEVA TUVERIA
  */
  void spawnPipe(){
    final double screenHeight = gameRef.size.y;
    

    /*
    calcular altura de tuverias
    */

    //altura maxima de la tuveria
    final double maxPipeHeight =
        screenHeight - groundHeight - pipeGap - minPipeHeight;

        //tuveria ramdom altura y ancho
    final double bottomPipeHeight =
          minPipeHeight + Random().nextDouble() *(maxPipeHeight - minPipeHeight);
        //altura de la tuveria
    final double topPipeHeight =
        screenHeight - groundHeight - bottomPipeHeight - pipeGap;

  /*

  crear tuveria de abajo
  */
  final bottomPipe = Pipe(
    //pocision
    Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
    Vector2(pipeWidth,bottomPipeHeight),
     isTopPipe: false 
     );
      /*

  crear tuveria de arriba
  */
  final topPipe = Pipe(
    //posicion
    Vector2(gameRef.size.x,0),
    //size
    Vector2(pipeWidth, topPipeHeight),
    isTopPipe: true
  );
  //aÑadir tuvos para el juego
  gameRef.add(bottomPipe);
  gameRef.add(topPipe);


  }

}