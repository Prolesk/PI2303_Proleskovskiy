import 'dart:io';
import 'classes/Machine.dart';
import 'classes/Enums.dart';

void main() {
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
        machine.makeCoffee(CoffeeType.espresso);
        break;

      case "2":
        machine.makeCoffee(CoffeeType.cappuccino);
        break;

      case "3":
        machine.makeCoffee(CoffeeType.americano);
        break;

      case "4":
        stdout.write("Введите количество воды: ");
        int amount = int.parse(stdin.readLineSync()!);
        machine.addWater(amount);
        break;

      case "5":
        stdout.write("Введите количество молока: ");
        int amount = int.parse(stdin.readLineSync()!);
        machine.addMilk(amount);
        break;

      case "6":
        stdout.write("Введите количество зерен: ");
        int amount = int.parse(stdin.readLineSync()!);
        machine.addCoffeeBeans(amount);
        break;

      case "7":
        machine.showStatus();
        break;

      case "0":
        print("Выход...");
        return;

      default:
        print("Ошибка ввода");
    }
  }
}