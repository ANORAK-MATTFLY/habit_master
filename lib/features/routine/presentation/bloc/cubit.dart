import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<bool> {
  CounterCubit() : super(false);

  void updateState() => emit(!state);
}
