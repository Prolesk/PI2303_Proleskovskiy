import '../Coffee.dart';
import '../Recourses.dart';

class Espresso extends Coffee {
  @override
  Recourses getRecourses() {
    return Recourses(
      water: 100,
      milk: 0,
      coffeeBeans: 50,
    );
  }

  @override
  String getName() => "Эспрессо";
}