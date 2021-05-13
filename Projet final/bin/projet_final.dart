import 'dart:math';
import 'dart:io';
import 'package:projet2_en_groupe/classe_bot.dart';
import 'package:projet2_en_groupe/classe_player.dart';

//les class sont dans le dossier lib
void main(List<String> arguments) {
  var i = 1;
  var run = true;
  var bot = Bot(1, 100);
  //objet de type player
  var player1 = Player('', 1, 100);

  // c'est parti
  print('entrer votre pseudo : ');
  var pseudo = stdin.readLineSync();

  player1.pseudo = pseudo; //stocker le pseudo demander dans l'objet player1

  do {
    final r = Random();
    var choix = r.nextInt(2);

    switch (choix) {
      case 0:
        print('\n${player1.pseudo} ATTAQUE EN PREMIER\n');
        print('----$pseudo APPUIYER SUR ENTRER POUR LANCER LES DÉS----\n');
        stdin.readLineSync();
        player1.attaquePlayerVersBot(bot);
        bot.infoBot();
        bot.attaqueBotVersPlayer(player1);
        player1.infoPlayer();
        //voir les infos du player1(santé...) après le coup du bot
        break;
      default:
        print('\nBOT ATTAQUE EN PREMIER\n');
        bot.attaqueBotVersPlayer(player1);
        player1.infoPlayer();
        player1.attaquePlayerVersBot(bot);
        bot.infoBot();
      //voir les infos du bot(santé...) après le coup du player
    }

    print('FIN DU TOUR $i \n');
    i++;

    if (player1.health <= 0 || bot.health <= 0) {
      run = false;
    }
  } while (run);

  if (player1.health > bot.health) {
    player1.victoire();
  } else if (player1.health < bot.health) {
    print('\nVOUS AVEZ PERDU LA PARTIE!\n');
  } else {
    print('match null');
  }
}
