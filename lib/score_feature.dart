import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'demo_box.dart';
import 'score_model.dart';

/// 03 · Provider exposes ScoreModel at the feature boundary (see main.dart).
/// ScoreFeature is now stateless: it no longer owns anything.
class ScoreFeature extends StatelessWidget {
  const ScoreFeature({super.key});

  @override
  Widget build(BuildContext context) {
    final builds = countBuild('ScoreFeature');
    return Scaffold(
      appBar: AppBar(title: const Text('03 · Provider')),
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
    // Consumer: only this builder reruns when ScoreModel notifies.
    return Consumer<ScoreModel>(
      builder: (context, model, child) {
        final builds = countBuild('ScoreText');
        return DemoBox(
          name: 'ScoreText',
          builds: builds,
          child: Text(
            'Score: ${model.score}',
            style: Theme.of(context).textTheme.headlineMedium,
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
    // watch subscribes this widget, so Controls rebuilds on every change,
    // even though it never displays the score. Fixed in 04.
    final model = context.watch<ScoreModel>();
    final builds = countBuild('Controls');
    return DemoBox(
      name: 'Controls',
      builds: builds,
      child: ElevatedButton(
        onPressed: model.increment,
        child: const Text('+'),
      ),
    );
  }
}
