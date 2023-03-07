import 'package:flutter_bloc/flutter_bloc.dart';

class ShowUserInfoCubit extends Cubit<bool> {
  ShowUserInfoCubit() : super(false);

  void updateState() => emit(!state);
}
