import 'package:flutter/material.dart';

import 'chart_bar/chart_bar.dart';
import 'chart_bar/models/chart_bar_data.dart';
import 'chart_bar/chart_linker.dart';
import 'chart_bar/models/chart_linker_data.dart';

final data = [
  [
    ChartBarData(
        percent: 130,
        color: Colors.red,
        label: "Hello"),
    ChartBarData(
        percent: 80,
        color: Colors.yellow,
        label: "Hello"),
    ChartBarData(
        percent: 50,
        color: Colors.yellow,
        label: "Hello"),
    ChartBarData(
        percent: 40,
        color: Colors.black,
        label: "Hello")
  ],
  [
    ChartBarData(
        percent: 200,
        color: Colors.red,
        label: "Hello"),
    ChartBarData(
        percent: 70,
        color: Colors.red,
        label: "Hello"),
    ChartBarData(
        percent: 20,
        color: Colors.yellow,
        label: "Hello"),
    ChartBarData(
        percent: 80,
        color: Colors.black,
        label: "Hello")
  ],
  [
    ChartBarData(
        percent: 100,
        color: Colors.red,
        label: "Hello"),
    ChartBarData(
        percent: 130,
        color: Colors.yellow,
        label: "Hello"),
    ChartBarData(
        percent: 80,
        color: Colors.black,
        label: "Hello"),
    ChartBarData(
        percent: 40,
        color: Colors.black,
        label: "Hello")
  ],
];

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [

        ChartBar(items: data[0]),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 6), child: ChartLinker(items: [
          ChartLinkerData(h1: 130, h2: 200, color: Colors.red),
          ChartLinkerData(h1: 80, h2: 70, color: Colors.yellow),
          ChartLinkerData(h1: 10, h2: 10, color: Colors.yellow),
          ChartLinkerData(h1: 40, h2: 40, color: Colors.yellow),
        ],)),
        ChartBar(items: data[1]),
        // const Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: ChartLinker(items: [],)),
        // ChartBar(items: data[2]),
      ],
    );
  }
}
