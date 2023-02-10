import 'package:flutter_bloc/flutter_bloc.dart';

class ShowErrorCubit extends Cubit<bool> {
  ShowErrorCubit() : super(false);

  void updateState(newState) => emit(newState);
}
