part of 'widgets.dart';

class WidgetElseState extends StatelessWidget {
  final Widget widget;

  const WidgetElseState({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildNoData(context, widget);
  }

  Widget _buildNoData(BuildContext context, Widget message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 20.h,
        ),
        widget
      ],
    );
  }
}
