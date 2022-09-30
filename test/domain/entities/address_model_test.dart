import 'package:flutter_test/flutter_test.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';

void main() {
  group('Testing address model: ', () {
    late AddressEntity addressEntity;
    setUp(() {
      addressEntity = AddressEntity(
        id: 1,
        city: 'city test',
        lat: '123123123',
        long: '-1231231',
        state: 'state test',
        zipCode: '11111-111',
        streetAddress: 'rua test ',
        streetAddressNumber: '123',
      );
    });

    test('Should return a address model', () {
      expect(addressEntity, isNotNull);
    });
    test('Should return the correct id', () {
      expect(addressEntity.id, 1);
    });
  });
}
