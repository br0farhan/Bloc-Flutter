import 'package:bloc_flutter/bloc/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtherPages extends StatelessWidget {
  const OtherPages({super.key});

  @override
  Widget build(BuildContext context) {
    Counter counter = context.read<Counter>();
    return  Scaffold(
      appBar: AppBar(
        title: Text("Other Pages"),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<Counter, int>(
              bloc: counter,
              builder: (context, state) {
                return Text("${state}", 
                style: TextStyle(
                  fontSize: 50
                ),);
              }
            )
          ],
        ),
      ),
    );
  }
}