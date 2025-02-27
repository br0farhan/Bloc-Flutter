import 'package:bloc_flutter/features/basic/counter/presentation/blocs/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {


  const CounterPage({super.key, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
      AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Builder(builder: (context) {
    
              CounterBloc myCounter = context.watch<CounterBloc>();
              return Text(
                "${myCounter.state}",
                style: TextStyle(fontSize: 100),
              );
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      // print("kurang");
                      context.read<CounterBloc>().remove();
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      // print("tambah");
                      context.read<CounterBloc>().add();
                    },
                    icon: Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
