// import 'package:circular_chart_flutter/circular_chart_flutter.dart';
// import 'package:coding_challenge_kjbn/utils/style_guide.dart';
// import 'package:flutter/material.dart';

// class PercentageChart extends StatelessWidget {
//   double percentage;
//   String rankKey;
//   double fontSize;
//   Color fontColor;
//   PercentageChart(
//       {this.percentage = 0.0,
//       this.rankKey = "",
//       this.fontSize = 0.0,
//       this.fontColor = Colors.black});

//   var _chartSize = const Size(200.0, 200.0);

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedCircularChart(
//       key: key,
//       size: _chartSize,
//       initialChartData: <CircularStackEntry>[
//         CircularStackEntry(
//           <CircularSegmentEntry>[
//             CircularSegmentEntry(
//               percentage * (100 / 5),
//               Colors.green[400],
//               rankKey: rankKey,
//             ),
//             CircularSegmentEntry(
//               100,
//               //glowPurple,
//               Colors.black26,
//               rankKey: rankKey,
//             ),
//           ],
//         ),
//       ],
//       chartType: CircularChartType.Radial,
//       percentageValues: true,
//       edgeStyle: SegmentEdgeStyle.round,
//       holeLabel: '0:0${percentage.toInt()}',
//       labelStyle: display2.copyWith(
//         color: fontColor,
//         fontWeight: FontWeight.bold,
//         fontSize: fontSize,
//       ),
//     );
//   }
// }
