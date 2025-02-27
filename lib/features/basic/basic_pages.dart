import 'package:bloc_flutter/features/basic/counter/presentation/blocs/counter.dart';
import 'package:bloc_flutter/features/basic/counter/presentation/pages/counter_page.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/pages/pattern_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Events
abstract class CategoryBasicEvent {}

class LoadCategories extends CategoryBasicEvent {}

// Bloc States
abstract class CategoryBasicState {}

class CategoryLoading extends CategoryBasicState {}

class CategoryLoaded extends CategoryBasicState {
  final List<String> categories;
  CategoryLoaded(this.categories);
}

// Bloc
class CategoryBasicBloc extends Bloc<CategoryBasicEvent, CategoryBasicState> {
  CategoryBasicBloc() : super(CategoryLoading()) {
    on<LoadCategories>((event, emit) async {
      // Simulate fetching categories
      await Future.delayed(const Duration(seconds: 1)); // Tunggu 1 detik
      emit(CategoryLoaded([
        'Counter',
        'Pattern',
      ]));
    });
  }
}

class BasicPages extends StatelessWidget {
  const BasicPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Pages'),
      ),
      body: BlocProvider(
        create: (context) => CategoryBasicBloc()..add(LoadCategories()),
        child: BlocBuilder<CategoryBasicBloc, CategoryBasicState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      String category = state.categories[index];
                      Widget page;
                      switch (category) {
                        case 'Counter':
                          page = BlocProvider(
                            create: (context) => CounterBloc(),
                            child: const CounterPage(),
                          );
                          break;
                        case 'Pattern':
                          page = const PatternPage();
                          break;
                        default:
                          page = const PatternPage();
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => page),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          state.categories[index],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
