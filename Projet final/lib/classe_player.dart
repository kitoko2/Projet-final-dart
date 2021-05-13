import 'package:projet2_en_groupe/utils.dart';
import 'package:projet2_en_groupe/classe_bot.dart';

class Player {
  String _pseudo;
  int _force;
  int _health;
  Player(this._pseudo, this._force, this._health);

  void infoPlayer() {
    print(
        '${this._pseudo}  |  santé: ${this._health}  | force: ${this._force}');
  }

  void attaquePlayerVersBot(Bot b) {
    var coup = this._force * lanceDes(this._pseudo);
    //multiplication avec la force
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
