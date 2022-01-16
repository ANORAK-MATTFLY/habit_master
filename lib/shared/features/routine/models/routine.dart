class RoutineModel {
  String? ownerName;
  String? ownerImage;
  String? ownerType;

  RoutineModel({this.ownerImage, this.ownerName, this.ownerType});
}

List<RoutineModel> routines = [
  RoutineModel(
    ownerName: "Elon Musk",
    ownerImage: "assets/images/elon-musk.png",
    ownerType: "Habit Master",
  ),
  RoutineModel(
    ownerName: "Bill Gate",
    ownerImage: "assets/images/bill-gate.png",
    ownerType: "Habit Master",
  ),
];

List<RoutineModel> celebritiesRoutines = [
  RoutineModel(
    ownerName: "Thomas Franks",
    ownerImage: "assets/images/thomas_frank.png",
    ownerType: "Celebrity",
  ),
  RoutineModel(
    ownerName: "Joey Schweitzer",
    ownerImage: "assets/images/joey_schweitzer.png",
    ownerType: "Celebrity",
  ),
];
