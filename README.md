# score_demo: live demo for "State Without the Headache"

Four branches, one per checkpoint on slide 26. Every widget sits in a box that
shows **how many times its build has run**, so the audience can see rebuilds.

| Branch | Slide checkpoint | What to point at |
|---|---|---|
| `01-setstate` | Start local | Tap +. ScorePage, ScoreText **and** Controls all rebuild. Score is passed down, the change comes back up via a callback. |
| `02-model` | Create owner | `score_model.dart`. ScorePage's count stays at 1: only the ListenableBuilder's children rebuild. ScorePage still has to create **and dispose** the model. |
| `03-provider` | Expose feature | `main.dart`: `ChangeNotifierProvider(create: ...)`. ScoreFeature is now stateless and stays at 1. ScoreText uses Consumer. Controls still uses `context.watch`, so its count climbs for no reason. |
| `04-selector` | Observe | History added. Tap + a few times, then **Clear history**: HistoryList rebuilds, ScoreText doesn't. Controls stays at 1 because it uses `context.read`. |

## One-time setup (do this before the day)

```bash
cd score_demo
flutter create --project-name score_demo .   # generates android/ ios/ etc.
flutter pub get
flutter test                                 # model + widget tests
```

The platform folders are git-ignored, so they stay put when you switch branches.
`provider` is in `pubspec.yaml` on every branch, so no `pub get` is needed on stage.

## On stage

1. `git checkout 01-setstate`, then `flutter run` on the emulator.
2. For each next step: `git checkout 0N-...` in the terminal, then **hot restart**
   (`R` in the terminal, or the restart button in VS Code). Hot restart also
   resets the build counters. Hot *reload* will not reset them.
3. Have the files open in VS Code; checkout updates them in place.

If anything breaks, go to the backup slides (31 to 34) rather than debugging live.
