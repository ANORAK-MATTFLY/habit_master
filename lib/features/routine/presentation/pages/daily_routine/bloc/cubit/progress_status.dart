import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressStatus extends Cubit<int> {
  ProgressStatus() : super(0);

  void updateState(int progressStatusState) => emit(progressStatusState);
}
