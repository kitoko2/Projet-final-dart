import 'package:projet2_en_groupe/utils.dart';
import 'package:projet2_en_groupe/classe_player.dart';

class Bot {
  int force;
  int health;
  Bot(int force, int health) {
    this.force = force;
    this.health = health;
  }

  void infoBot() {
    print('bot | santé: ${this.health}  | force: ${this.force}');
  }

  void attaqueBotVersPlayer(Player p) {
    var coup = this.force * lanceDes('bot'); //multiplication avec la force
    print('le bot assène un coup à ${p.pseudo} avec une force de $coup');
    p.health -= coup;
  }
}
