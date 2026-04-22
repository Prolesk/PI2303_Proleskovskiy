import 'package:flutter/material.dart';
import '../classes/Machine.dart';
import '../classes/Enums.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Machine machine = Machine();

  bool isLoading = false;
  String status = "Готов к работе";

  Future<void> makeCoffee(CoffeeType type) async {
    setState(() {
      isLoading = true;
      status = "Готовим...";
    });

    await machine.makeCoffee(type);

    setState(() {
      isLoading = false;
      status = "Готово ☕";
    });
  }

  void updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Кофемашина"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // статус
            Text(status, style: TextStyle(fontSize: 20)),

            SizedBox(height: 20),

            // кнопки кофе
            ElevatedButton(
              onPressed: isLoading ? null : () => makeCoffee(CoffeeType.espresso),
              child: Text("Эспрессо"),
            ),

            ElevatedButton(
              onPressed: isLoading ? null : () => makeCoffee(CoffeeType.cappuccino),
              child: Text("Капучино"),
            ),

            ElevatedButton(
              onPressed: isLoading ? null : () => makeCoffee(CoffeeType.americano),
              child: Text("Американо"),
            ),

            SizedBox(height: 20),

            // ресурсы
            Text("Вода: ${machine.water}"),
            Text("Молоко: ${machine.milk}"),
            Text("Зерна: ${machine.coffeeBeans}"),
            Text("Деньги: ${machine.cash}"),

            SizedBox(height: 20),

            // пополнение
            ElevatedButton(
              onPressed: () {
                machine.addWater(200);
                updateUI();
              },
              child: Text("Добавить воду"),
            ),

            ElevatedButton(
              onPressed: () {
                machine.addMilk(100);
                updateUI();
              },
              child: Text("Добавить молоко"),
            ),

            ElevatedButton(
              onPressed: () {
                machine.addCoffeeBeans(100);
                updateUI();
              },
              child: Text("Добавить зерна"),
            ),

            SizedBox(height: 20),

            if (isLoading) CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}