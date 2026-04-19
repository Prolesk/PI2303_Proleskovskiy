import 'dart:async';
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
    return water >= r.water &&
        milk >= r.milk &&
        coffeeBeans >= r.coffeeBeans;
  }

  void _subtract(Recourses r) {
    water -= r.water;
    milk -= r.milk;
    coffeeBeans -= r.coffeeBeans;
  }

Future<void> makeCoffee(CoffeeType type) async {
  Coffee coffee = Coffee.create(type);
  Recourses r = coffee.getRecourses();

  if (!_isEnough(r)) {
    print("Недостаточно ресурсов!");
    return;
  }

  print("\n=== Готовим ${coffee.getName()} ===");

  await AsyncMethods.heatWater();

  if (r.milk > 0) {
    await AsyncMethods.brewCoffee();
    await AsyncMethods.frothMilk();
    await AsyncMethods.mixCoffee();
  } else {
    await AsyncMethods.brewCoffee();
  }

  _subtract(r);

  cash += coffee.getPrice();

  print("${coffee.getName()} готов");
  print("Цена: ${coffee.getPrice()}");
  
  print("=== Готово === \n");
  
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