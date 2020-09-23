.. _trust-providers:
Trust Providers
################

Trust Providers are authoritative sources that can respond to requests to pass onboarding rules as well as provide :ref:`Data Bundles <data-bundles>`.
The list of all available Trust Providers can be accessed by clicking [**Trust Providers**] under the [**Tenants**] tab of the sidebar.

.. _view-trust-providers:
Viewing All Trust Providers
****************************

The initial Trust Providers page displays a list of all of the Trust Providers that have been created for your instance of the Vivvo Trust Platform.

From this page, you are able to filter the displayed list of Trust Providers by their name, click on a Trust Provider in the list for a more detailed view, or create a new Trust Provider.

.. note::
    Users that have only the “READ Trust Providers” role will not be able to create new Trust Providers or modify existing Trust Providers.
 
.. image:: /images/managementapp/view-trust-providers.png
   :width: 300pt
   :alt: View All Trust providers
   :align: center

.. _create-trust-provider:
Creating Trust Providers
*************************

When you’ve determined that a new Trust Provider is needed, you can click the [**+ Create**] button in the top right of the Trust Providers listing page.

.. image:: /images/managementapp/create-trust-provider.png
  :width: 300pt
  :alt: Create Trust Provider
  :align: center

This will bring you to a new view where you will be asked to fill out only the vital information needed to create the Trust Provider. Any fields not seen here will be configurable after the Trust Provider has successfully been created.

.. _Guidelines on Identity Assurance: https://www.tbs-sct.gc.ca/pol/doc-eng.aspx?id=30678&section=html

The general fields for a Trust Provider are:

1.	**Name**: The name of the trust provider
2.	**Description**: The optional description of the trust provider
3.	**Level of Assurance**: The level of assurance this trust provider provides. See the `Guidelines on Identity Assurance`_ webpage for more information.
 
.. image:: /images/managementapp/create-tp-fields.png
  :width: 300pt
  :alt: Create Trust Provider general fields
  :align: center

Clicking the [**Cancel**] button will not save any changes you made to the form, and you will be taken back to the Trust Provider listing page.

Clicking the [**Create**] button will then attempt to make a new Trust Provider, and you will be taken to the new Trust Provider’s details page.

.. _edit-trust-provider:
Viewing and Editing a Trust Provider
**************************************

When you click on or create a Trust Provider, you will be taken to a view with multiple tabs. Each tab contains information that you can fill out to help define and customize your Trust Provider.

.. image:: /images/managementapp/edit-trust-provider.png
    :width: 300pt
    :alt: Edit trust provider
    :align: center 

Clicking on these tabs changes the view so if you are editing any forms on a page, ensure that you save any changes, or they will be lost on navigation.

.. _trust-provider-general-tab:
Trust Providers General Tab
============================

The General tab of a Trust Provider contains the basic details that define the Trust Provider itself.

.. image:: /images/managementapp/trust-provider-general-tab.png
   :width: 300pt
   :alt: Trust provider general tab
   :align: center

Clicking the [**Edit**] button will enable the fields in the view for change. Ensure your changes are saved before navigating away from the page.

.. _trust-provider-onboarding-tab:
Trust Providers Onboarding Tab
===============================

The Onboarding tab of a Trust Provider specifies how the Vivvo Trust Platform connects to a Trust Provider to onboard a citizen.

.. image:: /images/managementapp/trust-provider-onboarding.png
   :width: 300pt
   :alt: Trust provider onboarding tab
   :align: center

The onboarding fields for a Trust Provider are:

1.	**Base Url**: The base url for onboarding to the Trust Provider
2.	**Onboarding Path**: The api path for sending the onboarding data from the form
3.	**Onboarding Form**: The NoCode form for onboarding
4.	**Arguments** (e.g., Argument 1, Argument 2) - Arguments to send to the onboarding form

To add more arguments you can click the [**+ Add Argument**] button below the last argument.

.. image:: /images/managementapp/trust-provider-add-argument.png
   :width: 300pt
   :alt: Add arguments to trust provider onboarding
   :align: center

Clicking the [**Edit**] button will enable the fields in the view for change. Ensure your changes are saved before navigating away from the page.

.. _trust-provider-rules-tab:
Trust Providers Rules Tab
==========================

The Rules tab of a Trust Provider specifies the Rules that this Trust Provider can fulfill.

.. image:: /images/managementapp/trust-provider-rules.png
   :width: 300pt
   :alt: Trust provider rules tab
   :align: center

You can assign Rules to a Trust Provider by selecting a Rule from the dropdown and entering a description.

To add more Rules, you can click the [**+ Add Rule**] button below the last rule.

.. image:: /images/managementapp/trust-provider-add-rule.png
   :width: 300pt
   :alt: Add rule to trust provider
   :align: center

Clicking the [**Edit**] button will enable the fields in the view for change. Ensure your changes are saved before navigating away from the page.

.. _trust-provider-bundles-tab:
Trust Providers Providing Bundles Tab
=======================================

The Providing Bundles tab of a Trust Provider specifies the Data Bundles that this Trust Provider can publish to subscribing services.

.. image:: /images/managementapp/trust-provider-bundles.png
   :width: 300pt
   :alt: Trust provider providing bundles tab
   :align: center

.. note::
1.	If you would like to publish changes about your users, such as when their address or email changes, add those here.
2.	Data Bundles are encrypted if public key is provided on the policy.

The data bundle fields for a Trust Provider are:

1.	**Data Bundle Type**: The type of updates to push to clients. Subscribing services will reference this type.
2.	**Notify Url**: The url (must be https) to push data bundles to.

.. image:: /images/managementapp/data-bundle-fields-tp.png
   :width: 300pt
   :alt: Trust provider data bundle fields
   :align: center

.. note::
1.	Clicking the [**Eye**] button will present you with the schema of the data bundle or allow you to define it if it hasn’t been defined yet.
2.	The notifiy url must be of type HTTPS.
3.	Currently you can only add one bundle for a particular type.

.. image:: /images/managementapp/add-data-bundle-tp.png
   :width: 300pt
   :alt: Add data bundle to trust provider
   :align: center

Clicking the [**Edit**] button will enable the fields in the view for change. Ensure your changes are saved before navigating away from the page.

.. _remove-trust-provider:
Removing a Trust Provider
****************************

When you are on the **General** tab, click the [**Edit**] button.

.. image:: /images/managementapp/remove-trust-provider.png
  :width: 400pt
  :alt: Remove trust provider
  :align: center

Clicking the [**Delete Provider**] button will remove the Trust Provider from Vivvo Trust Platform. When deleting a Trust Provider you must accept a confirmation asking whether you want to delete the Trust Provider.
