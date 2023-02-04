import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/states/events/request_author.dart';
import 'package:habit_master/features/routine/presentation/states/interfaces/author.dart';
import 'package:habit_master/features/routine/presentation/states/states/author_state.dart';

class AuthorBlocLogic extends Bloc<AuthorBlocInterface, AuthorState?> {
  AuthorBlocLogic() : super(null) {
    on<RequestAuthor>((event, emit) async {
      final selectedOption = event.author;

      final option = AuthorState(author: selectedOption);
      emit(option);
    });
  }
}
