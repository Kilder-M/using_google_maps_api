class AddressEntity {
  int? id;
  String? city, state, zipCode, streetAddress, streetAddressNumber, long, lat;

  AddressEntity({
    this.id,
    this.city,
    this.state,
    this.zipCode,
    this.streetAddress,
    this.streetAddressNumber,
    this.lat,
    this.long,
  });

  factory AddressEntity.fromMap(Map<String, dynamic> sql) => AddressEntity(
        id: sql['id'],
        city: sql["city"],
        state: sql["state"],
        zipCode: sql["zip_code"],
        streetAddress: sql["street_address"],
        streetAddressNumber: sql["street_address_number"],
        long: sql["long"],
        lat: sql["lat"],
      );
}
