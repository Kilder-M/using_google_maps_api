const createAddressTable = '''
  CREATE TABLE address(
   id INTEGER NOT NULL PRIMARY KEY
  ,city CHAR(50) 
  ,state VARCHAR(100) 
  ,zip_code CHAR(3) 
  ,street_address VARCHAR(500) 
  ,street_address_number CHAR(8) 
  ,long CHAR(15)
  ,lat CHAR(15)
  )
 ''';
