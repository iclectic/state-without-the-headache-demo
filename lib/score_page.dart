import 'package:flutter/material.dart';

import 'demo_box.dart';
import 'score_model.dart';

/// 02 · ScoreModel owns the score. ScorePage still creates and disposes it,
/// and listens with ListenableBuilder (no package yet).
class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  final ScoreModel model = ScoreModel();

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final builds = countBuild('ScorePage');
    return Scaffold(
      appBar: AppBar(title: const Text('02 · ScoreModel')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: DemoBox(
            name: 'ScorePage',
            builds: builds,
            child: ListenableBuilder(
              listenable: model,
              builder: (context, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ScoreText(score: model.score),
                    // Widgets express intent; the model does the mutation.
                    Controls(onIncrement: model.increment),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreText extends StatelessWidget {
  const ScoreText({super.key, required this.score});

  final int score;

  @override
  Widget build(BuildContext context) {
    final builds = countBuild('ScoreText');
    return DemoBox(
      name: 'ScoreText',
      builds: builds,
      child: Text(
        'Score: $score',
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.onIncrement});

  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    final builds = countBuild('Controls');
    return DemoBox(
      name: 'Controls',
      builds: builds,
      child: ElevatedButton(
        onPressed: onIncrement,
        child: const Text('+'),
      ),
    );
  }
}
