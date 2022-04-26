import 'package:efashion/view_model/cubits/page_indicator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'view/routes/app_route.dart';
import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  final AppRoute _appRoute = AppRoute();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MultiBlocProvider(
      providers: [
        BlocProvider<PageIndicatorCubit>(
          create: (BuildContext context) => PageIndicatorCubit(),
        ),
        // BlocProvider<MapPinBloc>(
        //   create: (BuildContext context) => MapPinBloc(),
        // ),
        // BlocProvider<LanguageBloc>(
        //   create: (BuildContext context) => LanguageBloc(),
        // ),
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: bgColor,
          fontFamily: "Work Sans",
          primarySwatch: Colors.teal,
          backgroundColor: bgColor,
          textTheme: const TextTheme(
              subtitle2: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
              subtitle1: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              bodyText1: TextStyle(
                  color: textColor, fontSize: 30, fontWeight: FontWeight.bold),
              bodyText2: TextStyle(
                  color: primaryColor, fontSize: 18, fontWeight: FontWeight.bold),
              button: TextStyle(color: textColor, fontSize: 15),
              headline2: TextStyle(fontSize: 15),
              headline1: TextStyle(color: textColor, fontSize: 20, fontWeight: FontWeight.bold)
          ),
        ),
        onGenerateRoute: (routeSettings)=> _appRoute.onGenerateRoute(routeSettings),
        initialRoute: '/',
      ),
    ) ;
  }

}