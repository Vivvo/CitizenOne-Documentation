.. _applications:
Applications
##############

An Application is an instance of a software application that is made available to citizens to interact with government services. An Application belongs to an :ref:`Organizations <organizations>` and may have its own :ref:`Policies <policies>`. An Application may have more than one :ref:`Service Card <service-cards>` that is presented to the citizen to access the application. An Application may also have a set of :ref:`Email Templates <email-templates>` available that can be managed and consumed by the Application.

The Vivvo Trust Platform Management application allows you to configure settings such as Policies, linked Service Cards, and Service Provider information for your Applications.
The list of all available Applications can be accessed by clicking [Applications] under the [Tenants] tab of the sidebar.

.. _view-apps:
Viewing Applications
*********************

The initial Applications page displays a list of all of the Applications that have been created for your instance of Vivvo Trust Platform. Here, you can see a small preview of the Application’s data, namely the name and if the Application has a Policy attached.

On this page, you are able to filter the displayed list of Applications by their name, click on an Application in the list for a more detailed view, or create a new Application.

.. note::
    Users that have only the “READ Applications” role will not be able to create, modify, or delete any Applications.

.. image:: /images/managementapp/view-all-apps.png
   :width: 300pt
   :alt: View all applications
   :align: center 

.. _create-apps:
Creating Applications
**********************

When you need to set up a new Application, you can click the [+ Create] button in the top right of the initial Application listing page.

.. image:: /images/managementapp/create-app.png
   :width: 300pt
   :alt: Create an application
   :align: center 

This will bring you to a new view where you will be asked to fill out only the vital information needed to create the Application. Any fields not seen here will be configurable after the Application has successfully been created.

For Applications, the only field required is the name of your new Application, and the Organization it belongs to.

.. image:: /images/managementapp/create-app-fields.png
   :width: 300pt
   :alt: Create applictaion (fields)
   :align: center 

Clicking the [**Cancel**] button will not save any changes you made to the form, and you will be taken back to the Application listing page.

Clicking the [**Save**] button will then attempt to make a new Application with your provided details.

Upon success, you will be shown two values: your Client ID and Client Secret. Ensure that you save your Client Secret somewhere secure, as you will not be able to see it again after leaving this page.

.. image:: /images/managementapp/client-id-secret.png
   :width: 300pt
   :alt: Client ID and client secret
   :align: center 

Clicking the [**Continue**] button will then take you to the new Application’s details page.

.. _edit-app:
Editing an Application
************************

When you click on or create an Application, you will be taken to a view with multiple tabs. Each tab contains information that you can fill out to help define and customize your Application.

.. image:: /images/managementapp/edit-app.png
   :width: 300pt
   :alt: Edit Applications
   :align: center 

Clicking on these tabs changes the view. As such, if you are editing any forms on a page, ensure that you save any changes, or they will be lost on navigation.

.. _app-general-tab:
Application General Tab
=========================

The General tab of an Application contains the basic details that define the Application itself.
On this page, you are able to change the name of the Application, set a homepage, upload the logo of your Application, toggle the “Privacy Scope” setting, and add or remove redirect_urls. Here, you may also regenerate your Client Secret if you have lost the original, and it will again be displayed only once to you.

.. note::
    The “**Policy Scope**” toggle determines whether the unique identifier that is assigned to users (of Vivvo Trust Platform, not Management) will be shared between Applications.
    
    *If a user accesses Application A’s Service Card and provides data, the data that the Service receives will not contain the user’s original identifier, but a new one. If that same user accesses Application B’s Service Card and provides data, again, a new identifier will be issued.*
    
    This is done to ensure that data cannot be cross-referenced and compiled to form a single profile on an individual.

.. image:: /images/managementapp/app-general-tab.png
   :width: 300pt
   :alt: Applications general tab
   :align: center  

Clicking the [**Edit**] button will enable the fields in the view for change. Ensure your changes are saved before navigating away from the page.

.. _app-service-cards-tab:
Application Service Cards Tab
==============================

The job of any application is to provide specific services to the end users. Attaching Service Cards to a Vivvo Trust Platform Application is how you define the services that an Application has available for use.

To link a Service Card, click the [**Edit**] button, then the [**+ Add Service Card**] button. From the dropdown that appears, select your desired Service Card and then either add another Service Card, remove any existing Service Card, and then save or cancel your changes.

If you have the permissions to do so, clicking the blue icon on a Service Card will take you to that Service Card’s page.

.. image:: /images/managementapp/app-service-cards-tab.png
   :width: 300pt
   :alt: Application service cards tab
   :align: center 

.. note::
    Applications may have many Service Cards.
    
    *You are linking up a website, “my-license.com” that allows users to manage some of their license information. This website gives them the ability to renew their license, and purchase insurance. The Vivvo Trust Platform Application “My License” represents the whole of “my-license.com”, and it would have two Service Cards, one named “Renew my License” and one named “Purchase Insurance”. The Service Cards represent the individual services that “my-license.com” offers.*

.. _app-policy-tab:
Application Policy Tab
=======================

Applications, like both Organizations and Service Cards, are Policy holders. Policies applied to an Application apply to all Service Cards that belong to the Application.
A Policy can be chosen by navigating to the Policies tab and clicking the [**Edit**] button.

.. image:: /images/managementapp/app-policy-tab.png
   :width: 300pt
   :alt: Application policy tab
   :align: center 

.. note::
    If a Policy is selected, a preview of the Policy text will be displayed on this page, below the Policy selection dropdown.

.. _app-provider-config-tab:
Application Provider Configuration Tab
=======================================

Some services require more advanced authentication that is provided by the host application. Vivvo Trust Platform allows for SAML configuration to be set up on the Vivvo Trust Platform Application so that it may properly integrate with third party services.

To add a SAML configuration for your Application, click the [**Edit**] and then the [**+ Add Config**] buttons. From here, you may upload the valid SAML metadata needed to authenticate with the downstream services.

.. image:: /images/managementapp/app-provider-config-tab.png
   :width: 300pt
   :alt: Application provider Configuration tab
   :align: center 

