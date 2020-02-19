.. code-block:: SQL


  saml_assertion_name_id int(11) not null AUTO_INCREMENT,
      attribute varchar(255) not null,
      attribute_name varchar(255) not null,
      identity_dto_attribute varchar(255) not null,
      PRIMARY KEY (saml_assertion_name_id)
