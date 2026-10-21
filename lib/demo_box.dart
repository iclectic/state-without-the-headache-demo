import 'package:flutter/material.dart';

/// Demo-only helper: counts how many times each widget's build has run,
/// so the audience can see which widgets rebuild. Not production code.
final Map<String, int> _buildCounts = {};

int countBuild(String name) =>
    _buildCounts[name] = (_buildCounts[name] ?? 0) + 1;

/// A labelled box that shows a widget's name and its build count.
class DemoBox extends StatelessWidget {
  const DemoBox({
    super.key,
    required this.name,
    required this.builds,
    required this.child,
  });

  final String name;
  final int builds;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: scheme.outlineVariant, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(name, style: theme.textTheme.labelLarge),
              const Spacer(),
              Text(
                'builds: $builds',
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: scheme.primary),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(child: child),
        ],
      ),
    );
  }
}
