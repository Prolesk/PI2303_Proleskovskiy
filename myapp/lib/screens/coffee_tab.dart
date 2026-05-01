import 'package:flutter/material.dart';
import '../classes/Machine.dart';
import '../classes/Enums.dart';
import '../classes/Coffee.dart';

class CoffeeTab extends StatefulWidget {
  final Machine machine;
  final VoidCallback update;

  CoffeeTab(this.machine, this.update);

  @override
  _CoffeeTabState createState() => _CoffeeTabState();
}

class _CoffeeTabState extends State<CoffeeTab>
    with AutomaticKeepAliveClientMixin {
  bool isCooking = false;

  @override
  bool get wantKeepAlive => true;

  Future<void> makeCoffee(CoffeeType type) async {
    if (isCooking) return;

    setState(() => isCooking = true);

    await widget.machine.makeCoffee(
      type,
      onUpdate: (msg) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(msg)));
      },
    );

    widget.update();
    setState(() => isCooking = false);
  }

  Widget coffeeButton(CoffeeType type) {
    final coffee = Coffee.create(type);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16),
        ),
        onPressed: isCooking ? null : () => makeCoffee(type),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(coffee.getName(), style: TextStyle(fontSize: 16)),
            Text("${coffee.getPrice()} ₽"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Column(
      children: [
        SizedBox(height: 20),

        Text("Выберите кофе", style: TextStyle(fontSize: 18)),

        SizedBox(height: 10),

        coffeeButton(CoffeeType.americano),
        coffeeButton(CoffeeType.espresso),
        coffeeButton(CoffeeType.cappuccino),

        if (isCooking)
          Padding(
            padding: const EdgeInsets.all(12),
            child: CircularProgressIndicator(),
          ),
      ],
    );
  }
}
