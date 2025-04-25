import 'package:bloc_flutter/features/basic/Bloc%20Provider/bloc/counter_provider.dart';
import 'package:bloc_flutter/features/basic/Bloc%20Provider/page/widget/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocproviderBasic extends StatefulWidget {
  const BlocproviderBasic({super.key});

  @override
  State<BlocproviderBasic> createState() => _BlocproviderBasicState();
}

class _BlocproviderBasicState extends State<BlocproviderBasic> {
  bool _showExplanation = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterProvider>(
      create: (context) => CounterProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Provider Basic'),
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
                    'Halaman ini adalah contoh implementasi Bloc Provider. '
                    'Anda dapat menambah atau mengurangi angka dengan tombol yang tersedia, '
                    'dan perubahan data akan ditampilkan secara real-time menggunakan BlocProvider.',
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
                      // Mengakses Bloc dan memanggil metode remove
                      context.read<CounterProvider>().remove();
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
                  const DataWidget(),
                  GestureDetector(
                    onTap: () {
                  
                      context.read<CounterProvider>().add();
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
      ),
    );
  }
}
