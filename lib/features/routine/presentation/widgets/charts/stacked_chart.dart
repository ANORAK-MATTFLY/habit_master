import 'package:flutter/material.dart';
import 'package:habit_master/features/routine/models/weekly_progress_chart_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StackedChart extends StatefulWidget {
  const StackedChart({Key? key}) : super(key: key);

  @override
  _StackedChartState createState() => _StackedChartState();
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
    return Container(
      padding: const EdgeInsets.only(right: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width - 100,
      child: SfCartesianChart(
        title: ChartTitle(
          text: 'Your weelky progress',
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: "Twitterchirp",
            fontSize: 10.0,
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
                  colors: [Color(0x2AC4EECB), Color(0x3A5E064B)],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [0.0, 0.7],
                  tileMode: TileMode.clamp),
              groupName: 'Group A',
              dataLabelSettings: const DataLabelSettings(
                  isVisible: true, showCumulativeValues: true),
              dataSource: chartData,
              xValueMapper: (ChartData sales, _) => sales.x,
              yValueMapper: (ChartData sales, _) => sales.y),
        ],
        enableAxisAnimation: true,
        primaryYAxis: CategoryAxis(
          minorGridLines: MinorGridLines(color: Colors.red.withOpacity(0.0)),
          majorGridLines: MajorGridLines(color: Colors.red.withOpacity(0.0)),
          axisLine: AxisLine(color: Colors.red.withOpacity(0.0)),
          minorTickLines: MinorTickLines(color: Colors.red.withOpacity(0.0)),
          majorTickLines: MajorTickLines(color: Colors.red.withOpacity(0.0)),
          labelStyle: TextStyle(
            color: Colors.white.withOpacity(0.0),
            fontFamily: "Twitterchirp",
          ),
        ),
        primaryXAxis: CategoryAxis(
          arrangeByIndex: true,
          majorTickLines: MajorTickLines(color: Colors.red.withOpacity(0.0)),
          minorGridLines: MinorGridLines(color: Colors.red.withOpacity(0.0)),
          majorGridLines: MajorGridLines(color: Colors.red.withOpacity(0.0)),
          axisLine: AxisLine(color: Colors.red.withOpacity(0.0)),
          borderColor: const Color(0x0003020C),
          rangePadding: ChartRangePadding.auto,
          associatedAxisName: "Mon",
          labelAlignment: LabelAlignment.center,
          labelPlacement: LabelPlacement.betweenTicks,
          labelStyle: const TextStyle(
              color: Colors.white, fontFamily: "Twitterchirp", fontSize: 12.0),
        ),
      ),
    );
  }
}
