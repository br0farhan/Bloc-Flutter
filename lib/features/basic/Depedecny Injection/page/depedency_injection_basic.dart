import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_flutter/features/basic/Depedecny%20Injection/bloc/counter_depedency_bloc.dart';
import 'package:bloc_flutter/features/basic/Depedecny%20Injection/widget/data_widget.dart';

class DepedencyInjectionBasic extends StatefulWidget {
  const DepedencyInjectionBasic({super.key});

  @override
  State<DepedencyInjectionBasic> createState() => _DepedencyInjectionBasicState();
}

class _DepedencyInjectionBasicState extends State<DepedencyInjectionBasic> {
  bool _showExplanation = false;

  @override
  Widget build(BuildContext context) {
    final counterDepedency = BlocProvider.of<CounterDepedencyBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dependency Injection Basic'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              crossFadeState: _showExplanation ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              firstChild: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Halaman ini adalah contoh implementasi Dependency Injection '
                  'dengan Bloc. Anda bisa menambahkan atau mengurangi angka '
                  'melalui tombol yang tersedia, dan perubahan data akan '
                  'ditampilkan secara real-time menggunakan BlocProvider.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
              secondChild: const SizedBox.shrink(),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    counterDepedency.remove();
                  },
                  child: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Icon(Icons.remove, color: Colors.white)),
                  ),
                ),
                const DataWidgetDepedency(),
                GestureDetector(
                  onTap: () {
                    counterDepedency.add();
                  },
                  child: Container(
                    height: 100,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Icon(Icons.add, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
