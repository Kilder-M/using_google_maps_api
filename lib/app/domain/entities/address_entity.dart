class AddressEntity {
  int? id;
  String? address;

  AddressEntity({
    this.id,
    this.address,
  });

  factory AddressEntity.fromMap(Map<String, dynamic> sql) =>
      AddressEntity(id: sql['id'], address: sql['address']);
}
