import 'package:bloc/bloc.dart';
import 'package:habit_master/data/models/master.model.dart';
import 'package:meta/meta.dart';
part 'master.state.dart';

class MasterCubit extends Cubit<MasterState> {
  MasterCubit() : super(MasterState(master: masterModel()));
  void onGetMasterList() async {}
}
