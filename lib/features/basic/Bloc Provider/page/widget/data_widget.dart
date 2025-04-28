import 'package:bloc_flutter/features/basic/Bloc%20Provider/bloc/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CounterProviderBloc counterDepedency =
        BlocProvider.of<CounterProviderBloc>(context);
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: Center(
        child: BlocBuilder(
          bloc: counterDepedency,
          builder: (context, state) {
            return Text(
              '$state',
              style: const TextStyle(color: Colors.white, fontSize: 50),
            );
          },
        ),
      ),
    );
  }
}
