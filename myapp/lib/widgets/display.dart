import 'package:flutter/material.dart';
import '../classes/Machine.dart';

class Display extends StatelessWidget {
  final Machine machine;

  const Display(this.machine, {super.key});

  Widget row(String label, int value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(label), Text(value.toString())],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      color: Colors.green[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Ресурсы", style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          row("Вода", machine.water),
          row("Молоко", machine.milk),
          row("Бобы", machine.coffeeBeans),
          row("Деньги", machine.cash),
        ],
      ),
    );
  }
}
