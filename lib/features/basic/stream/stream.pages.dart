import 'dart:async';
import 'package:flutter/material.dart';

class StreamControlledPage extends StatefulWidget {
  const StreamControlledPage({super.key});

  @override
  State<StreamControlledPage> createState() => _StreamControlledPageState();
}

class _StreamControlledPageState extends State<StreamControlledPage> {
  late StreamController<int> _controller;
  Timer? _timer;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = StreamController<int>();
  }

  void _startStream() {
    // Cancel timer jika sebelumnya sedang jalan
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_current > 10) {
        _pauseStream();
      } else {
        _controller.sink.add(_current++);
      }
    });
  }

  void _pauseStream() {
    _timer?.cancel();
  }

  void _resetStream() {
    _pauseStream();
    _controller.close(); // Tutup controller lama
    _current = 0;
    // Buat controller baru dan assign ulang dalam setState
    setState(() {
      _controller = StreamController<int>();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
            stream: _controller.stream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text("Belum mulai...", style: TextStyle(fontSize: 24));
              }
              return Text("Angka: ${snapshot.data}", style: const TextStyle(fontSize: 50));
            },
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: _startStream, child: const Text("Start")),
              ElevatedButton(onPressed: _pauseStream, child: const Text("Pause")),
              ElevatedButton(onPressed: _resetStream, child: const Text("Reset")),
            ],
          )
        ],
      ),
    );
  }
}
