import 'Enums.dart';
import 'Coffee.dart';
import 'Recourses.dart';
import 'coffees/Espresso.dart';
import 'coffees/Cappuccino.dart';
import 'coffees/Americano.dart';

class Machine {
  int water;
  int milk;
  int coffeeBeans;
  int cash;

  Machine({
    this.water = 1000,
    this.milk = 500,
    this.coffeeBeans = 300,
    this.cash = 0,
  });

  Coffee _createCoffeeType(CoffeeType type) {
    switch (type) {
      case CoffeeType.espresso:
        return Espresso();
      case CoffeeType.cappuccino:
        return Cappuccino();
      case CoffeeType.americano:
        return Americano();
    }
  }

  bool _isEnough(Recourses r) {
    return water >= r.water &&
        milk >= r.milk &&
        coffeeBeans >= r.coffeeBeans;
  }

  void _subtract(Recourses r) {
    water -= r.water;
    milk -= r.milk;
    coffeeBeans -= r.coffeeBeans;
  }

  void makeCoffee(CoffeeType type) {
    Coffee coffee = _createCoffeeType(type);
    Recourses r = coffee.getRecourses();

    if (_isEnough(r)) {
      _subtract(r);
      cash += coffee.getCost();
      print("${coffee.getName()} готов ");
    } else {
      print("Недостаточно ресурсов!");
    }
  }

  void addWater(int amount) => water += amount;
  void addMilk(int amount) => milk += amount;
  void addCoffeeBeans(int amount) => coffeeBeans += amount;

  void showStatus() {
    print("\n--- СОСТОЯНИЕ ---");
    print("Вода: $water");
    print("Молоко: $milk");
    print("Зерна: $coffeeBeans");
    print("Деньги: $cash");
    print("-----------------\n");
  }
}