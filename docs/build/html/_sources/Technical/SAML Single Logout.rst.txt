SAML Single Logout (SLO)
========================

SLO allows your users to sign out of all the applications they signed in to as well as CitizenOne™ at the same time. This is great from a security perspective, but it can be confusing from the user's perspective and is fragile since it is entirely browser based and it is possible for the user to get stuck on an application that doesn't handle the SLO request properly.

SLO can be initiated by the IdP or one of the SPs. The resulting requests to CitizenOne™ and the overall flow change slightly depending which one you use.

IdP Initiated
*************

You can trigger an IdP initiated logout by redirecting the user's browser to: **https://{{CITIZEN_ONE_DOMAIN}}/fed/saml2/logout**. You should **not** log the user out of your SP application prior to making this request. This is the flow that gets triggered if the user clicks the logout button in CitizenOne™.

An IdP Initiated request will tell all SPs with active sessions to logout by redirecting the user's browser to their SingleLogoutService endpoint with a SAML LogoutRequest and waiting for a SAML LogoutResponse at its SingleLogoutService endpoint. Each SP will be logged out before login the user out of CitizenOne™ and redirecting to the login page.

.. image:: ../images/idp-initiated-single-logout.png
   :width: 500pt
   :align: left

SP Initiated
************

Your SP can initiate the SLO flow by making a SAML LogoutRequest to CitizenOne™'s SingleLogoutService endpoint: **https://{{CITIZEN_ONE_DOMAIN}}/fed/saml2/idpSingleLogout**. You should **not** log the user out of your SP application prior to making this request.

An SP Initiated request will tell all SPs with active sessions other than the one that initiated the request to logout by redirecting the user's browser to their SingleLogoutService endpoint with a SAML LogoutRequest and waiting for a SAML LogoutResponse at its SingleLogoutService endpoint. Once every other SP application is logged out, the IdP will send a SAML LogoutResponse to the SP that initiated the logout flow. At this point it is up to the SP application to decide if it should redirect to a landing page of their own or to the CitizenOne™ login page.

.. image:: ../images/sp-initiated-single-logout.png
   :width: 500pt
   :align: left

Reference
*********

SAML Single Logout
    See section 3.7 of the `SAML Core 2.0 Oasis Standard <https://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf>`_.

LogoutRequest
    See section 3.7.1 of the `SAML Core 2.0 Oasis Standard <https://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf>`_

LogoutResponse
    See section 3.7.2 of the `SAML Core 2.0 Oasis Standard <https://docs.oasis-open.org/security/saml/v2.0/saml-core-2.0-os.pdf>`_