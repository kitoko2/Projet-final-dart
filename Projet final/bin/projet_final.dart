import 'dart:math';
import 'dart:io';
import 'package:projet_final/classe_bot.dart';
import 'package:projet_final/classe_player.dart';
import "package:projet_final/arme.dart";

//les class sont dans le dossier lib
void main(List<String> arguments) {
  var i = 1;
  var run = true;
  var bot = Bot(1, 100);
  //objet de type player
  var player1 = Player('', 1, 100, Arme('baton', 1, 100));

  // c'est parti
  print('entrer votre pseudo : ');
  var pseudo = stdin.readLineSync();

  player1.setpseudo = pseudo; //stocker le pseudo demander dans l'objet player1

  do {
    final r = Random();
    var choix = r.nextInt(2);

    switch (choix) {
      case 0:
        print('\n${player1.pseudo} ATTAQUE EN PREMIER\n');
        print('----$pseudo APPUIYER SUR ENTRER POUR LANCER LES DÉS----\n');
        stdin.readLineSync();

        print(
          "choisissez votre force d\'attaque(1 ou 2):\n1-FORCE NORMALE: 100% de reussite\n2-FORCE DOUBLE 50% de reussite\nnb: si vous laisser vide ou entrer autre chose c'est la force normale(par defaut) qui sera pris en compte\n",
        ); // NB: SI VOUS CHOISISSER AUTRE QUE 1 ou 2 la FORCE NORMALE sera SELECTIONNER par DEFAULT ",

        print("entrer votre choix pour la force d'attaque");
        var forceAttaque = stdin.readLineSync();
        attaqueDePlayerSelonChoix(forceAttaque, player1, bot);
        bot.infoBot();
        bot.attaqueBotVersPlayer(player1);
        player1.infoPlayer();
        break;
      default:
        print('\nBOT ATTAQUE EN PREMIER\n');
        bot.attaqueBotVersPlayer(player1);
        player1.infoPlayer();
        print(
          "choisissez votre force d\'attaque(1 ou 2):\n1-FORCE NORMALE: 100% de reussite\n2-FORCE DOUBLE 50% de reussite\nnb: si vous laisser vide ou entrer autre chose c'est la force normale(par defaut) qui sera pris en compte\n",
        );
        print("entrer votre choix pour la force d'attaque");
        var forceAttaque = stdin.readLineSync();
        attaqueDePlayerSelonChoix(forceAttaque, player1, bot);
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

void attaqueDePlayerSelonChoix(String forceAttaque, Player player1, Bot bot) {
  if (forceAttaque != '2') {
    //force normale par defaut selectionner
    if (player1.arme.precision == 100) {
      player1.attaquePlayerVersBot(bot);
    } //aucun echec car l'arme est precise

  } else {
    //force double selectionner
    final r = Random();
    var reussite = r.nextInt(2);
    switch (reussite) {
      case 1:
        print("\tSucces de l'attaque double");
        player1.setforce = player1.force * 2;
        player1.attaquePlayerVersBot(bot);
        player1.setforce = (player1.force / 2).toInt();
        //revenir a la force de depart
        break;
      default:
        print("\tEchec de l'attaque double");
    }
  }
}
/* 
NB : JE PROPOSE 2 FORCE D'ATTAQUE:
1- FORCE NORMALE AVEC 100% DE REUSSITE
2- FORCE DOUBLE AVEC 50% de REUSSITE
*/
