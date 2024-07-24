import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  Stream<int> numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    print("REBUILD");
    return Scaffold(
        appBar: AppBar(
          title: const Text("Streams App"),
        ),
        body: StreamBuilder<int>(
          stream: numberStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              return Center(
                child: Text(
                  "${snapshot.data}",
                  style: TextStyle(fontSize: 50),
                ),
              );
            } else {
              return Center(
                child: Text(
                  "No Data",
                  style: TextStyle(fontSize: 50),
                ),
              );
            }
          },
        ));
  }
}
