class DrinkData {

  final String title;
  final int requiredPoints;
  final String iconImage;

  DrinkData(this.title, this.requiredPoints, this.iconImage);
}

class DemoData{

  //how many points this user has earned, in a real app this would be loaded from an online service.
  int earnedPoints = 150;

  //List of available drinks
  List<DrinkData> drinks = [
    DrinkData("Level 1", 100, "Coffee.png"),
    DrinkData("Level 2", 150, "Tea.png"),
    // DrinkData("Stack", 250, "Latte.png"),
    // DrinkData("Queues", 350, "Frappuccino.png"),
    // DrinkData("Hash Tables", 450, "Juice.png"),

  ];

}
