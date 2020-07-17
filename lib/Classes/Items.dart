/*

      Player items Class

 */

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Items {
  //final int totalItems;
  int valueItem;
  String name;
  dynamic icon;

  String getName() {
    return name;
  }

  Items({
      this.name, this.valueItem, this.icon
  });
}

List<Items> itemData = [
  Items(
      name: 'Fiji Water',
      valueItem: 14,
      icon: FontAwesomeIcons.utensils
  ),
  Items(
      name: 'Campbell Soup',
      valueItem: 12,
      icon: FontAwesomeIcons.utensils
  ),
  Items(
      name: 'First Aid Pouch',
      valueItem: 10,
      icon: FontAwesomeIcons.utensils
  ),
  Items(
      name: 'AK47',
      valueItem: 8,
      icon: FontAwesomeIcons.utensils
  ),
];

