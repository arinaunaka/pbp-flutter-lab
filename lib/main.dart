import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Program Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  final String title = 'Program Counter';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const MyDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_counter % 2 == 0) ...[
                const Text(
                  "GENAP",
                  style: TextStyle(color: Colors.red),
                ),
              ] else ...[
                const Text(
                  "GANJIL",
                  style: TextStyle(color: Colors.blue),
                ),
              ],
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_counter != 0) ...[
                FloatingActionButton(
                  heroTag: "-",
                  tooltip: 'Decrement',
                  onPressed: () {
                    _decrementCounter();
                  },
                  child: const Icon(Icons.remove_rounded),
                ),
                const Spacer(),
              ],
              FloatingActionButton(
                heroTag: "+",
                tooltip: 'Increment',
                onPressed: () {
                  _incrementCounter();
                },
                child: const Icon(Icons.add_rounded),
              ),
            ],
          ),
        ));
  }
}