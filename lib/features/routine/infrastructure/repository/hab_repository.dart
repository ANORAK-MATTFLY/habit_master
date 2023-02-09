class RoutineRepository<T> {
  final Function event;
  Function eventValidator;

  RoutineRepository({
    required this.event,
    required this.eventValidator,
  });

  eventExecutor() {
    final result = eventValidator();
    if (result == true) {
      return event;
    }
  }
}

final data = RoutineRepository(
  event: () {},
  eventValidator: (Future<bool> event) {},
);
