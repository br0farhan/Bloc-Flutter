import 'package:bloc_flutter/bloc/counter.dart';
import 'package:bloc_flutter/pages/data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Counter myCounter = context.read<Counter>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) {
            //     return BlocProvider.value(
            //       value: myCounter,
            //       child: const OtherPages(),
            //     );
            //   },
            // ));
            Navigator.pushNamed(context, "otherPages");
          }),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 104, 189),
        title: const Text(
          "Bloc Access",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    myCounter.decrement();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(Icons.remove),
                    ),
                  ),
                ),
              ),
              const DataWidget(),
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    myCounter.increment();
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 70,
                    child: Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
