part of 'widgets.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            color: kGreenColor,
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Text(
          "Loading ...",
          style: blackTextStyle.copyWith(fontWeight: regular),
        ),
      ],
    );
  }
}
