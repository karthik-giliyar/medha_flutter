import 'package:assaignment2/screens/home_page.dart';
import 'package:flutter/material.dart';
import './screens/home_page.dart';
import 'medha_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = MedhaTheme.dark();
    return MaterialApp(
      theme: theme,
      title: 'Medha',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
