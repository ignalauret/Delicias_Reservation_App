import 'package:delicias_turns_app/providers/turns_provider.dart';
import 'package:delicias_turns_app/screens/home/home_screen.dart';
import 'package:delicias_turns_app/screens/turn_detail/turn_detail_screen.dart';
import 'package:delicias_turns_app/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TurnsProvider>(
          create: (context) => TurnsProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: CustomColors.kMainColor,
          accentColor: CustomColors.kMainColor,
          fontFamily: "Montserrat",
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomeScreen(),
        routes: {
          TurnDetailScreen.routeName: (context) => TurnDetailScreen(),
        },
      ),
    );
  }
}
