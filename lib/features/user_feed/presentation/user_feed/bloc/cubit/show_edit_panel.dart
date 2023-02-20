import 'package:flutter_bloc/flutter_bloc.dart';

class ShowEditPanelCubit extends Cubit<bool> {
  ShowEditPanelCubit() : super(false);

  void updateState(newState) => emit(newState);
}
