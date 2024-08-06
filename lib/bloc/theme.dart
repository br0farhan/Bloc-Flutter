import 'package:bloc/bloc.dart';

class ThemeBloc extends Cubit<bool> {
  //true -> light | false -> dark
  ThemeBloc() : super(true);

  void changeTheme() => emit(!state);
}
