import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competion_screen/bloc/logic.dart';
import 'package:habit_master/features/routine/presentation/pages/routine_details/competion_screen/bloc/states/competitors_state.dart';

import 'events/load_person_action.dart';
import 'interfaces/competitors_event.dart';

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

class CompetitorsBloc extends Bloc<CompetitorsEventType, FetchResult?> {
  final Map<PersonUrl, Map<String, dynamic>> _cache = {};
  CompetitorsBloc() : super(null) {
    on<LoadCompetitorsAction>((event, emit) async {
      final url = event.url;
      if (_cache.containsKey(url)) {
        final cachedCompetitors = _cache[url]!;
        final result = FetchResult(
            competitors: cachedCompetitors, isRetrievedFromCache: true);

        // Notify any listeners this changes

        emit(result);
      } else {
        final cachedCompetitors =
            await getCompetitors('https://randomuser.me/api/');
        _cache[url] = cachedCompetitors;

        final result = FetchResult(
            competitors: cachedCompetitors, isRetrievedFromCache: false);

        // Notify any listeners this changes

        emit(result);
      }
    });
  }
}
