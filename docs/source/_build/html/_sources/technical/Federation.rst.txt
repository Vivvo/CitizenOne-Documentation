Federation
==========

Glossary
********
Identity Provider (IdP)
    A service offering credentials to a service provider (SP).  There is an agreement between the IDP and SP to trust authenticated credentials.
Service Provider (SP)
    A service that uses another trusted services credentials.
OAuth2
    An open standard for access delegation, commonly used as a way for Internet users to grant websites or applications access to their information on other websites but without giving them the passwords.
SAML 2.0
    An XML-based protocol. SAML 2.0 is an OASIS Standard which specifies a protocol for enabling cross-domain single sign-on (SSO). SAML 2.0 uses security tokens containing assertions to pass information about an end user between an identity provider, and a service provider.
Service
    A UX/application component that controls consent, privacy and building the federation event.

CitizenOne can perform the role of identity provider and identity consumer using both protocols Oauth2 and SAML 2.0.

Identity Provider
*****************
As a modern credential provider, CitizenOne provides all the UI interfaces for profile registration, login and recovery methods.  On top of this credential repository is a full IDP service, so the credential can be shared with authorized services.


The CitizenOne IDP ( Identity Provider) service allows for modern protocols both SAML v2 and Oauth2 supporting OpenIDConnect.  Connections to and from CitizenOne are independently established.  For example, the user may authenticate to CitizenOne with a SAMLv2 based bank credential, and then be federated to a service providers service using CitizenOnes Oauth2 service.


CitizenOne keeps track of all the connected services and federated connections, so the user may transverse across services without having to re-authenticate.

.. image:: images/idpsp.png
   :width: 400pt

The protocol chosen is a decision the provider or service provider.  This is usually influenced by the technology they generally use.  Supporting both federation protocols allows the flexibility of the organizations to pick which fits their organization best.

Service Provider
****************
The CitizenOne SP interface allows consumption of credentials from other credential providers (e.g.  Banks, Social, ADFS ).  The user authentication interface in CitizenOne can be set to use a credential provider, be the credential provider or function is a hybrid mode where the user can choose witch credential they are familiar with.

Service Card
************

A unique feature of CitizenOne is the ability to build a federated credential only when certain criteria is met.  For example:  If the service behind the service card has the following requirements that must be met before the service can be used:

* Must be a verified user
* Must be 19 years of age
* Must have accepted the current privacy policy
* Must have accepted consent

And only once all of these conditions are met, CitizenOne will build a federation response and direct the user to the service, otherwise the credential is not shared with the service.  This is done on a service by service basis.

This granular control, allows relying services (service providers) to have the confidence that only authorized users can arrive at their front door.