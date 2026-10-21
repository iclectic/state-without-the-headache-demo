import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'demo_box.dart';
import 'score_model.dart';

/// 04 · Each widget listens only to what it needs.
class ScoreFeature extends StatelessWidget {
  const ScoreFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final builds = countBuild('ScoreFeature');
    return Scaffold(
      appBar: AppBar(title: const Text('04 · Selector')),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 380),
          child: DemoBox(
            name: 'ScoreFeature',
            builds: builds,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScoreText(),
                HistoryList(),
                Controls(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreText extends StatelessWidget {
  const ScoreText({super.key});

  @override
  Widget build(BuildContext context) {
    // Selector: rebuild only when score changes, not when history does.
    return Selector<ScoreModel, int>(
      selector: (_, model) => model.score,
      builder: (context, score, child) {
        final builds = countBuild('ScoreText');
        return DemoBox(
          name: 'ScoreText',
          builds: builds,
          child: Text(
            'Score: $score',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      },
    );
  }
}

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<ScoreModel, List<int>>(
      selector: (_, model) => model.history,
      builder: (context, history, child) {
        final builds = countBuild('HistoryList');
        return DemoBox(
          name: 'HistoryList',
          builds: builds,
          child: history.isEmpty
              ? const Text('No history yet')
              : Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    for (final value in history.reversed.take(12))
                      Chip(label: Text('$value')),
                  ],
                ),
        );
      },
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({super.key});

  @override
  Widget build(BuildContext context) {
    // Controls act; they don't listen. read() inside the callbacks
    // means this widget never rebuilds when the model changes.
    final builds = countBuild('Controls');
    return DemoBox(
      name: 'Controls',
      builds: builds,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () => context.read<ScoreModel>().increment(),
            child: const Text('+'),
          ),
          const SizedBox(width: 12),
          OutlinedButton(
            onPressed: () => context.read<ScoreModel>().clearHistory(),
            child: const Text('Clear history'),
          ),
        ],
      ),
    );
  }
}
