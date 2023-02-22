import 'package:flutter/material.dart';
import 'package:flutter_charts/widgets/buttonwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PiechartWidget extends StatefulWidget {
  const PiechartWidget({super.key});

  @override
  State<PiechartWidget> createState() => _PiechartWidgetState();
}

class _PiechartWidgetState extends State<PiechartWidget> {

  List<PieData> chartData =[
    PieData(9000, 'Nitin'),
    PieData(15000, "Tushar"),
    PieData(12000, "Aniket"),
    PieData(17000, 'Ratan'),
    PieData(8500, 'Punit'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart"),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            margin: const EdgeInsets.all(10),
            child: SfCircularChart(
              backgroundColor: Colors.black,
              title: ChartTitle(text: 'Sales Data'), 
              legend: Legend(isVisible: true),
              series: [
                PieSeries<PieData, String>(
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  explode: true,
                  explodeIndex: 4,
                  dataSource: chartData,
                  xValueMapper: (PieData data, _) => data.xData,
                  yValueMapper: (PieData data, _) => data.yData,
                  dataLabelMapper: (PieData data, _) => data.xData,
                )
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

class PieData {
  final num yData;
  final String xData;

  PieData(this.yData, this.xData);
}