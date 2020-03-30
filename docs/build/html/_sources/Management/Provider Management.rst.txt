Trust Provider Management
===================

A trust provider faciltiates providing onboarding
rules and data intergrations for policies.

.. image:: ../images/tenants/providers/initial.png
   :width: 500pt
   :align: left                                                             

.. _creating_providers:

Creating Trust Providers
**********************************************************************

A trust provider can be created in Management by going to
Tenants -> Trust Providers -> Clicking the **[Create]** button

.. image:: ../images/tenants/providers/create.png
   :width: 500pt
   :align: left


The general fields for a Trust Provider are:

1. **Name**: The name of the trust provider
2. **Description**: The optional description of the trust provider
3. **Level of Assurance**: The level of assurance (https://en.wikipedia.org/wiki/Identity_assurance)

.. image:: ../images/tenants/providers/create-1.png
   :width: 500pt
   :align: left


Editing Trust Providers
******************************************************************************************************

Editing Trust Providers can be done in Management under:
*Tenants -> Trust Providers ->* Clicking the *Trust
Provider*

**Note:** You must click **[Edit]** in order to edit a
Trust Provider in each tab.

  .. image:: ../images/tenants/providers/create-1.png
     :width: 500pt
     :align: left
  ..


**General** - This tab is used for general information of Trust Providers

.. image:: ../images/tenants/providers/tab/general/default.png
   :width: 500pt
   :align: left
..



The general fields for a Trust Provider are:

1. **Name**: The name of the trust provider
2. **Description**: The optional description of the trust provider
3. **Level of Assurance**: The level of assurance (https://github.com/canada-ca/PCTF-CCP/blob/master/verified-person/verified-person.md)

.. image:: ../images/tenants/providers/tab/general/edit.png
   :width: 500pt
   :align: left
..


**Onboarding** - This tab is used for onboarding details of Trust Providers

.. image:: ../images/tenants/providers/tab/onboarding/default.png
   :width: 500pt
   :align: left
..

The onboarding fields for a Trust Provider are:

1. **Base Url**: The url for onboarding
2. **Onboarding Path**: The path for the onboarding url
3. **Onboarding Form**: The NoCode form for onboarding
4. **Arguments** (e.g., Argument 1, Argument 2) - Arguments to send to the onboarding form


**Note:** To add more arguments you can click the *[Add Argument]*
button below the last argument.

.. image:: ../images/tenants/providers/tab/onboarding/edit.png
   :width: 500pt
   :align: left
..



**Rules** - This tab is used for creating rules of Trust Providers

Rules are sets of requirements that users must meet in order to by
approved by the provider.

.. image:: ../images/tenants/providers/tab/rules/default.png
   :width: 500pt
   :align: left
..


**Providing (Data) Bundles** - This tab is used for creating data bundles for pushing
updates to clients

.. image:: ../images/tenants/providers/tab/bundles/default.png
      :width: 500pt
      :align: left
..

**Notes:** 

1. If you would like to publish to changes about your users, such as when their address or email changes, add those here.

2. Data Bundles are encrypted if public key is provided on the policy.

3. A more technical description can be found here: :ref:`data-bundles`.



The data bundle fields for a Trust Provider are: 

1. **Data Bundle Type**: The type of updates to push to clients
2. **Notify Url**: The url (must be **https**) to push data bundles to.


**Notes**:

1. Clicking the **[Eye]** icon will present you with the schema of the data bundle

.. image:: ../images/tenants/providers/tab/bundles/schema.png
      :width: 500pt
      :align: left
..

2. The notifiy url must be of type **HTTPS**.
3. Clicking the **[Edit]** will add a **[Add Data Bundle]** button.  This button can be used to add new Data Bundles.
4. Currently you can only add one bundle for a particular type.

.. image:: ../images/tenants/providers/tab/bundles/edit.png
      :width: 500pt
      :align: left
..


Deleting Trust Providers
*************************

Deleting a Trust Provider can be done by going to the **[General]** tab, clicking **[Edit]**, then clicking **[Delete Provider]**.
When deleting a trust provider you must accept a confirmation box asking you whether you want to delete the Trust Provider.


.. image:: ../images/tenants/providers/delete.png
   :width: 500pt
   :align: left
