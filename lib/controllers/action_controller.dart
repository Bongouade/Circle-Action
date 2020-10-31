import 'dart:math';

class ActionController {
  // String _decodeColor(int color) {
  //   switch (color) {
  //     case 0:
  //       return 'Vert';
  //       break;
  //     case 1:
  //       return 'Bleu clair';
  //       break;
  //     case 2:
  //       return 'Violet';
  //       break;
  //     case 3:
  //       return 'Rose';
  //       break;
  //     case 4:
  //       return 'Jaune';
  //       break;
  //     case 5:
  //       return 'Bleu foncé';
  //       break;
  //     case 6:
  //       return 'Rouge';
  //       break;
  //     case 7:
  //       return 'Orange';
  //       break;
  //     default:
  //       return 'Erreur';
  //       break;
  //   }
  // }

  getRandomPosition() {
    int minTurns = 6;
    int maxTurns = 10;
    int colorChoice = Random().nextInt(8);
    double colorAlgo = (1.0 / 8.0) * colorChoice;
    double position =
        (Random().nextInt(maxTurns - minTurns) + minTurns) + colorAlgo;
    return position;
  }
}
