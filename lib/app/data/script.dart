const createAddressTable = '''
  CREATE TABLE address(
   id INTEGER NOT NULL PRIMARY KEY
  ,address VARCHAR[1000]
  )
 ''';

const createAddress = '''
INSERT INTO address(address)
VALUES('Rua test 1 - bairro - brasil')
''';
