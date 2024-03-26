import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'routes/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
          title: 'Accurate CPSSOFT',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            primaryColor: kWhiteColor,
            colorScheme: kColorScheme.copyWith(secondary: kPrimaryColor),
            bottomNavigationBarTheme: bottomNavigationBarTheme,
          ),
          navigatorKey: navigatorKey, // Set the navigatorKey
          onGenerateRoute: mapRegisterRoutesWithParameters,
          initialRoute: '/',
          routes: mapRegisterRoutes());
    });
  }
}
