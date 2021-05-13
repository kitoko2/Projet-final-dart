import 'package:projet_final/utils.dart';
import 'package:projet_final/classe_bot.dart';
import "package:projet_final/arme.dart";

class Player {
  String _pseudo;
  int _force;
  int _health;
  Arme arme;
  Player(this._pseudo, this._force, this._health, this.arme);

  void infoPlayer() {
    print(
        '${this._pseudo}  |  santé: ${this._health}  | force: ${this._force}');
  }

  void attaquePlayerVersBot(Bot b) {
    var coup = this.arme.puissance * this._force * lanceDes(this._pseudo);
    //multiplication avec la force et la puissance de l'arme
    print('${this._pseudo} assène un coup sur le bot avec une force de $coup');
    b.sethealth = b.health - coup;
  }

  void victoire() {
    print('\n${(this._pseudo).toUpperCase()} VOUS AVEZ GAGNEZ LA PARTIE!\n');
  }

  //getter
  String get pseudo {
    return _pseudo;
  }

  int get force {
    return _force;
  }

  int get health {
    return _health;
  }

  //setter
  void set setpseudo(String value) {
    _pseudo = value;
  }

  void set setforce(int value) {
    _force = value;
  }

  void set sethealth(int value) {
    _health = value;
  }
}
//class player
