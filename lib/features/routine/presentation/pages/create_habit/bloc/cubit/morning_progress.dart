import 'package:flutter_bloc/flutter_bloc.dart';

class MorningProgressCubit extends Cubit<int> {
  MorningProgressCubit() : super(0);

  void updateState(int newState) => emit(newState + 1);
}
