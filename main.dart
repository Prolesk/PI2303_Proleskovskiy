import 'dart:io';
import 'classes/Machine.dart';
import 'classes/Enums.dart';

void main() async {
  Machine machine = Machine();

  while (true) {
    print("1 - Эспрессо");
    print("2 - Капучино");
    print("3 - Американо");
    print("4 - Добавить воду");
    print("5 - Добавить молоко");
    print("6 - Добавить зерна");
    print("7 - Статус");
    print("0 - Выход");

    stdout.write("Выбор: ");
    String? input = stdin.readLineSync();

    switch (input) {
      case "1":
        await machine.makeCoffee(CoffeeType.espresso);
        break;

      case "2":
        await machine.makeCoffee(CoffeeType.cappuccino);
        break;

      case "3":
        await machine.makeCoffee(CoffeeType.americano);
        break;

      case "4":
        stdout.write("Введите воду: ");
        int? w = int.tryParse(stdin.readLineSync()!);
        if (w != null) machine.addWater(w);
        break;

      case "5":
        stdout.write("Введите молоко: ");
        int? m = int.tryParse(stdin.readLineSync()!);
        if (m != null) machine.addMilk(m);
        break;

      case "6":
        stdout.write("Введите зерна: ");
        int? b = int.tryParse(stdin.readLineSync()!);
        if (b != null) machine.addCoffeeBeans(b);
        break;

      case "7":
        machine.showStatus();
        break;

      case "0":
        return;

      default:
        print("Ошибка");
    }
  }
}