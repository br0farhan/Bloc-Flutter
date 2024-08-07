import 'package:bloc_flutter/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // EXTENSION METHOD
    // CounterBloc myCounter = context.read<CounterBloc>(); // Hanya membaca 1x
    // CounterBloc myCounter = context.watch<CounterBloc>(); // Mmebaca berkali atau setiap state itu berubah
    // PRnya membuild semua Scaffold seperti setstate tidak disarankan menggunakan watch ini kurang efektif
    print("Build Scaffold");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Extension Method"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
              print("Build text");
              CounterBloc myCounter = context.watch<CounterBloc>();
              return Text(
                "${myCounter.state}",
                style: TextStyle(fontSize: 100),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      // print("kurang");
                      context.read<CounterBloc>().remove();
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      // print("tambah");
                      context.read<CounterBloc>().add();
                    },
                    icon: Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
