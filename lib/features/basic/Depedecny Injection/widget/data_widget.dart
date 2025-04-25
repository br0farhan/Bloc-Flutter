import 'package:bloc_flutter/features/basic/Depedecny%20Injection/bloc/counter_depedency_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DataWidgetDepedency extends StatelessWidget {

   const DataWidgetDepedency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
 CounterDepedencyBloc counterDepedency = BlocProvider.of<CounterDepedencyBloc>(context);
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
