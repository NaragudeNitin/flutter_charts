import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_charts/widgets/buttonwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialchartWidget extends StatefulWidget {
  const RadialchartWidget({super.key});

  @override
  State<RadialchartWidget> createState() => _RadialchartWidgetState();
}

class _RadialchartWidgetState extends State<RadialchartWidget> {

  List<RadialData> chartData =[
    RadialData(9000, 'Nitin'),
    RadialData(15000, "Tushar"),
    RadialData(12000, "Aniket"),
    RadialData(17000, 'Ratan'),
    RadialData(8500, 'Punit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Radial Chart"),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            margin: const EdgeInsets.all(10),
            child: SfCircularChart(
              title: ChartTitle(text: 'Sales Data'), 
              legend: Legend(isVisible: true),
              series: [
                RadialBarSeries<RadialData, String>(//donought//
                  radius: '100',
                  innerRadius: '20',
                  trackColor: Colors.grey.shade800,
                  cornerStyle: CornerStyle.bothCurve,
                  gap: '5%',        
                  dataSource: chartData,
                  xValueMapper: (RadialData data, _) => data.xData, 
                  yValueMapper: (RadialData data, _) => data.yData,
                  dataLabelSettings: const DataLabelSettings(isVisible: true)
                ),
              ],
            )
          ),
          const SizedBox(height: 10,),
          const ButtonWidet(),
        ],
      ),
    );
  }
}

class RadialData {
  final num yData;
  final String xData;

  RadialData(this.yData, this.xData);
}