import 'package:bloc_flutter/features/basic/Bloc%20Builder/bloc/counter_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderBasic extends StatefulWidget {
  const BlocBuilderBasic({super.key});

  @override
  State<BlocBuilderBasic> createState() => _BlocBuilderBasicState();
}

class _BlocBuilderBasicState extends State<BlocBuilderBasic> {
  final CounterBuilder counter = CounterBuilder();
  bool _showExplanation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Builder Basic"),
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
                  'Ini adalah contoh penggunaan BlocBuilder. '
                  'BlocBuilder akan membangun ulang UI berdasarkan state baru. '
                  'Namun dengan `buildWhen`, kita membatasi hanya ketika nilai 5 saja '
                  'yang membuat UI dibangun ulang. Nilai lainnya tidak akan memicu rebuild.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
            const SizedBox(height: 30),
            BlocBuilder(
              bloc: counter,
              buildWhen: (previous, current) => current == 5,
              builder: (context, state) {
                return Text(
                  "$state",
                  style: const TextStyle(fontSize: 100),
                );
              },
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () => counter.remove(),
                  icon: const Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () => counter.add(),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
