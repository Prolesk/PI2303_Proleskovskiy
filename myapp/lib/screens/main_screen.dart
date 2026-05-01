import 'package:flutter/material.dart';
import '../classes/Machine.dart';
import 'coffee_tab.dart';
import 'resources_tab.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Machine machine = Machine();

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Кофе машина"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.local_cafe)),
              Tab(icon: Icon(Icons.settings)),
            ],
          ),
        ),
        body: TabBarView(
          children: [CoffeeTab(machine, update), ResourcesTab(machine, update)],
        ),
      ),
    );
  }
}
