import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:using_google_maps_api/app/data/dao/address_dao_imp.dart';
import 'package:using_google_maps_api/app/domain/entities/address_entity.dart';

class MockAddressDAOIMP extends Mock implements AddressDAOImp {}

void main() {
  final addressDAOImp = MockAddressDAOIMP();
  group('Testing dao implements: ', () {
    test('Should return an address entity list', () async {
      final addressList = [AddressEntity(), AddressEntity(), AddressEntity()];
      when(() => addressDAOImp.getList()).thenAnswer((_) async => addressList);

      final response = await addressDAOImp.getList();

      expect(response, isA<List<AddressEntity>>());
    });

    test('Should return an address entity that contains the correct id',
        () async {
      final addressEntity = AddressEntity(
        id: 1,
        city: 'city test',
        lat: '123123123',
        long: '-1231231',
        state: 'state test',
        zipCode: '11111-111',
        streetAddress: 'rua test ',
        streetAddressNumber: '123',
      );
      when(() => addressDAOImp.getById(1))
          .thenAnswer((_) async => addressEntity);

      final response = await addressDAOImp.getById(1);

      expect(response.id, equals(1));
    });

    test('Should return an address entity that contains the correct id',
        () async {
      final addressEntity = AddressEntity(
        id: 1,
        city: 'city test',
        lat: '123123123',
        long: '-1231231',
        state: 'state test',
        zipCode: '11111-111',
        streetAddress: 'rua test ',
        streetAddressNumber: '123',
      );
      when(() => addressDAOImp.getById(1))
          .thenAnswer((_) async => addressEntity);

      final response = await addressDAOImp.getById(1);

      expect(response.id, equals(1));
    });
  });
}
