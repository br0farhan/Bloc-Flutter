import 'package:bloc_flutter/features/basic/Bloc%20Listener/bloc/counter_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocListenerBasic extends StatelessWidget {
  const BlocListenerBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterListener(),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Bloc Listener Basic'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocListener<CounterListener, int>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text('Data Genap ${state}')),
                  );
                },
                listenWhen: (previous, current) {
                  if(current % 2 == 0){
                    return true;
                  } else{
                    return false;
                  }
                },
                child: BlocBuilder<CounterListener, int>(
                  builder: (context, state) {
                    return Center(
                      child: Text(
                        '$state',
                        style: const TextStyle(fontSize: 50),
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CounterListener>().remove();
                    },
                    icon: const Icon(Icons.remove),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CounterListener>().add();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
