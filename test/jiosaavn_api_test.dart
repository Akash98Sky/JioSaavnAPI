import 'package:jiosaavn_api/jiosaavn_api.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    late JioSaavn awesome;

    setUp(() {
      awesome = JioSaavn();
    });

    test('Song search by id', () async {
      expect((await awesome.getSongs(['iU7UPQsU', 'f6_mfbG0'])).length, 2);
    });
  });
}
