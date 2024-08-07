import 'package:bloc_flutter/bloc/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = context.read<UserBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Bloc Selector"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            BlocSelector<UserBloc, Map<String, dynamic>, String>(
              selector: (state) => state["name"],
              builder: (context, state) {
                print("Text build : Nama");
                return Text("NAMA :$state");
              },
            ),
            BlocSelector<UserBloc, Map<String, dynamic>, int>(
              selector: (state) => state["age"],
              builder: (context, state) {
                print("Text build : Umur");
                return Text("Umur :$state");
              },
            ),
            // TODO : Jika menggunakan Bloc Builder selama dalam wdiget didalamnya akan terbuild ulang semua
            // BlocBuilder<UserBloc, Map<String, dynamic>>(
            //   bloc: userBloc,
            //   builder: (context, state) {
            //     print("Text build : Nama");
            //     return Text("NAMA :${state["name"]}");
            //   },
            // ),
            // BlocBuilder<UserBloc, Map<String, dynamic>>(
            //   bloc: userBloc,
            //   builder: (context, state) {
            //       print("Text build : Umur");
            //     return Text("UMUR :${state["age"]} Tahun");
            //   },
            // ),

            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) {
                userBloc.changeName(value);
              },
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state["age"] - 1);
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      userBloc.changeAge(userBloc.state["age"] + 1);
                    },
                    icon: const Icon(Icons.add))
              ],
            )
          ],
        ),
      )),
    );
  }
}
