import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/user_feed/infrastrcture/model/post_model.dart';

class ListOfPostCubit extends Cubit<List<Post>> {
  ListOfPostCubit() : super([]);

  void updateState(newState) => emit(newState);
}
