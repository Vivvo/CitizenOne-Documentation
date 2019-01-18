Trust Providers
==============================

The TrustProvider will handle basic parameter validation (required, type), call out to your business logic
functions (e.g.: Onboarding.OnboardingFunc, Rule.RuleFunc) and handle all the response bodies and status
codes based on what your business logic functions return. This is the quickest and easiest way to implement
the consistent API that the Citizen One platform expects to integrate with when talking to a Trust Provider.

The port that the http server runs on can be configured by setting an environment variable: TRUST_PROVIDER_PORT.
If this variable is not set, we will default to port 3000.

Initialize the Trust Adapter:
    ``func (t *TrustProvider) initAdapterDid() (error)``
The purpose of this method is to make sure the adapters is initalized by making sure the adapter did is published on ``Eeze.io`` and the adapter has its public and private key stored in the ``go-wallet``. 

New Trust Provider:
    ``func New(onboarding Onboarding, rules []Rule, subscribedObjects []SubscribedObject, data []Data, account Account, resolver did.ResolverInterface) TrustProvider`` 
This method will handle creating a new TrustProvider. Based on the onboarding, rules and account objects you pass in this will bootstrap an http server with onboarding and rules endpoints exposed.
    
The onboarding endpoint will be:
    /api/register
The rules endpoints will follow this pattern:
    /api/{Rule.Name}/{token}

Onboarding:
    ``func (t *TrustProvider) register(w http.ResponseWriter, r *http.Request)``
The method above handles the onbaording. You can have two cases when onboarding.
    1. The body you send in is a ``Ratchet Encrypted Payload`` which contains the Verifiable Credential
    2. The body you send in contains non-encrypted onboarding parameters 

We do a simple a check to see if the body is a ``Ratchet Encrypted Payload``(REP) or not. If it's a REP, we must then first decrypt it. 
    Decrpyting:
        1. Create a ``Pariwise DID`` with the sender (e.g. Phone)
        2. Then using the ``go-wallet``, call the ``InitDoubleRatchetWithWellKnownPublicKey`` which does extactly what the method is named.
        3. Call the ``RatchetDecrypt`` method in the go wallet. This will result in a decrypted payload 

Taking this payload, we can now parse the Verfiable Credential(VC) calling the ``func (t *TrustProvider) parseVerifiableCredential(body interface{}, logger *zap.SugaredLogger) (*did.VerifiableClaim, []string)``. This method parses and verifies the VC along with storing any other neccessary informations in the claim( e.g. senders DID Document).


The body sent in is parsed into ``string`` ``int`` ``bool``, and in some instances ``interface{}`` via the parseParameter
