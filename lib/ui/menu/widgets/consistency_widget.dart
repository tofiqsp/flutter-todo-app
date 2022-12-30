import 'package:todo/todo.dart';

class ConsistencyWidget extends StatelessWidget {
  const ConsistencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LineChartWidget(),
          const SizedBox(height: 16),
          Text(
            'Good',
            style: Theme.of(context).textTheme.caption,
          ),
          const SizedBox(height: 6),
          Text(
            'Consistancy',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
