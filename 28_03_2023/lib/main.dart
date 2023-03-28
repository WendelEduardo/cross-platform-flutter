import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double alarmSize = 300;

  double _currentSliderValue1 = 20;
  double _currentSliderValue2 = 50;
  double _currentSliderValue3 = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful exemplo'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  if (alarmSize > 50) {
                    alarmSize -= 50;
                  }
                });
              },
              icon: const Icon(Icons.remove)),
          IconButton(
              onPressed: () {
                setState(() {
                  alarmSize = 50;
                });
              },
              icon: const Text('S')),
          IconButton(
              onPressed: () {
                setState(() {
                  alarmSize = 300;
                });
              },
              icon: const Text('M')),
          IconButton(
              onPressed: () {
                setState(() {
                  alarmSize = 500;
                });
              },
              icon: const Text('L')),
          IconButton(
              onPressed: () {
                setState(() {
                  if (alarmSize < 500) {
                    alarmSize += 50;
                  }
                });
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Center(
          child: Column(
        children: [
          Icon(
            Icons.alarm,
            size: alarmSize,
            color: Color.fromRGBO(_currentSliderValue1.toInt(),
                _currentSliderValue2.toInt(), _currentSliderValue3.toInt(), 1),
          ),
          Slider(
            value: _currentSliderValue1,
            min: 0,
            max: 255,
            label: _currentSliderValue1.round().toString(),
            activeColor: Color.fromARGB(255, 230, 56, 56),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue1 = value;
              });
            },
          ),
          Slider(
            value: _currentSliderValue2,
            min: 0,
            max: 255,
            label: _currentSliderValue2.round().toString(),
            activeColor: Color.fromARGB(255, 44, 184, 31),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue2 = value;
              });
            },
          ),
          Slider(
            value: _currentSliderValue3,
            min: 0,
            max: 255,
            label: _currentSliderValue3.round().toString(),
            activeColor: Color.fromARGB(255, 56, 126, 230),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue3 = value;
              });
            },
          ),
        ],
      )),
    );
  }
}
