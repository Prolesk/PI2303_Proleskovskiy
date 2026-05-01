import 'package:flutter/material.dart';
import '../classes/Machine.dart';

class ControlPanel extends StatefulWidget {
  final Machine machine;
  final VoidCallback update;

  ControlPanel(this.machine, this.update);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  final waterCtrl = TextEditingController();
  final milkCtrl = TextEditingController();
  final beansCtrl = TextEditingController();
  final cashCtrl = TextEditingController();

  int parse(TextEditingController c) => int.tryParse(c.text) ?? 0;

  Widget input(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          isDense: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        input("Вода", waterCtrl),
        input("Молоко", milkCtrl),
        input("Бобы", beansCtrl),
        input("Деньги", cashCtrl),

        SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                widget.machine.addWater(parse(waterCtrl));
                widget.machine.addMilk(parse(milkCtrl));
                widget.machine.addCoffeeBeans(parse(beansCtrl));
                widget.machine.cash += parse(cashCtrl);

                widget.update();

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Ресурсы добавлены")));
              },
              child: Text("Добавить"),
            ),
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}
