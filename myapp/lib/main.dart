import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Лаба 4',
      theme: ThemeData(primarySwatch: Colors.green),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLiked = false;
  int likes = 41;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      isLiked ? likes++ : likes--;
    });
  }

  void showAction(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text), duration: Duration(seconds: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter Layout")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/orig.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Общежитие №20",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Краснодар, ул. Калинина, 13",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: toggleLike,
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: isLiked ? Colors.red : Colors.grey,
                        ),
                        SizedBox(width: 5),
                        Text("$likes"),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildButton(
                    Icons.call,
                    "Позвонить",
                    () => showAction("Позвонить"),
                  ),
                  buildButton(
                    Icons.near_me,
                    "Маршрут",
                    () => showAction("Маршрут"),
                  ),
                  buildButton(
                    Icons.share,
                    "Поделиться",
                    () => showAction("Поделиться"),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Студенческий городок или так называемый кампус Кубанского ГАУ состоит из двадцати общежитий, в которых проживает более 8000 студентов, что составляет 96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. В соответствии с Положением о студенческих общежитиях университета, при поселении между администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого самоуправления - студенческие советы организуют всю работу по самообслуживанию",
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          Icon(icon, color: Colors.green),
          SizedBox(height: 5),
          Text(label, style: TextStyle(color: Colors.green)),
        ],
      ),
    );
  }
}
