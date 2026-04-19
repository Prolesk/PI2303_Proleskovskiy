import 'dart:async';

class AsyncMethods {
  static Future<void> heatWater() async {
    print("Нагрев воды...");
    await Future.delayed(Duration(seconds: 3));
    print("Вода нагрета");
  }

  static Future<void> brewCoffee() async {
    print("Заваривание кофе...");
    await Future.delayed(Duration(seconds: 5));
    print("Кофе готов");
  }

  static Future<void> frothMilk() async {
    print("Взбивание молока...");
    await Future.delayed(Duration(seconds: 5));
    print("Молоко готово");
  }

  static Future<void> mixCoffee() async {
    print("Смешивание ингредиентов...");
    await Future.delayed(Duration(seconds: 3));
    print("Смешивание завершено");
  }
}