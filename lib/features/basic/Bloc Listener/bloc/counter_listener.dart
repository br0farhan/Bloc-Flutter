import 'package:bloc/bloc.dart';

class CounterListener extends Cubit<int> {
  CounterListener({this.init = 0}) : super(init);

  int init;

  void add() => emit(state + 1);
  void remove() => emit(state - 1);

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error);
  } 
}
