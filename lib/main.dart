import 'package:flutter/material.dart';
import 'package:league_of_legends_app/models/Champion.dart';
import 'package:league_of_legends_app/screens/Home.dart';
import 'package:league_of_legends_app/screens/ProfileScreen.dart';
import 'package:league_of_legends_app/services/Lol_service.dart';
import 'package:league_of_legends_app/utils/Constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LOLService _lolService = LOLService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider<List<Champion>>(
            create: (context) => _lolService.fetchChampions(),
          )
        ],
        child: MaterialApp(
          theme: Constants.darkTheme,
          title: 'Flutter LoL',
          initialRoute: '/',
          routes: {
            '/': (context) => HomeScreen(),
            '/profile': (context) => ProfileScreen()
          },
        ));
  }
}
