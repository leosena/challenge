/*

      Player info Class

 */

import 'Items.dart';

class Survivor {
  final age;
  final name;
  final gender;
  int lastLocation_x;
  int lastLocation_y;
  final ID;

  Items items;

  Survivor(this.age, this.name, this.gender, this.lastLocation_x, this.lastLocation_y, this.ID);
}