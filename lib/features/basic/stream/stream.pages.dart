import 'package:flutter/material.dart';

class StreamPages extends StatelessWidget {
  const StreamPages({super.key});

  @override
  Widget build(BuildContext context) {

    Stream<int> countStream() async* {
      for(int i = 0; i <= 10; i++){
        await Future.delayed(const Duration(seconds: 1));
        yield i;
      }
    }
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
      ),
      body: StreamBuilder(stream: countStream(), builder: (context, snapshot){
        if(snapshot.connectionState ==  ConnectionState.waiting){
          return const Center(
            child: Text('Loading...'),
          );
        } else {
          return Center(
            child: Text('${snapshot.data}', style: const TextStyle(
              fontSize: 25
            ),),
          );
        }
      }
    ),
    );
  }
}