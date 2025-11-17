import 'package:flutter/material.dart';

void main() {
  //CounterNotifier counterNotifier = CounterNotifier();

  ValueNotifier<int> counterNotifier = ValueNotifier(100);

  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("HELLO")),
        body: Center(
          child: Column(
            children: [
              ListenableBuilder(
                listenable: counterNotifier,
                builder: (context, child) {
                  return Text('counter: ${counterNotifier.value}');
                },
              ),
              TextButton(
                child: Text('Increment'),
                onPressed: () {
                  counterNotifier.value++;
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class CounterNotifier extends ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

