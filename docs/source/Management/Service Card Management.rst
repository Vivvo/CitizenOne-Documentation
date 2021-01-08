.. _service-card-management:

Service Card Management
=======================

Service Cards are the way in which citizens access digital services through CitizenOne.

The CitizenOne Management application allows you to manage the services being offered by configuring service cards.

The list of all available Service Cards can be accessed by clicking [**Service Cards**] under the
[**Tenants**] tab of the sidebar.

.. image:: ../images/tenants/serviceCards/sidebar.png
   :width: 100pt
   :alt: Sidebar with the Organizations tab selected
   :align: center

.. _viewing_service_cards:

Viewing All Service Cards
**************

The initial Service Cards page displays a list of all Service Cards
that have been created for your instance of CitizenOne. They appear as cards to show how they will appear on a citizen's dashboard page.

From this page, you are able to filter the displayed list of Service Cards by their name,
click on a Service Card in the list for a more detailed view, or create a new Service Card.

If you have only been granted "READ" access to Service Cards, you will not be able to create new Service Cards,
nor will you be able to modify existing Service Cards.

.. image:: ../images/tenants/serviceCards/servicecard-view.png
   :width: 500pt
   :alt: List of Service Cards in CitizenOne
   :align: center

.. _creating_service_cards:

Creating Service Cards
**************

When you've determined that a new Service Card is needed, you can click the [**+ Create**] button
in the top right of the Service Card listing page.

.. image:: ../images/tenants/serviceCards/servicecard-create-button.png
   :width: 500pt
   :alt: Creating a new Service Card
   :align: center

| The tabs for a new Service Card are:  
| **Details**: The basic information of the Service Card  
| **Tasks**: The tasks the citizen can complete for the Service Card  
| **Policy**: The policy of the Service Card  
| **Review**: Reviewing all Service Card information before creating  

.. _service_card_details:

Service Card Details
~~~~~~~~~~~~~~~~~~~~~~~~~~

The general fields for the details of a Service Card are:

1. **Title**: The title of the service card
2. **Service Card Type**: The type of Service Card, typically Personal or Business, that determines if the Service Card is accessible by citizens or businesses
3. **Description**: An optional description that appears on the service card
4. **Pilot**: If set, Pilot Mode will remove the service card from the service catalog, but remain available through direct access

.. image:: ../images/tenants/serviceCards/servicecard-create-details.png
   :width: 500pt
   :alt: Viewing general information about a Service Card
   :align: center

Clicking [**Next**] will take you to the Tasks tab.

.. _service_card_tasks

Service Card Tasks
~~~~~~~~~~~~~~~~~~~~~~~~~~

Tasks can be added to Service Cards in two ways. The first way is to add static Tasks that are always displayed and accessible to all users. 
The second way is through dynamic Tasks set on a Policy. This is defined by specifying an API endpoint that CitizenOne will use to call out to the application and retrieve a set of Tasks specific to the user accessing the Service Card.

Below describes how to add static Tasks.

.. _service_card_add_task:

Adding a Service Card Task
--------------------------

.. image:: ../images/tenants/serviceCards/servicecard-create-tasks.png
   :width: 500pt
   :alt: Creating a new Task for a Service Card
   :align: center

The general fields for a Task are:

1. **Title**: The title of the Service Card Task
2. **Description**: An optional description that appears below the Task Title
3. **Callout URL**: The navigation link to send the user for this Task
4. **Style**: The service card background color, 'Primary', 'Second', 'Danger', 'Warning' and 'info'

.. _service_card_reorder_tasks:

Reordering Service Card Tasks
--------------------------

The Service Card Tasks are able to be reordered through draging the Task.

.. image:: ../images/tenants/serviceCards/servicecard-tasks-reordering.png
   :width: 500pt
   :alt: Reordering Tasks for a Service Card
   :align: center

.. _service_card_removing_tasks:

Removing Service Card Tasks
--------------------------

You can remove a Service Card Task by clicking the red [**X**] button on right top corner.

.. image:: ../images/tenants/serviceCards/servicecard-tasks-remove.png
   :width: 500pt
   :alt: Removing Tasks on a Service Card
   :align: center

Clicking [**Back**] will take you back to the Details tab.

Clicking [**Next**] will take you to the Policy tab.

.. _service_card_policy:

Service Card Policy
~~~~~~~~~~~~~~~~~~~~~~~~~~

A Service Card will inherit the Policy(ies) set at the Application, Organization and Tenant level associated with the Service Card, if they exist. Optionally, you can also set a Policy at the Service Card level.

If a Policy should be set for the specific Service Card, select one from the drop-down.

.. image:: ../images/tenants/serviceCards/servicecard-create-policy.png
   :width: 500pt
   :alt: Setting a Policy on a Service Card
   :align: center

Clicking [**Back**] will take you back to the Tasks tab.

Clicking [**Next**] will take you to the Review tab.

.. _service_card_review:

Service Card Review
~~~~~~~~~~~~~~~~~~~~~~~~~~

The Service Card Review tab will show all Service Card information including basic Details, Pilot Mode, Tasks and the Policy, if any information needs to be changed, click the [**Back**] button to go to previous tabs and correct the information.

.. image:: ../images/tenants/serviceCards/servicecard-create-review.png
   :width: 500pt
   :alt: Reviewing the new Service Card
   :align: center

Clicking [**Back**] will take you back to the Policy tab.

Clicking [**Confirm**] will create the Service Card, and you will be taken to the new Service Card's details page.

.. _viewing_editing_service_card:

Viewing and Editing a Service Card
******************************

When you click on or create a Service Card, you will be taken to a view with multiple tabs.
Each tab contains information that you can fill out to help define and customize the Service Card.

The Details, Tasks and Policy tasks show the relevant Service Card information and can be edited in a similar way described in the :ref:`Created Service Cards <creating_service_cards>` section of this page.

| Additional tabs that can be accessed that provide further customization of a Service Card. These are:
| **Forms**: Link a Form to be accessed through a Task on the Service Card
| **Contacts**: Contact Information for the Service Card 
| **Applications**: Application(s) associated with the Service Card

.. _service_card_linking_forms:

Linking Forms to Service Cards
*****************************************

The Service Card Form tab allows you to link a Form to a Service Card causing the Form to appear as a Task on the Service Card. 

  .. image:: ../images/tenants/serviceCards/service-card-form-management.png
     :width: 500pt
     :alt: Setting a form on a Service Card
     :align: center
  ..

Clicking [**Edit**] will enable the fields in the view for change. You can specify information for one or more contacts using the fields shown. Ensure your changes are saved before navigating away from the page.

In order to link a Form to a service card you need to:

1. Make sure the service card is :ref:`Connected to an Application<application_service_cards>`
2. Make sure that the service card :ref:`Application has a Policy<application_policy>`
3. :ref:`Create a form<creating_forms>` in the same Organization and Application that is linked to the Service Card
4. Navigate to the Form tab for your Service Card and select the Form from the list

.. _service_card_contacts:

Service Card Contacts
******************************

The Service Card Contacts tab allows you to add relevant contact information about the Service Card.

  .. image:: ../images/tenants/serviceCards/contact-information.png
     :width: 500pt
     :alt: Contact Information for the Service Card
     :align: center
  ..

Clicking [**Edit**] will enable the fields in the view for change. You can specify information for one or more contacts using the fields shown. Ensure your changes are saved before navigating away from the page.

The contact information entered will be shown on the back of the service card.

  .. image:: ../images/tenants/serviceCards/service-card-contacts.png
     :width: 500pt
     :alt: Service Card contact information
     :align: center
  ..

.. _service_card_linking_applications:

Linking Service Cards to Applications
*****************************************

The Service Card Contacts tab allows you to view which Application(s) are attached to a Service Card.

  .. image:: ../images/tenants/serviceCards/applications.png
     :width: 500pt
     :alt: Linking a Service Card to an Application
     :align: center
  ..

You cannot link or unlink Applications from Service Cards on this page. However, clicking the **click here** link will take you to the Applications page where you can add or remove Service Cards to/from Applications.
For more details see the :ref:`application_service_cards`.