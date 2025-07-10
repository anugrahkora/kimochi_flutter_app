import 'package:flutter/material.dart';
import 'package:kimochi_flutter_app/app/router.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp.router(
       routerConfig: appRouter,
    );
  }
}