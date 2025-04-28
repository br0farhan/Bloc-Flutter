import 'package:bloc_flutter/features/basic/Bloc%20Builder/page/blocBulider_basic.dart';
import 'package:bloc_flutter/features/basic/Bloc%20Consumer/page/blocConsumer_basic.dart';
import 'package:bloc_flutter/features/basic/Bloc%20Listener/page/blocListener_basic.dart';
import 'package:bloc_flutter/features/basic/Bloc%20Provider/bloc/counter_provider.dart';
import 'package:bloc_flutter/features/basic/Bloc%20Provider/page/blocProvider_basic.dart';
import 'package:bloc_flutter/features/basic/Depedecny%20Injection/bloc/counter_depedency_bloc.dart';
import 'package:bloc_flutter/features/basic/Depedecny%20Injection/page/depedency_injection_basic.dart';
import 'package:bloc_flutter/features/basic/pattern/presentation/pages/pattern_page.dart';
import 'package:bloc_flutter/features/basic/stream/stream.pages.dart';
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
        'Pattern',
        'Stream',
        'Bloc Builder',
        'Bloc Listener',
        'Bloc Consumer',
        'Bloc Provider',
        'Depedency'
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
                        case 'Stream':
                          page = const StreamControlledPage();
                          break;
                        case 'Pattern':
                          page = const PatternPage();
                          break;
                        case 'Bloc Builder':
                          page = const BlocBuilderBasic();
                          break;
                        case 'Bloc Listener':
                          page = const BlocListenerBasic();
                          break;
                        case 'Bloc Consumer':
                          page = BlocconsumerBasic();
                          break;
                        case 'Bloc Provider':
                          page = BlocProvider(
                            create: (context) => CounterProviderBloc(),
                            child: const BlocproviderBasic(),
                          );

                          break;
                        case 'Depedency':
                          page = BlocProvider(
                            create: (context) => CounterDepedencyBloc(),
                            child: const DepedencyInjectionBasic(),
                          );
                          break;
                        default:
                          page = const BasicPages();
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
