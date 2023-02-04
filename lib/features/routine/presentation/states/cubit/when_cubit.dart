import 'package:flutter_bloc/flutter_bloc.dart';

class MomentTaskCubit extends Cubit<String> {
  MomentTaskCubit() : super("Morning");

  void updateState(String newState) => emit(newState);
}
