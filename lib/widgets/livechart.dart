import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'buttonwidget.dart';

class LiveChartWidget extends StatefulWidget {
  const LiveChartWidget({super.key});

  @override
  State<LiveChartWidget> createState() => _LiveChartWidgetState();
}

class _LiveChartWidgetState extends State<LiveChartWidget> {
  late List<LiveData> chartData =[];
  late ChartSeriesController _chartSeriesController;
  int time = 10;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chartData = getChartData();
    Timer.periodic( const Duration(seconds: 1),updateDataSource);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Chart'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8.0),
            height: 400,
            child: SfCartesianChart(
              legend: Legend(isVisible: true),
              series: [
                LineSeries<LiveData, int>(
                  onRendererCreated: (ChartSeriesController controller) {
                    _chartSeriesController = controller;
                  } ,
                  dataSource: chartData, 
                  legendItemText: 'speed',
                  xValueMapper: (LiveData data, _)=>data.time, 
                  yValueMapper: (LiveData data, _)=>data.speed,
                  xAxisName: 'Time',
                  yAxisName: 'Speed',
                ),
              ],
              primaryXAxis: NumericAxis(
                majorGridLines: const MajorGridLines(width: 1),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 2,
                title: AxisTitle(text: 'Time(Seconds)'),
              ),
              primaryYAxis: NumericAxis(
                majorGridLines: const MajorGridLines(width: 1),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                interval: 2,
                title: AxisTitle(text: 'Speed(m/s)'),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          const ButtonWidet(),
        ],
      ),
    );
  }
  
  List<LiveData> getChartData() {
    return<LiveData>[
      LiveData(0, 42),
      LiveData(1, 43),
      LiveData(2, 48),
      LiveData(3, 49),
      LiveData(4, 41),
      LiveData(5, 40),
      LiveData(6, 42),
      LiveData(7, 45),
      LiveData(8, 44),
      LiveData(9, 49),
    ];
  }
  
  updateDataSource(Timer timer) {
     chartData.add(LiveData(time++, (math.Random().nextInt(60))));
     chartData.removeAt(0);
     _chartSeriesController.updateDataSource(
      addedDataIndex: chartData.length-1,
      removedDataIndex: 0,
     );
  }
}

class LiveData {
  final int time;
  final num speed;

  LiveData(this.time, this.speed);
}