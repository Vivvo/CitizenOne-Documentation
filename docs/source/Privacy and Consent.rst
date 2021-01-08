Privacy and Consent Management
==============================

Provides users with privacy and consent management tools; and connects the citizen to any set of digital services presenting policy to the citizen that they must agree to access the service. CitizenOne was developed with user privacy at the forefront of the design ensuring the citizen is always in control of their confidential information.

This module provides ongoing transparency to the citizen, informing them what services they have connected to their profile, and providing the ability to manage the connection at their discretion. For instance, it presents policy updates and allows for revocation of consent if the user chooses to unlink themselves from the service.

In the CitizenOne management console, a service provider or SP (a connected application that uses a federated identity from CitizenOne, and accesses the CitizenOne API for profile access) defines their service by creating the following artifacts in the console.

*  A privacy policy that explains how the citizens information is used in the service providers application.
*  Application access that allows the service provider to manage the API security
*  Rules and assurance required to engage this service application
*  A service card representation of the application that pulls together all the artifacts in a presentation that the citizen can add to their dashboard.

When a citizen adds the service card from the catalog, it creates a managed instance of this service interaction where the following items are tracked and presented to the citizen.

*  The current consent state.  That they have been enrolled or not.
*  Notifications sent from the service application
*  Invoices that have been issued from the service
*  Context relevant links in the application (e.g. Apply now or Renew your application)
*  Contact information for the connected application
*  An option to opt out or "Unlink" the service.

During enrollment after adding the service card, the user is challenged to provide any further information to use the service.  For example, if the rules where:

* Must be 19
* Must be a verified user
* Must have a primary address

A workflow is provided so the user can comply with the service application rules to use this service.  After conforming to all site rules, the user can select how they wish to be communicated to (SMS, email or none). finally on the last step there is an opportunity to review all the information that you are consenting to share, and a button to express your consent.

If the service application provides a consent endpoint, CitizenOne will call out and send the users identifier, and notice of consent.  The service application now has access to the users profile.  At anytime the user can elect to negate consent by clicking "Unlink Service", this action calls out to the service applications endpoint and sends the users identifier, and notice of revoking consent.



