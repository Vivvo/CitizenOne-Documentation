Adding a Service Card in Portal
===============================

.. _policy:

Creating a Policy
*****************

We can create a new Policy by clicking on the Policies tab.

.. image:: ./images/policy-create-tab.png
   :width: 500pt
   :align: left

We can click on the Create button on the top right to create a Policy.

.. image:: ./images/policy-create-revision.png
   :width: 500pt
   :align: left

The general view allows you to maintain the policy details.

.. image:: ./images/policy-create-manage-revision.png
   :width: 500pt
   :align: left

The Revision view is used to maintain policy revisions. Let go ahead and create a new revivsion for our policy.

Creating a Revision
~~~~~~~~~~~~~~~~~~~

.. image:: ./images/revision-create-main.png
   :width: 500pt
   :align: left

Here, we can either create an entirely new revision or use an old revision as a starting point to base our new revision off of. 

.. image:: ./images/revision-policy-text.png
   :width: 500pt
   :align: left

Text view allows you to add and update the policy text. 

.. image:: ./images/revision-create-callbacks.png
   :width: 500pt
   :align: left

Next, we add callbacks to our policy.

.. image:: ./images/revision-create-scopes.png
   :width: 500pt
   :align: left

Create scopes for our policy.

.. image:: ./images/revision-create-rule.png
   :width: 500pt
   :align: left

Add rules to our policy. If you want to create a new rule, please refer to :ref:`rule`. 

.. image:: ./images/revision-create-review.png
   :width: 500pt
   :align: left

This view allows you to review your revision and comfirm your changes. Here is where you can make the revision active.

Creating an Application
***********************

Now, we must create an application.

.. image:: ./images/application-create-tab.png
   :width: 500pt
   :align: left

We can manage applications by clicking on the Applications tab.

.. image:: ./images/application-create-main.png
   :width: 500pt
   :align: left


Add the application details and hit create.

.. image:: ./images/application-create-general.png
   :width: 500pt
   :align: left

You will land on the general tab. Here you are able to maintain your new application.

.. image:: ./images/application-create-servicecard.png
   :width: 500pt
   :align: left

This view allows you to add service cards you your application. If you want to create a new service card, please refer to :ref:`service-card` 

.. image:: ./images/application-create-policy.png
   :width: 500pt
   :align: left

Give your application a policy in the policy view. If you want to create a new policy, please refer to :ref:`policy`.

.. image:: ./images/application-create-saml.png
   :width: 500pt
   :align: left

Finally, you are abe to add the Service Providers SAML metadata through this view.

.. _service-card:

Creating a Service Card
***********************

Service Cards allows administrators to view all service cards that have been created in the system.

We can create a new service card by clicking on the Service Cards tab.

.. image:: ./images/service-card-tab.png
   :width: 500pt
   :align: left


We can click on the Create button on the top right to create a new service 

.. image:: ./images/service-card-create-main.png
   :width: 500pt
   :align: left

The Details tab allows an you add general information about the service card. (Title, service type, service description and status of pilot mode) 

.. image:: ./images/service-card-create-tasks.png
   :width: 500pt
   :align: left

In the Tasks view, you can opotionally add task to your service card.

.. image:: ./images/service-card-policy.png
   :width: 500pt
   :align: left

Add a Policy to your service card. Please refer to :ref:`policy` section to view how to create a new policy. 

.. image:: ./images/service-card-create-review-1.png
   :width: 500pt
   :align: left

.. image:: ./images/service-card-create-review-2.png
   :width: 500pt
   :align: left

Finally, review your service card and click create when done.

.. _rule:

Creating a Rule
***************
Rules define a specific set of requirements that users must meet in order to use the policy.

We can create a new rule by clicking on the Rules tab.

.. image:: ./images/rule-tab.png
   :width: 500pt
   :align: left

This view is used to create and maintain our Rules. Lets create a new Rule by clinging on the Create button on the top right.

.. image:: ./images/rule-create-main.png
   :width: 500pt
   :align: left

Fill out the necessary details for ypur new rules and click create.

.. image:: ./images/rule-create-general.png
   :width: 500pt
   :align: left

We have now created our new Rule. We are now on the general details view in which you are able to maintain the rule details.

.. image:: ./images/rule-create-parameters.png
   :width: 500pt
   :align: left

The parameters view allows you to add a list of names parameters to be used with the rule.


Creating a Trust Provider
*************************

We can create a new trust provider by clicking on the Trust Providers tab.

.. image:: ./images/trust-provider-tab.png
   :width: 500pt
   :align: left

On this view, we can create and maintain Trust Providers. Lets go ahead and create a new Trust Provider by clicking on the Create button on the top right.

.. image:: ./images/trust-provider-create-main.png
   :width: 500pt
   :align: left

On this view, you can fill out the necessary details about our new Trust Provider and click create.

.. image:: ./images/trust-provider-create-general.png
   :width: 500pt
   :align: left

We have now created our Trust Provider and our greeted with general details about the provider. You can maintain the details in this view.

.. image:: ./images/trust-provider-create-onboarding.png
   :width: 500pt
   :align: left

The next view is deals with onboarding parameters. Here, you can add adapter callout paths, required onboarding arguments and a no-code form used to onboard with the trust provider.

.. image:: ./images/trust-provider-create-rule.png
   :width: 500pt
   :align: left

Finally, we have our Trust Provider Rules view. Here you can maintain rules that a provider has. If the rule you seek does not exist, please referece :ref:`_rule` section.  