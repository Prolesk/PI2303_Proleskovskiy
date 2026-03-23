import 'dart:io';
import 'classes/CoffeeMachine.dart';

void main() {
  Machine machine = Machine(
    coffeeBeans: 200,
    milk: 200,
    water: 200,
    cash: 0,
  );

  print('Доступные команды:');
  print('coffee - приготовить кофе');
  print('exit - выход');

  while (true) {
    stdout.write('\nВведите команду: ');
    String command = stdin.readLineSync()?.toLowerCase() ?? '';

    switch (command) {
        
      case 'coffee':
        _makeCoffee(machine);
        break;
        
      case 'exit':
        print('Работа программы завершена');
        return;
        
      default:
        print('Неизвестная команда. Доступные команды: add, coffee, exit');
    }
  }
}



void _makeCoffee(Machine machine) {
  print('\nПроверка ресурсов для эспрессо...');
  
  if (machine.isAvailableResources()) {
    print('Ресурсов достаточно');
    machine.makingCoffee();
    print('Кофе готов');
    print('С машины списано: 50 гр кофе, 100 мл воды');
    print('В машину добавлено: 100 руб');
  } else {
    print('Недостаточно ресурсов для приготовления кофе');
    print('Требуется: 50 гр кофе, 100 мл воды');
  }
  
  _showResources(machine);
}

void _showResources(Machine machine) {
  print('\n--- Текущие ресурсы машины ---');
  print('Кофе: ${machine.coffeeBeans} гр');
  print('Молоко: ${machine.milk} мл');
  print('Вода: ${machine.water} мл');
  print('Деньги: ${machine.cash} руб');
  print('-------------------------------');
}