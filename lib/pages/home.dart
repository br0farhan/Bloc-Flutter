import 'package:bloc_flutter/bloc/counter.dart';
import 'package:bloc_flutter/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc myCounter = context.read<CounterBloc>();
    ThemeBloc myTheme = context.read<ThemeBloc>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text("Multi Bloc Listener"),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.switch_access_shortcut),
          onPressed: () {
            myTheme.changeTheme();
          }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MultiBlocListener(
              listeners: [
                BlocListener<CounterBloc, int>(
                  listenWhen: (previous, current) {
                    if (current > 10) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Datanya lebih dari 10"),
                      ),
                    );
                  },
                ),
                BlocListener<ThemeBloc, bool>(
                  listenWhen: (previous, current) {
                    if (current == false) {
                      return true;
                    }
                    return false;
                  },
                  listener: (context, state) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text("Theme is Dark"),
                      ),
                    );
                  },
                )
              ],
              child: BlocBuilder<CounterBloc, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text(
                    "$state",
                    style: const TextStyle(fontSize: 50),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.remove();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.add();
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
