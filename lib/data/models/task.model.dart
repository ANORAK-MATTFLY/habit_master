import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TaskModel {
  String? taskName;
  String? taskDescription;
  String? initIcon;
  bool? isDone;
  String? taskID;
  Widget? doneIcon;
  String? dueTime;
  String? taskType;
  TaskModel({
    this.taskName,
    this.taskDescription,
    this.initIcon,
    this.isDone,
    this.taskID,
    this.doneIcon,
    this.dueTime,
    this.taskType,
  });
}

List<TaskModel> tasks = [
  TaskModel(
    taskName: "I brush my teeth",
    taskDescription: "Brush your teeth for 2 - 3 minutes",
    initIcon: "assets/images/tooth.png",
    isDone: false,
    taskID: "1",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "checkable",
  ),
  TaskModel(
    taskName: "I start working",
    taskDescription: "Work for 10 - 12 hours",
    initIcon: "assets/images/working.png",
    isDone: false,
    taskID: "2",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "chrono",
  ),
  TaskModel(
    taskName: "I brush my teeth",
    taskDescription: "Brush your teeth for 2 - 3 minutes",
    initIcon: "assets/images/tooth.png",
    isDone: false,
    taskID: "1",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "checkable",
  ),
  TaskModel(
    taskName: "I start working",
    taskDescription: "Work for 10 - 12 hours",
    initIcon: "assets/images/working.png",
    isDone: false,
    taskID: "2",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "chrono",
  ),
  TaskModel(
    taskName: "I brush my teeth",
    taskDescription: "Brush your teeth for 2 - 3 minutes",
    initIcon: "assets/images/tooth.png",
    isDone: false,
    taskID: "1",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "checkable",
  ),
  TaskModel(
    taskName: "I start working",
    taskDescription: "Work for 10 - 12 hours",
    initIcon: "assets/images/working.png",
    isDone: false,
    taskID: "2",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "chrono",
  ),
  TaskModel(
    taskName: "I brush my teeth",
    taskDescription: "Brush your teeth for 2 - 3 minutes",
    initIcon: "assets/images/tooth.png",
    isDone: false,
    taskID: "1",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "checkable",
  ),
  TaskModel(
    taskName: "I start working",
    taskDescription: "Work for 10 - 12 hours",
    initIcon: "assets/images/working.png",
    isDone: false,
    taskID: "2",
    doneIcon:
        Lottie.asset("assets/animations/done_animation.json", repeat: false),
    dueTime: "7:00",
    taskType: "chrono",
  ),
];
