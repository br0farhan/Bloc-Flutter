import 'package:bloc_flutter/features/basic/Bloc%20Provider/bloc/counter_provider.dart';
import 'package:bloc_flutter/features/basic/basic_pages.dart';
import 'package:bloc_flutter/home/comingsoon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Events
abstract class CategoryEvent {}

class LoadCategories extends CategoryEvent {}

// Bloc States
abstract class CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<String> categories;
  CategoryLoaded(this.categories);
}

// Bloc
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc() : super(CategoryLoading()) {
    on<LoadCategories>((event, emit) async {
      // Simulate fetching categories
      await Future.delayed(const Duration(seconds: 1)); // Tunggu 1 detik
      emit(CategoryLoaded([
        'Basic',
        'Business',
        'Health',
        'Education',
        'Sports',
        'Entertainment'
      ]));
    });
  }
}

// UI Home
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home - Categories')),
      body: BlocProvider(
        create: (context) => CategoryBloc()..add(LoadCategories()),
        child: BlocBuilder<CategoryBloc, CategoryState>(
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
                        case 'Basic':
                          page = BlocProvider(
                            create: (context) => CategoryBasicBloc(),
                            child: const BasicPages(),
                          );
                          break;
                        case 'Cooming Soon':
                          page = const Comingsoon(
                            category: 'Coming Soon',
                          );
                          break;
                        default:
                          page = Comingsoon(category: category);
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

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
