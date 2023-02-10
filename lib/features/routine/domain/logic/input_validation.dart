class CreateHabitValidation {
  String validateHabitName(String password) {
    if (password.isEmpty) {
      return "The habit's name is required";
    }
    return "Success";
  }
}
