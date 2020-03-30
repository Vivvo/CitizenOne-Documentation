Platform Configuration
======================

Identity Providers
******************

Identity Providers are external applications or systems that are able to provide the
necessary details needed in order to sign users into CitizenOne, connecting the two
accounts.

For example, you'd be able to sign into the Federal version of CitizenOne with any
Provincal version's portal, so long as the integration is set up on both sides.

When logged into management, you can click "Configuration" to drop down a list,
where you will be able to find the link to the "Identity Providers" tab.

.. image:: ../images/PlatformConfiguration/identity-providers-list.png
   :width: 500pt
   :align: center

As you can see above, clicking into the tab displays a list of the currently setup
Identity Provider integrations. The one we will be aiming to replicate is `C1_PROV`.

Clicking "+ Add Identity Provider" will bring you to the setup screen for new
integrations.

All Identity Providers share some of the fields, these fields are:

- **Enabled**: Enables and disabled the Identity Provider. Disabling this here, will not remove the link on the login screen, however only enabled Identity Providers can be used to create links on the login page.
- **Provider Name**: The desired name of the Identity Provider you are setting up. This name is used in the launch URL, which we will be configuring later.
- **Provider Strategy**: There are varying methods of integrating with Identity Providers, but currently we only support dynamic SAML integrations, which is the `C1` strategy.

.. note::
    If you forget what any of the fields are for, you can hover over the small `(i)` next to the field labels to get a short description of each.

Setting up an Identity Provider OpenID Connect (oidc)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
OpenID Connect allows a range of clients, including Web-based, mobile, and JavaScript clients, to request and receive information about authenticated sessions and end-users.

.. image:: ../images/PlatformConfiguration/new-oidc-idp.png
   :width: 500pt
   :align: center

- **OAuth2 Strategy**: The desired OAuth provider.
- **Issuer**: The 'issuer' identifier of the Identity Provider.
- **Client ID**: The public Client ID or Application Key of the Provider application.
- **Client Secret**: The private Client Secret or API Key of the Provider application.
- **Scope**: The scopes that CitizenOne™ should request - this will impact what data gets populated in the user’s CitizenOne™ profile after successfully authenticating.
- **Authorization URL**: The User Agent is sent to the Authorization URL for Authentication and Authorization.
- **Token URL**: To obtain an Access Token, an ID Token, and optionally a Refresh Token, Client sends a Token Request to the Token URL to obtain a Token Response.
- **User Info URL**: The UserInfo URL is an OAuth 2.0 Protected Resource that returns Claims about the authenticated User.

Once all of the fields are filled out and valid, click "Save".

Social Login
&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

Many modern Identity Providers have implemented their own proprietary OAuth2.0 based protocol with varying levels of similarity to OpenID Connect. Those that fully support OpenID Connect don't need any special handling in CitizenOne™ and you can select *OpenID Connect* as the OAuth2 Strategy when setting it up. Google is an example of a social login provider that fully supports OIDC.

As of right now, GitHub is the only proprietary social login provider that we support but we are working on supporting other social login providers. There is no extra information required to use GitHub, simply fill out the form and select *GitHub* as your OAuth2 Strategy.

.. image:: ../images/provider-strategy.png
   :width: 500pt
   :align: center

Setting up an Identity Provider with SAML (saml)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Security Assertion Markup Language (SAML) is an open standard that allows Identity Providers to pass authorization credentials to Service Providers.
SAML transactions use Extensible Markup Language (XML) for standardized communications between the identity provider and service providers. SAML is the link between the authentication of a user’s identity and the authorization to use a service.
SAML enables Single-Sign On (SSO), a term that means users can log in once, and those same credentials can be reused to log into other service providers.

.. image:: ../images/PlatformConfiguration/new-saml-idp.png
   :width: 500pt
   :align: center

- **Metadata URL**: (NYI) A URL to call out to to retrieve the Identity Provider's SAML metdata.
- **SAML Metadata**: The SAML metadata, with a valid EntityID, supplied by the Identity Provider.

Once all of the fields are filled out and valid, click "Save".

Setting up a Passwordless Identity Provider (did-auth)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
A Decentralized Identifier (DID) is a new type of identifier that is globally unique, resolveable with high 
availability, and cryptographically verifiable. DIDs are typically associated with cryptographic material, such as public keys, and service endpoints, for establishing secure communication channels.

.. image:: ../images/PlatformConfiguration/new-did-auth-idp.png
   :width: 500pt
   :align: center

- **Client ID**: The public Client ID or Application Key of the Provider application.
- **Client Secret**: The private Client Secret or API Key of the Provider application.
- **Base URL**: The host URL of the Identity Provider to verify the DID with.

Setting up another CitizenOne instance as an Identity Provider (c1 - Deprecated)
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. warning::
    This method of configuring CitizenOne as an Identity Provider is deprecated, and only remains to keep backwards compatability.

In order to connect two platforms to allow for Federation, both sides require the
other side's SAML metadata in order to authenticate with one another.

In this walkthrough, we will configure CitizenOne Federal such that it is able to
federate using another platform, CitizenOne Provincial.

As the Service Provider, CitizenOne Federal
-------------------------------------------

.. image:: ../images/PlatformConfiguration/new-c1-idp.png
   :width: 500pt
   :align: center

- **Client ID**: The public Client ID or Application Key of the Provider application.
- **Client Secret**: The private Client Secret or API Key of the Provider application.
- **"Me" Endpoint**: This is the endpoint with which the Service Provider, Federal, can call to retrieve the user's details from the Identity Provider, Provincial.
- **Cookie Domain**: The Service Provider's cookie domain.
- **Metadata URL**: (NYI) A URL to call out to to retrieve the Identity Provider's SAML metdata.
- **SAML Metadata**: The SAML metadata, with a valid EntityID, supplied by the Identity Provider, Provincial. Filling out this field will automaticlaly populate the `EntityID` field.

Once all of the fields are filled out and valid, click "Save".

As the Identity Provider, CitizenOne Provincial
-----------------------------------------------

When logged into management, click "Tenants" to drop down a list,
where you will be able to find the link to the "Applications" tab.

For more information on this screen, please see :ref:`application_management`

Following the steps outlined in :ref:`creating_applications`, you should
set up an application that represents the downstream service provider,
which is CitizenOne Federal. Select "CitizenOne" as the organization,
and **make sure you copy the Client Secret!**

One the application has been created, navigate to that applications
"Provider Configuration" tab, as shown below.

.. image:: ../images/PlatformConfiguration/service-provider-configuration.png
   :width: 500pt
   :align: center

Click "Edit", and paste the SAML metadata provided by the Service Provider, CitizenOne Federal,
into the box. The SAML metadata must have a valid `EntityID`, or it will not be accepted.

.. image:: ../images/PlatformConfiguration/service-provider-configuration-edit.png
   :width: 500pt
   :align: center

.. _identity_provider_login_screen:

Identity Providers on the Login Screen
**************************************

To set up the link to an Identity Provider on the login screen, drop down "Configuration" in the sidebar again,
but click into "Login Layout". For a full overview on this screen, please see :ref:`layout_management`.
In this tutorial, the assumption will be made that you have familiarized yourself with the Layout

.. image:: ../images/PlatformConfiguration/login-layout.png
   :width: 500pt
   :align: center

If you have the correct permissions, click into the dropdown box at the top
of the display, select "Identity Providers" and click "+ Add Widget" to add the
"Identity Providers" widget to the layout.

.. image:: ../images/PlatformConfiguration/new-idp-widget.png
   :width: 500pt
   :align: center

The widget will be selected by default, so feel free to resize it to your desired look.
Click "+ Identity Provider" to add an Identity Provider card to the widget.

.. image:: ../images/PlatformConfiguration/new-idp-card.png
   :width: 500pt
   :align: center

A preview of the card is available in the display.

- **Provider Width**: **Applies to ALL Identity Provider Cards** the width of each Provider card within the Identity Providers widget.
- **Identity Provider**: The desired Identity Provider you wish to link to with this card. Only `enabled` Identity Providers can be used.
- **Icon URL**: A link to the image to be displayed at the top of the card.
- **Colour**: The accent color of the Identity Provider card.

When the fields are filled in, you will be able to see a preview of the Provider's card.

`Here is an example where the Login widget has a width of 4, the Identity Providers widget has a width of 8, and the Provider Width is set to 6 (half):`

.. image:: ../images/PlatformConfiguration/idp-card-preview.png
   :width: 500pt
   :align: center

Review your changes, and then hit save at the bottom of the page in order to set the layout.
Navigate to the login page of the service to see the changes.

External APIs
*************

To set up and manage APIs that Applications may communicate with, navigate to the "External APIs" tab.

.. image:: ../images/PlatformConfiguration/api-nav.png
   :width: 100pt
   :align: center

You'll be greeted with a list of configured APIs.

.. image:: ../images/PlatformConfiguration/api-list.png
   :width: 500pt
   :align: center

To add a new API to the platform, click the "+ Add API" button in the top right.
You'll be taken to the configuration screen, where you can fill out the required fields
with data pertaining to your API.

.. image:: ../images/PlatformConfiguration/api-new.png
   :width: 500pt
   :align: center

Once successfully created, you'll be automatically navigated to the view page of the created API.

.. image:: ../images/PlatformConfiguration/api-view.png
   :width: 500pt
   :align: center

Notice, there are currently no Applications that are authorized to connect with this API.
To add Applications, click the "Edit" button in the top right - if you have the required persmission -
to enter editing mode, where you may select which Applications to allow from the list on the right.

.. image:: ../images/PlatformConfiguration/api-edit.png
   :width: 500pt
   :align: center

Once you are satisfied with your changes, hit save and your API will be updated.

.. image:: ../images/PlatformConfiguration/api-view-with-apps.png
   :width: 500pt
   :align: center