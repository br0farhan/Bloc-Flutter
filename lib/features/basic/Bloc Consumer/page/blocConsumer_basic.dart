import 'package:bloc_flutter/features/basic/Bloc%20Consumer/bloc/counter_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocconsumerBasic extends StatelessWidget {
  BlocconsumerBasic({super.key});
  CounterConsumer counter = CounterConsumer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Consumer Basic'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocConsumer<CounterConsumer, int>(
            listener: (context, state) {
              if (state % 2 == 0) {
                return showAboutDialog(
                  context: context,
                  applicationName: 'Nama Aplikasimu',
                  applicationVersion: 'v1.0.0',
                  applicationIcon: Icon(Icons.info, size: 40),
                  applicationLegalese: '© 2025 Nama Developer',
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                          'Ini adalah aplikasi contoh menggunakan Flutter.'),
                    ),
                  ],
                );
              }
            },
            builder: (context, state) {
              return Text(
                  'Angka sekarang: $state (${state % 2 == 0 ? 'Genap' : 'Ganjil'})');
            },
            bloc: counter,
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {
                    counter.remove();
                  },
                  icon: const Icon(Icons.remove)),
              IconButton(
                  onPressed: () {
                    counter.add();
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
