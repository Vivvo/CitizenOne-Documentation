Saml Attribute Mapping
======================

SAML contains attributes in the SamlAttributeStatement structure that we map to our Identity.  The attributes are as seen here:

.. include:: files/xml/saml.xml


However SAML allows attributes to have either a FriendlyName or Name associated with each Attribute.  
These atrributes can have value can be of an arbritrary type which makes adding new SAML connections troublesome because 
code must change in order to accomodate any SAML fields not accounted for.


In order to solve this problem we have decided to do the following:

1. Add an saml_to_attribute_map table. The schema is defined as: 

.. include:: files/sql/saml_assertion_name_id.sql

2. Read through every SAML attribute in this table and determine if it exists in the SAML.

3. If the SAML attribute exists and the contents of the identity attribute are not existent we use the value provided in this attribute

Adding new attributes
=====================

Adding new attributes are as simple as:

1. Adding a row to *saml_assertion_name_id*
2. Restarting the *SP*



