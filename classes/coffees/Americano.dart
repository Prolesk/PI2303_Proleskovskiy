import '../Coffee.dart';
import '../Recourses.dart';

class Americano extends Coffee {
  @override
  Recourses getRecourses() {
    return Recourses(
      water: 200,
      milk: 0,
      coffeeBeans: 50,
      cash: 120,
    );
  }

  @override
  String getName() => "Американо";
}