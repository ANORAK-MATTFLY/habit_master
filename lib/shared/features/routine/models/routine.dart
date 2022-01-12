class RoutineModel {
  String? ownerName;
  String? ownerImage;

  RoutineModel({this.ownerImage, this.ownerName});
}

List<RoutineModel> routines = [
  RoutineModel(
    ownerName: "Elon Musk",
    ownerImage: "assets/images/elon-musk.png",
  ),
  RoutineModel(
    ownerName: "Bill Gate",
    ownerImage: "assets/images/bill-gate.png",
  ),
];
