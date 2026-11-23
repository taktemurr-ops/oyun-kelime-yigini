import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kelime_yigini/oyun_kelime_yigini.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(kelimeYiginiConfig.title.length, 33);
    expect(kelimeYiginiConfig.tagline.length, 33);
    for (final s in kelimeYiginiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(kelimeYiginiConfig.gameId, kelimeYiginiId);
    expect(kelimeYiginiRules.gameId, kelimeYiginiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(kelimeYiginiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: kelimeYiginiId, optionalMechanics: kelimeYiginiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      kelimeYiginiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(kelimeYiginiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
