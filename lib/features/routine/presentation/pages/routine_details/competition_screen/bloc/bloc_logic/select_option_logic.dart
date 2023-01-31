import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/select_option.dart';
import '../interfaces/option_interface.dart';
import '../states/option_state.dart';

class SelectOptionsBloc extends Bloc<Option, OptionState?> {
  SelectOptionsBloc() : super(null) {
    on<SelectOptionAction>((event, emit) async {
      final selectedOption = event.optionData;

      final option = OptionState(option: selectedOption);
      emit(option);
    });
  }
}
