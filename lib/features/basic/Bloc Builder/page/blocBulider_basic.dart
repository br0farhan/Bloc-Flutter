import 'package:bloc_flutter/features/basic/Bloc%20Builder/bloc/counter_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocbuliderBasic extends StatelessWidget {
  CounterBuilder counter = CounterBuilder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("bLoc bulider basic"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder(builder: (context, state){
            return Text(
              "${state}",
              style: const TextStyle(fontSize: 100),
            );
          },
            bloc: counter,
            buildWhen: (previous, current)
            {
              if(current  == 5){
                return true;
              }
              else{
                return false;
              }
            },
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(onPressed: () {
                counter.remove();
              }, icon: const Icon(Icons.remove)),
              IconButton(onPressed: () {
                counter.add();
              }, icon: const Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }
}
