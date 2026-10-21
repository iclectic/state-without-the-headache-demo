import 'package:flutter/material.dart';

import 'demo_box.dart';

/// 01 · Local state. ScorePage owns `score` and changes it with setState.
class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  int score = 0;

  @override
  Widget build(BuildContext context) {
    final builds = countBuild('ScorePage');
    return Scaffold(
      appBar: AppBar(title: const Text('01 · setState')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: DemoBox(
            name: 'ScorePage',
            builds: builds,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // The value is passed down through constructors...
                ScoreText(score: score),
                // ...and the change comes back up through a callback.
                Controls(
                  onIncrement: () {
                    setState(() {
                      score++;
                    });
                  },
                ),
              ],
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
