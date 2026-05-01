import 'AsyncMethods.dart';
import 'Enums.dart';
import 'Coffee.dart';
import 'Recourses.dart';

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

  bool _isEnough(Recourses r) {
    return water >= r.water && milk >= r.milk && coffeeBeans >= r.coffeeBeans;
  }

  void _subtract(Recourses r) {
    water -= r.water;
    milk -= r.milk;
    coffeeBeans -= r.coffeeBeans;
  }

  Future<void> makeCoffee(
    CoffeeType type, {
    required Function(String) onUpdate,
  }) async {
    Coffee coffee = Coffee.create(type);
    Recourses r = coffee.getRecourses();

    if (!_isEnough(r)) {
      onUpdate("Недостаточно ресурсов!");
      return;
    }

    onUpdate("Нагрев воды...");
    await AsyncMethods.heatWater();

    if (r.milk > 0) {
      onUpdate("Заваривание кофе...");
      await AsyncMethods.brewCoffee();

      onUpdate("Взбивание молока...");
      await AsyncMethods.frothMilk();

      onUpdate("Смешивание...");
      await AsyncMethods.mixCoffee();
    } else {
      onUpdate("Заваривание кофе...");
      await AsyncMethods.brewCoffee();
    }

    _subtract(r);
    cash += coffee.getPrice();

    onUpdate("${coffee.getName()} готов ☕");
  }

  void addWater(int amount) => water += amount;
  void addMilk(int amount) => milk += amount;
  void addCoffeeBeans(int amount) => coffeeBeans += amount;
}
