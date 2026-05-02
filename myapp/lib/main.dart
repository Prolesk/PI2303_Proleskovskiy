import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор площади',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String _resultText = 'Задайте параметры';

  void _validateAndCalculate() {
    if (_formKey.currentState!.validate()) {
      double width = double.parse(_widthController.text);
      double height = double.parse(_heightController.text);
      double area = width * height;

      setState(() {
        _resultText = 'S = $width × $height = ${area.toStringAsFixed(2)} мм²';
      });
    } else {
      setState(() {
        _resultText = 'Задайте параметры';
      });
    }
  }

  String? _validateInput(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заполните поле';
    }
    if (value.contains('e') || value.contains('E')) {
      return 'Числа с E не допускаются';
    }
    final number = double.tryParse(value);
    if (number == null) {
      return 'Введите корректное число';
    }
    if (number < 0) {
      return 'Число не может быть отрицательным';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Калькулятор площади',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ширина(мм):',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              TextFormField(
                controller: _widthController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Введите ширину',
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                ),
                validator: _validateInput,
              ),
              const SizedBox(height: 16),

              const Text(
                'Высота(мм):',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Введите высоту',
                  border: UnderlineInputBorder(),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: UnderlineInputBorder(),
                ),
                validator: _validateInput,
              ),
              const SizedBox(height: 24),

              Center(
                child: ElevatedButton(
                  onPressed: _validateAndCalculate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Вычислить'),
                ),
              ),
              const SizedBox(height: 24),

              Text(
                _resultText,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
