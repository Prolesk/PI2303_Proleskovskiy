import '../Coffee.dart';
import '../Recourses.dart';

class Cappuccino extends Coffee {
  @override
  Recourses getRecourses() {
    return Recourses(
      water: 100,
      milk: 150,
      coffeeBeans: 50,
      cash: 130,
    );
  }

  @override
  String getName() => "Капучино";
}