.. _policy-hierarchy:

Policy Hierarchy
=======================

Policies Hierarchy refers to the new way in which we handle providing consent and rules evaluation at every level of a service hierarchy by attaching consent scopes, rules, and callbacks to a specific policy and version.

How Consent Used to Work
*********************

Prior to these changes consent scopes, rule evaluation and callbacks were each attached to specific applications. As a consequence of this design:

- Multiple service cards attached to the same application could not have different required consent scopes, and consenting to one resulted in consenting to them all.
- Consent could not be handled at levels higher than the application. For example, Kingston requested that consent be handled on account registration rather than for each application.

How Consent Works in the Policy Hierarchy
*********************

Consent scopes, rules and callbacks are attached to a specific policy and version. Then the policy can be attached to a tenant, an organization, an application or a service card. This allows a much more flexible approach to consent and rule evaluation than before.

Versioning
~~~~~~
By attaching consent to policy and version this means that if the particular consent scopes required for a policy change, a new policy version will be created and users will be asked to consent to the new policy version, including the new consent scopes. Further users who have not consented to the new policy version yet will not have automatically count as having consented to the new consent scopes. This means that third parties will only ever have access to what a user has explicitly consented to even if changes have been made after consent.

Hierarchy Crawling
~~~~~~
Since multiple levels of entities can have policies, when a user is adding a service card we are concerned with more than just a particular service cards consent scopes and rules. Instead the logic will crawl the service card hierarchy to find all relevant policies. First it retrieves the policy for the service card, then it's application(s), then the organization it belongs to. It will retrieve all relevant consent scopes and rules for each policy returned in the hierarchy and ask the user to consent to each policy and the amalgamation of the consent scopes. 

Tenant Level Policy
~~~~~~
We can now attach policies directly to a tenant. This allows us to have a policy in place that users need to consent to when creating an account. This further enables us to have a list of service cards with no other policies in their hierarchy that are auto-consented when the account is created and immediately displayed on the users dashboard without any further input required from the user.

Service Card to Application Relationship
*********************
Another feature that was changed during the policy hierarchy implementation was the relationship between service cards and applications. In the past each application could have multiple service cards but a service card could only belong to one specific application. This proved problematic when trying to deal with service card tasks that were logically grouped together but used different applications. To fix this the relationship was changed to allow service cards to belong to multiple applications while maintaining that each application can have multiple service cards. 