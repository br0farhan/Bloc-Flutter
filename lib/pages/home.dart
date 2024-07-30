import 'package:bloc_flutter/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Counter myCounter = Counter(init: 0);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => myCounter,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text("Bloc Listener"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              BlocConsumer<Counter, int>(
                bloc: myCounter,
                buildWhen: (context, state) {
                  return state >=4;
                },
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: const TextStyle(fontSize: 50),
                  );
                },
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      duration: Duration(seconds: 1),
                      content: Text("Dijalankan"),
                    ),
                  );
                },
                listenWhen: (previous, current) {
                  return current % 2 == 1;
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () {
                      myCounter.decrement();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      myCounter.increment();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
