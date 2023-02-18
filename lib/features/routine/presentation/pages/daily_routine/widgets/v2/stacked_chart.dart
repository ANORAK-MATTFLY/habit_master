import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_master/dep_injection.dart';
import 'package:habit_master/features/routine/domain/logic/weekly_progress.dart';
import 'package:habit_master/features/routine/infrastructure/models/routine_model.dart';
import 'package:habit_master/features/routine/infrastructure/models/weekly_progress_chart_model.dart';
import 'package:habit_master/features/routine/presentation/pages/daily_routine/bloc/cubit/tasks_list.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class StackedChart extends StatefulWidget {
  Routine routine;
  StackedChart({Key? key, required this.routine}) : super(key: key);

  @override
  State<StackedChart> createState() => _StackedChartState();
}

class _StackedChartState extends State<StackedChart> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final int totalHabits = context.read<HabitListCubit>().state.length;
    return FutureBuilder<List<ChartData>>(
        future: serviceLocator<StatsLogic>()
            .getWeeklyProgress(widget.routine.authorID!, totalHabits),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: Colors.white,
              ),
            );
          }
          if (!snapshot.hasData) {
            return const Center(
              child: CupertinoActivityIndicator(
                animating: true,
                color: Colors.white,
              ),
            );
          }

          final dailyProgress = snapshot.data!;
          return Container(
            padding: const EdgeInsets.only(right: 20.0),
            height: 250.0,
            width: MediaQuery.of(context).size.width - 100,
            child: SfCartesianChart(
              title: ChartTitle(
                text: 'Your weekly progress',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Twitterchirp",
                  fontSize: 12.0,
                ),
              ),
              legend: Legend(isVisible: false),
              tooltipBehavior: _tooltipBehavior,
              plotAreaBorderColor: Colors.red.withOpacity(0.0),
              borderWidth: 0.0,
              series: <ChartSeries>[
                StackedColumnSeries<ChartData, String>(
                  color: Colors.red,
                  trackColor: Colors.green,
                  trackBorderColor: Colors.green,
                  animationDelay: 0.5,
                  borderColor: Colors.red,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(95, 255, 218, 183),
                        Color.fromARGB(139, 94, 6, 75)
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.0, 0.7],
                      tileMode: TileMode.clamp),
                  groupName: 'Group A',
                  dataLabelSettings: const DataLabelSettings(
                      isVisible: true, showCumulativeValues: true),
                  dataSource: dailyProgress,
                  xValueMapper: (ChartData sales, _) => sales.x,
                  yValueMapper: (ChartData sales, _) => sales.y,
                ),
              ],
              enableAxisAnimation: true,
              primaryYAxis: CategoryAxis(
                minorGridLines:
                    MinorGridLines(color: Colors.red.withOpacity(0.0)),
                majorGridLines:
                    MajorGridLines(color: Colors.red.withOpacity(0.0)),
                axisLine: AxisLine(color: Colors.red.withOpacity(0.0)),
                minorTickLines:
                    MinorTickLines(color: Colors.red.withOpacity(0.0)),
                majorTickLines:
                    MajorTickLines(color: Colors.red.withOpacity(0.0)),
                labelStyle: TextStyle(
                  color: Colors.white.withOpacity(0.0),
                  fontFamily: "Twitterchirp",
                ),
              ),
              primaryXAxis: CategoryAxis(
                arrangeByIndex: true,
                majorTickLines:
                    MajorTickLines(color: Colors.red.withOpacity(0.0)),
                minorGridLines:
                    MinorGridLines(color: Colors.red.withOpacity(0.0)),
                majorGridLines:
                    MajorGridLines(color: Colors.red.withOpacity(0.0)),
                axisLine: AxisLine(color: Colors.red.withOpacity(0.0)),
                borderColor: const Color(0x0003020C),
                rangePadding: ChartRangePadding.auto,
                associatedAxisName: "Mon",
                labelAlignment: LabelAlignment.center,
                labelPlacement: LabelPlacement.betweenTicks,
                labelStyle: const TextStyle(
                    color: Colors.white,
                    fontFamily: "Twitterchirp",
                    fontSize: 12.0),
              ),
            ),
          );
        });
  }
}
