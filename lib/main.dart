import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialData = 65}) : super(initialData);

  int initialData = 0;
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CounterCubit myCounter = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        title:const Text("Cubit Apps"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
              stream: myCounter.stream,
              initialData: myCounter.initialData,
              builder: (context, snapshot) {
                return Center(
                  child: Text(
                    "${snapshot.data}",
                    style: const TextStyle(fontSize: 50),
                  ),
                );
              }),
          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  myCounter.decrement();
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  myCounter.increment();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
