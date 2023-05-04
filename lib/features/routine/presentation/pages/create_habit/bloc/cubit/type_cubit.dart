import 'package:flutter_bloc/flutter_bloc.dart';

class TypeTaskCubit extends Cubit<String> {
  TypeTaskCubit() : super("Check task ✅");

  void updateState(String newState) => emit(newState);
}
