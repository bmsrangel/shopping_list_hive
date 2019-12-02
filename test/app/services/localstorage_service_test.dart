import 'package:flutter_test/flutter_test.dart';
import 'package:shopping_list/app/shared/services/localstorage_service.dart';

void main() {
  LocalstorageService service;

  setUp(() {
    service = LocalstorageService();
  });

  group('LocalstorageService Test', () {
    test("First Test", () {
      expect(service, isInstanceOf<LocalstorageService>());
    });
  });
}
