.. _data-bundles:


Data Bundles
================

Data bundles are an end-to-end encrypted solution for keeping information about a user in sync between different datastores.

A Data Bundle is a block of data with a structure that is defined by
the consumers and providers of said data. The bundles are used to keep
downstream service providers up to date and aware of changes made to
an Identity's profile without the need for CitizenOne to oversee the
changes themselves.

The example we like to use revolves around an Identity's banking info.
If an Identity updates their bank data in App A, it can send a banking
data bundle to CitizenOne where the bundle is then sent to any applications
that the Identity has given consent to watch their banking data.

If App B has a policy that also wants baking data, and the Identity has
consented, the bundle will be encrypted using a public key attached to
the policy on App B, where the private key is also owned by App B.
When they receive it, they will then be able to decrypt the Bundle's `key`, and
`nonce` (a one time code created when encrypting the payload), which can then
be used to decrypt the payload.

This all happens without Identity needing to view the contents of the databundle.

Lifecycle
~~~~~~~~~~

The lifecycle of a data bundle begins with a `Trust Provider <http://www.python.org/>`_ which is the creator and owner of a data bundle. A data bundle can be instatiated during one of the two events:

1. A trust provider would like to publish a bundle of data
2. A service requesting a data bundle

.. _data-bundles-scenario-1:

Scenario 1
##########

A trust provider MUST first ask CitizenOne for the public keys belonging to all of the subscribers of the specific bundleType and identityId. The request to ``/id1/api/v1/identities/{identityId}/policies/callbacks/{dataBundleType}/publicKeys`` will return:

.. code-block:: JSON

  {
    "publicKeys": [
      { 
        "policyId": "A guid to identify this subscriber",
        "publicKey": "The subscriber's publicKey PEM"
      }
    ]
  }

The trust provider will loop over the publicKeys array and encrypt the data bundle for each one.

The trust provider will then publish the data bundle by making a `POST` request to ``/id1/api/v1/identities/{identityId}/dataBundle/{dataBundle}``. This request specifies `Who` (identityId) the data is about, and `What` (dataBundle) the data is.
The request body MUST be:

.. code-block:: JSON

  {
    "bundles": [
      {
        "policyId": "The guid of matching the publicKey this bundle was encrypted for",
        "encryptedBundle": "Base64 standard encoded encrypted json representation of the dataBundle"
      }
    ]
  }

Identity-server will iterate over each bundle object and push it on to a RabbitMQ queue. A simple microservice (publish-service) will pop any pending messages from the outgoing message queue, check for consent, and find the destination `url` specified by the subscriber. Finally, publish-service will send the encrypted bundle to the specified url.

The subscriber will then decrypt the data bundle using its RSA private key and unmarshal the json string into an object for use.

Bundle Encryption
~~~~~~~~~~~~~~~~~

Due to not always knowing the size of bundles, straight RSA encryption cannot be used.
So, instead, the payload itself is AES-256 encrypted with a randomly generated
key, and then - for each bundle - the `key` and a `nonce` that is created during the AES
encryption are both RSA encrypted using the consumer's public key. All of the encrypted
values are then Base64 encoded, and added to the message, then published or put back on
a queue.

Data Bundle providers must implement this however they wish on their end.


Data Sent from ID1
~~~~~~~~~~~~~~~~~~

Not all Data Bundles come from external applications, some come from the
Identity server. Thes bundles are treated slightly differently, so their
Callback type and PolicyId are checked to determine which bundles come from ID1, and which
come from external sources.

PolicyId is set to `nil` when the message from ID1 is ready to be sent out to
consumers, since it is not critical data.

.. code-block:: Go

    if (cb == string(models.CallbackTypeName) ||
        cb == string(models.CallbackTypeAddress) ||
        cb == string(models.CallbackTypeEmail) ||
        cb == string(models.CallbackTypePhone)) && msg.PolicyId == uuid.Nil {
        ...
    }

.. note:: The different types of ID1 callbacks and events are:

    - model.identity.update, model.email.update, model.phone.update, model.address.update
    - model.identity.create, model.email.create, model.phone.create, model.address.create
    - model.identity.delete, model.email.delete, model.phone.delete, model.address.delete

The main difference between data sent from ID1 versus data sent from a publisher is that
data from ID1 is not yet encrypted, and must be encrypted in the same fashion
that we require of the publishers. After it has been encrypted, the message is put
back onto the incoming queue, and will be read and published to the consumers in the same
way that outside messages are sent.

Receiving a Bundle
~~~~~~~~~~~~~~~~~~

In the interest of making decryption as easy as possible for consumers, a `DecryptPayload`
method has been made available through the Vivvo `go-sdk`. It would be possible to decrypt
in other languages, but as of now, our only officially supported language is Golang.

The consumer will simply receive a post request with a body of type `PublishWrapperDto` to the endpoint specified in the Policy,
and can then decrypt the payload into whatever structure they are expecting. An example of this
is shown below.

.. code-block:: Go

    var db models.PublishWrapperDto
    utils.ReadBody(&db, r) // Reads the body of the request into a PublishWrapperDto variable
    
    var address models.Address // The expected type of bundle
    err := trustprovider.DecryptPayload(db, privateKey, &address) // Pass in the full request body, with the private key and destination object
