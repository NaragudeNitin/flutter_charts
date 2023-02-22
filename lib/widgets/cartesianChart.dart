import 'package:flutter/material.dart';
import 'package:flutter_charts/widgets/buttonwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChartWidget extends StatefulWidget {
  const CartesianChartWidget({super.key});

  @override
  State<CartesianChartWidget> createState() => _CartesianChartWidgetState();
}

class _CartesianChartWidgetState extends State<CartesianChartWidget> {
  final List<SalesData> chartData = [
    SalesData(2001, 34000, Colors.red),
    SalesData(2002, 37000, Colors.blueAccent),
    SalesData(2003, 3600, Colors.green),
    SalesData(2004, 3100, Colors.orange),
    SalesData(2005, 20000, Colors.purple )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cartesian Charts"),
      ),
      body: Column(
        children: [
          Container(
            height: 400,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              backgroundColor: Colors.black,
              legend: Legend(isVisible: true),
              title: ChartTitle(text: "Sales Data"),
              series: [//area//waterfall//bar//column
                LineSeries<SalesData, int>(
                  dashArray: <double>[10,5],
                  legendItemText: 'Sales',
                  dataSource: chartData,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper:  (SalesData sales, _) => sales.sales, 
                ),
              ],
            ),
          ),
          const SizedBox(height: 10,),
          const ButtonWidet()
        ],
      ),
    );
  }
}

class SalesData {
  final int year;
  final double sales; 
  final Color color;

  SalesData(this.year, this.sales, this.color);
}