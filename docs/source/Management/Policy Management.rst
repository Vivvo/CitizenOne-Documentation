Policy Management
=================

Introduction to the Policy Management tab.

Viewing Policies
****************

Creating Policies
*****************

Subscribing to Data Bundles
~~~~~~~~~~~~
:ref:`Data Bundles <data-bundles-scenario-1>` enable your services to recieve updates when your user's data changes in another place. They allow your services to stay in sync without maintaining backchannel communication.

Uploading a public key
~~~~~~~~~~~~
All data bundles are end-to-end encrypted so you can be confident the CitizenOne platform, or anyone else, can see information about your users. When you first create a policy you will have the option to upload an RSA public key. This is required to subscribe to data bundles. You can follow the commands given to assist you in generating an appropriate key.

.. image:: ../images/policy-public-key.png
   :width: 500pt
   :align: left

During policy revision creation you are able to choose from a list of provided data bundles you can subscribe to. When a data/trust provider publishes a data change, they will specify a type. You as a consumer will then receive the encrypted bundle at the url you specify.

.. image:: ../images/policy-revision-data-bundle.png
   :width: 500pt
   :align: left

Clicking the 'eye' icon next to the data bundle type will show you the `JSON Schema <https://json-schema.org/>`_ of that bundle type. All data bundles you receive will be in this format so you can predictably parse the data contained in the data bundle.

It is your responsibility as a data consumer to decrypt data bundles you receive using the private key pair to the public key you specified.