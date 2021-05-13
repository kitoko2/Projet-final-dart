import 'package:projet2_en_groupe/utils.dart';
import 'package:projet2_en_groupe/classe_player.dart';

class Bot {
  int _force;
  int _health;
  Bot(int force, int health) {
    this._force = force;
    this._health = health;
  }

  void infoBot() {
    print('bot | santé: ${this._health}  | force: ${this._force}');
  }

  void attaqueBotVersPlayer(Player p) {
    var coup = this._force * lanceDes('bot'); //multiplication avec la force
    print('le bot assène un coup à ${p.pseudo} avec une force de $coup');
    p.sethealth = p.health - coup;
  }

  //getters
  int get force {
    return _force;
  }

  int get health {
    return _health;
  }

  //setters
  void set setforce(int value) {
    _force = value;
  }

  void set sethealth(int value) {
    _health = value;
  }
}
