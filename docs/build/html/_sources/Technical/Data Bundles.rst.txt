Data Bundles
================

Data bundles are an end-to-end encrypted solution for keeping information about a user in sync between different datastores.

Lifecycle
~~~~~~~~~~

The lifecycle of a data bundle begins with a `Trust Provider <http://www.python.org/>`_ which is the creator and owner of a data bundle. A data bundle can be instatiated during one of the two events:

1. A trust provider would like to publish a bundle of data
2. A service requesting a data bundle

Scenario 1
##########

A trust provider MUST first ask CitizenOne for the public keys belonging to all of the subscribers of the specific bundleType and identityId. The request to ``/id1/api/v1/identities/{identityId}/policies/callbacks/{dataBundleType}/publicKeys`` will return:

.. code-block:: JSON

  {
    publicKeys: [
      { 
        policyId: 'A guid to identify this subscriber',
        publicKey: 'The subscriber's publicKey PEM'
      }
    ]
  }

The trust provider will loop over the publicKeys array and encrypt the data bundle for each one.

The trust provider will then publish the data bundle by making a `POST` request to ``/id1/api/v1/identities/{identityId}/dataBundle/{dataBundle}``. This request specifies `Who` (identityId) the data is about, and `What` (dataBundle) the data is.
The request body MUST be:

.. code-block:: JSON

  {
    bundles: [
      {
        policyId: 'The guid of matching the publicKey this bundle was encrypted for',
        encryptedBundle: 'Base64 standard encoded encrypted json representation of the dataBundle'
      }
    ]
  }

Identity-server will iterate over each bundle object and push it on to a RabbitMQ queue. A simple microservice (publish-service) will pop any pending messages from the outgoing message queue, check for consent, and find the destination `url` specified by the subscriber. Finally, publish-service will send the encrypted bundle to the specified url.

The subscriber will then decrypt the data bundle using its RSA private key and unmarshal the json string into an object for use.


Scenario 2
###########

To be built