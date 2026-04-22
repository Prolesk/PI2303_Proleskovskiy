import 'Recourses.dart';
import 'Enums.dart';
import 'coffees/Espresso.dart';
import 'coffees/Cappuccino.dart';
import 'coffees/Americano.dart';

abstract class Coffee {
  Coffee();

  Recourses getRecourses();
  String getName();
  int getPrice(); 

  factory Coffee.create(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.americano:
        return Americano();
    }
  }
}