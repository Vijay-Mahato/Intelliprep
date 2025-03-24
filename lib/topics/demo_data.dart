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
    DrinkData("Arrays", 100, "Coffee.png"),
    DrinkData("Linked List", 150, "Tea.png"),
    DrinkData("Stack", 250, "Latte.png"),
    DrinkData("Queues", 350, "Frappuccino.png"),
    DrinkData("Hash Tables", 450, "Juice.png"),
    DrinkData("Trees", 250, "Latte.png"),
    DrinkData("Graphs", 100, "Coffee.png"),
    DrinkData("Shortest Path", 150, "Tea.png"),
    DrinkData("MS Tree", 350, "Frappuccino.png"),
    DrinkData("Max Flow", 450, "Juice.png"),
    DrinkData("Time Complexity", 350, "Frappuccino.png"),
  ];

}
