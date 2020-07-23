/*

      Player items Class

 */


class Items {
  int valueItem;
  String name;
  int holdItems;

  String getName() {
    return name;
  }

  Items({
      this.name, this.valueItem, this.holdItems
  });
}


List<Items> itemData = [
  Items(name: 'Fiji Water', valueItem: 14, holdItems: 0),
  Items(name: 'Campbell Soup', valueItem: 12, holdItems: 0),
  Items(name: 'First Aid Pouch', valueItem: 10, holdItems: 0),
  Items(name: 'AK47', valueItem: 8, holdItems: 0),
];



List<Items> itemData_register = [
  Items(name: 'Fiji Water', valueItem: 14, holdItems: 0),
  Items(name: 'Campbell Soup', valueItem: 12, holdItems: 0),
  Items(name: 'First Aid Pouch', valueItem: 10, holdItems: 0),
  Items(name: 'AK47', valueItem: 8, holdItems: 0),
  Items(name: 'Fiji Water', valueItem: 14, holdItems: 0),
  Items(name: 'Campbell Soup', valueItem: 12, holdItems: 0),
  Items(name: 'First Aid Pouch', valueItem: 10, holdItems: 0),
  Items(name: 'AK47', valueItem: 8, holdItems: 0),
];
