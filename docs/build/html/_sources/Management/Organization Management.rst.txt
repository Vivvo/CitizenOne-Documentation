.. _organization_management:

Organization Management
=======================

Organizations are, primarily, a way of categorizing and organizing your Applications.
The CitizenOne Management application allows you to configure settings such as Policies and
user access to your Organizations.

The list of all available Organizations can be accessed by clicking [**Organizations**] under the
[**Tenants**] tab of the sidebar.

.. image:: ../images/Management/organizations/sidebar.png
   :width: 100pt
   :alt: Sidebar with the Organizations tab selected
   :align: center

.. _viewing_organizations:

Viewing All Organizations
*************************

The initial Organizations page displays a list of all of the Organizations
that have been created for your instance of CitizenOne. Here, you can see a small
preview of the Organization's data, namely the name and if the "Privacy Scope" option
has been enabled.

From this page, you are able to filter the displayed list of Organizations by their name,
click on an Organization in the list for a more detailed view, or create a new Organization.

If you have only been granted "READ" access to Organizations, you will not be able to create new Organizations,
nor will you be able to modify existing Organizations.

.. image:: ../images/Management/organizations/organizations-list.png
   :width: 500pt
   :alt: List of Organizations in CitizenOne
   :align: center

.. _creating_organizations:

Creating Organizations
**********************

When you've determined that a new Organization is needed, you can click the [**+ Create**] button
in the top right of the Organization listing page.

.. image:: ../images/Management/organizations/create-button.png
   :width: 500pt
   :alt: Creating a new Organization
   :align: center

This will bring you to a new view where you will be asked to fill out only the vital information
needed to create the Organization. Any fields not seen here will be configurable after the Organization has
successfully been created.

For Organizations, the only field required is the name of your new Organization.

.. image:: ../images/Management/organizations/create.png
   :width: 500pt
   :alt: Form to create a new Organization
   :align: center

Clicking the [**Cancel**] button will not save any changes you made to the form, and you will be taken back to the
Organization listing page.

Clicking the [**Save**] button will then attempt to make a new Organization with your given name, and you will be taken
to the new Organization's details page.

.. _viewing_editing_organization:

Viewing and Editing an Organization
******************************

When you click on or create an Organization, you will be taken to a view with multiple tabs.
Each tab contains information that you can fill out to help define and customize your Organization.

.. image:: ../images/Management/organizations/organization-tabs.png
   :width: 500pt
   :alt: Viewing Organization details
   :align: center

Clicking on these tabs changes the view so if you are editing any forms on a page, ensure
that you save any changes, or they will be lost on navigation.

.. _organization_general:

Organization General Tab
************************

The General tab of an Organization contains the basic details that define the Organization itself.
The two fields that primarily define an Organization are its Name and if the "Policy Scope" has been enabled.

.. note::
    The [**Policy Scope**] toggle determines whether the unique idenfifier that is assigned to users (of CitizenOne, not Management)
    will be shared between Organizations.
    
    **Example)** *When Policy Scope is enabled for an Organization, if a user accesses Organization A's application and provides data, the data that the application recieves will not contain the users orignal identifer, but a new one.
    If that same user accesses Organization B's application and provides data, again, a new identifer will be issued.*

    This is done to ensure that data cannot be cross-referenced across organizations and compiled to form a single profile on a citizen.

.. image:: ../images/Management/organizations/general.png
   :width: 500pt
   :alt: Viewing general information about an Organization
   :align: center

Clicking the [**Edit**] button will enable the fields in the view for change. Ensure your changes are saved before navigating away from the page.

.. _organization_policy:

Organization Policy
*******************

Organizations, like both Applications and Service Cards, are Policy holders. Policies applied to an Organization
apply to all Applications that belong to the Organization, and likewise all of the Service Cards linked to those Applications.

A Policy can be chosen by navigating to the Policies tab, and clicking [**Edit**].

.. image:: ../images/Management/organizations/policy.png
   :width: 500pt
   :alt: Viewing the Policy for an Organization
   :align: center

.. note::
    If a Policy is selected, a preview of the Policy text will be displayed on this page, below the Policy selection dropdown.

.. _organization_users:

Organization Users
*******************

By clicking on the Users tab, you will be shown a list of all users that have been assigned to an Organization.

.. note::
    **Users** in this section refers to those that have been given access to the CitizenOne Management application.

.. image:: ../images/Management/organizations/users.png
   :width: 500pt
   :alt: Viewing the users for an Organization
   :align: center

Users that have access to the Management application will only be able to see the details of any Organization that they belong to.
This includes Applicatons, **if they have also been given the correct permissions to view Applications**.
Users of an Organization may be added or removed from this page.

.. _removing_organization:

Removing an Organization
******************************

When you are on the General tab, click the [**Edit**] button. 

.. image:: ../images/Management/Organizations/delete.png
   :width: 500pt
   :alt: Removing an Organization
   :align: center

Clicking the [**Delete Organization**] button will remove the Organization from CitizenOne. When deleting an Organization you must accept a confirmation asking whether you want to delete the Organization.