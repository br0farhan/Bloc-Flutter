import 'package:bloc_flutter/features/basic/Bloc%20Listener/bloc/counter_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerBasic extends StatefulWidget {
  const BlocListenerBasic({super.key});

  @override
  State<BlocListenerBasic> createState() => _BlocListenerBasicState();
}

class _BlocListenerBasicState extends State<BlocListenerBasic> {
  bool _showExplanation = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterListener(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Bloc Listener Basic'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showExplanation = !_showExplanation;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info_outline, color: Colors.blue),
                        const SizedBox(width: 8),
                        Text(
                          _showExplanation ? 'Sembunyikan Penjelasan' : 'Lihat Penjelasan',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  AnimatedCrossFade(
                    duration: const Duration(milliseconds: 300),
                    crossFadeState: _showExplanation
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'Contoh ini menggunakan BlocListener untuk memantau perubahan state.\n\n'
                        '• `BlocListener` akan mendengarkan perubahan state dari `CounterListener`.\n'
                        '• `listenWhen` membatasi hanya state **genap** yang akan diproses listener.\n'
                        '• Ketika genap, akan muncul SnackBar yang menampilkan state tersebut.\n'
                        '• State tetap ditampilkan di tengah melalui `BlocBuilder`.\n\n'
                        'Cocok untuk menangani side effect seperti notifikasi, navigasi, atau dialog.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    secondChild: const SizedBox.shrink(),
                  ),
                  const SizedBox(height: 30),
                  BlocListener<CounterListener, int>(
                    listenWhen: (previous, current) => current % 2 == 0,
                    listener: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content: Text('Data Genap: $state'),
                        ),
                      );
                    },
                    child: BlocBuilder<CounterListener, int>(
                      builder: (context, state) {
                        return Text(
                          '$state',
                          style: const TextStyle(fontSize: 50),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => context.read<CounterListener>().remove(),
                        icon: const Icon(Icons.remove),
                      ),
                      IconButton(
                        onPressed: () => context.read<CounterListener>().add(),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
