part of 'widgets.dart';

void snackBarDialog(BuildContext context, List<String> message,
    {Color warnaSnackbar = Colors.red,
    Color warnaTeks = Colors.white,
    IconData icon = Icons.error}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: message.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(message[index],
                      style: TextStyle(color: warnaTeks),
                      overflow: TextOverflow.visible),
                ),
                Icon(
                  icon,
                  color: Colors.white,
                )
              ],
            );
          }),
    ),
    backgroundColor: warnaSnackbar,
  ));
}
