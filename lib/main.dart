import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter chapter4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 119, 178, 121),
        ),
      ),
      home: const MyHomePage(title: 'Flutter chapter4'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _centi = 0.0;
  double _inchi = 0.0;
  double _height = 0;
  double _weight = 0;
  double _bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("身長"),
            TextField(
              onChanged: (value) {
                setState(() {
                  _height = (double.tryParse(value) ?? 0) / 100;
                });
              },
            ),
            Text("体重"),
            TextField(
              onChanged: (value) {
                setState(() {
                  _weight = (double.tryParse(value) ?? 0);
                });
              },
            ),
            Text("BMI $_bmi"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_height > 0 && _weight > 0) {
                    _bmi = _weight / (_height * _height);
                  } else {
                    _bmi = 0;
                  }
                });
              },
              child: const Text("BMI計算"),
            ),
            SizedBox(height: 20),

            Text("インチ"),
            TextField(
              onChanged: (value) {
                setState(() {
                  _centi = double.tryParse(value) ?? 0.0;
                  _centi = _centi * 2.54;
                });
              },
            ),

            Text("結果 $_centi センチ"),
            SizedBox(height: 20),

            Text("センチ"),
            TextField(
              onChanged: (value) {
                setState(() {
                  _inchi = double.tryParse(value) ?? 0.0;
                  _inchi = _inchi / 2.54;
                });
              },
            ),

            Text("結果 $_inchi インチ"),
          ],
        ),
      ),
    );
  }
}
