import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiplatform_app_crud/common/theme.dart';
import 'package:multiplatform_app_crud/presentation/bloc/list_all_users/list_all_users_bloc.dart';
import 'package:multiplatform_app_crud/presentation/bloc/post_data/post_data_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'injection.dart' as di;
import 'presentation/bloc/cities/cities_bloc.dart';
import 'routes/navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListAllUsersBloc>(
          create: (_) => di.locator<ListAllUsersBloc>(),
        ),
        BlocProvider<CitiesBloc>(
          create: (_) => di.locator<CitiesBloc>(),
        ),
        BlocProvider<PostDataCubit>(
          create: (_) => di.locator<PostDataCubit>(),
        ),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
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
      }),
    );
  }
}
