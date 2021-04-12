import 'package:jiosaavn_api/jiosaavn_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    late JioSaavn awesome;

    setUp(() {
      awesome = JioSaavn();
    });

    test('First Test', () {
      expect(awesome.isAwesome, isTrue);
    });
  });
}
