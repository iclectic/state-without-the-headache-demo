import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'score_feature.dart';
import 'score_model.dart';

void main() => runApp(const ScoreApp());

class ScoreApp extends StatelessWidget {
  const ScoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Without the Headache',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: const Color(0xFF02569B)),
      home: ChangeNotifierProvider(
        create: (_) => ScoreModel(),
        child: const ScoreFeature(),
      ),
    );
  }
}
