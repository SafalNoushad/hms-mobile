import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/router/router.dart';
import 'data/provider/data_provider.dart';

late SharedPreferences sharedPreferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(ChangeNotifierProvider(create: (context) => DataProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getRouterConfig('/');
    return MaterialApp.router(title: 'HMS Mobile', routerConfig: router, debugShowCheckedModeBanner: false);
  }
}
