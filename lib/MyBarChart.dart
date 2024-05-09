//MyBarChart.dart

import 'package:charts_flutter/flutter.dart' as charts;

import 'package:flutter/material.dart';

class MyBarChart extends StatelessWidget {
  final List<charts.Series<MyChartData, String>>
      seriesList; // Corrigido para o tipo correto
  final bool? animate; // Adicionando "?" para permitir valores nulos

  const MyBarChart(this.seriesList, {super.key, this.animate});

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create a [BarChart] with the provided data.
  factory MyBarChart.withData(List<MyChartData> data) {
    return MyBarChart(
      _createData(data),
      // Set animate to true for animations
      animate: true,
    );
  }

  /// Create one series with the provided data.
  static List<charts.Series<MyChartData, String>> _createData(
      List<MyChartData> data) {
    return [
      charts.Series<MyChartData, String>(
        id: 'Data',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (MyChartData data, _) => data.category,
        measureFn: (MyChartData data, _) => data.value,
        data: data,
      ),
    ];
  }
}

/// Sample data type.
class MyChartData {
  final String category;
  final int value;

  MyChartData(this.category, this.value);
}
