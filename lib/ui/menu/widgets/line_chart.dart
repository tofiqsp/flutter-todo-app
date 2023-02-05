import 'package:todo/todo.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TodoController todoController = Get.put(TodoController());
    return SizedBox(
      height: 80,
      child: Obx(
        () => LineChart(
          swapAnimationCurve: Curves.easeInOut,
          swapAnimationDuration: Duration(milliseconds: 500),
          LineChartData(
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,
              touchTooltipData: LineTouchTooltipData(
                tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
              ),
            ),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: false,
                  reservedSize: 32,
                  interval: 1,
                ),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            borderData: FlBorderData(
              show: false,
              border: const Border(
                bottom: BorderSide(color: Color(0xff4e4965), width: 1),
                left: BorderSide(color: Colors.transparent),
                right: BorderSide(color: Colors.transparent),
                top: BorderSide(color: Colors.transparent),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                isCurved: true,
                color: Theme.of(context).primaryColor,
                barWidth: 2,
                isStrokeCapRound: true,
                dotData: FlDotData(show: false),
                belowBarData: BarAreaData(
                  // show: true,
                  show: false,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                spots: todoController.isData.value
                    ? <FlSpot>[
                        FlSpot(0, 0),
                        FlSpot(1, 0),
                        FlSpot(3, 1.8),
                        FlSpot(7, 1.2),
                        FlSpot(10, 2.8),
                        FlSpot(12, 2.6),
                        FlSpot(13, 3.9),
                      ]
                    : <FlSpot>[
                        FlSpot(0, 0),
                        FlSpot(1, 0),
                        FlSpot(3, 0),
                        FlSpot(7, 0),
                        FlSpot(10, 0),
                        FlSpot(12, 0),
                        FlSpot(13, 0),
                      ],
              ),
            ],
            minX: 0,
            maxX: 14,
            maxY: 4,
            minY: 0,
          ),
        ),
      ),
    );
  }
}
