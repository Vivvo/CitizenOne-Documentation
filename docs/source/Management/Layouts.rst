.. _layout_management:

Layout Management
=================

The CitizenOne Management application allows you to configure the layout of the login screen for end users, including adding external IDPs that can be used to login to CitizenOne.

The layout management page can be accessed by clicking [**Login Layout**] under the
[**Configuration**] tab of the sidebar.

.. image:: ../images/layouts/sidebar.png
   :width: 100pt
   :alt: Sidebar with the Login Layout selected
   :align: center

.. _viewing_layout:

Viewing the Login Layout
*************************

The Login Layout page displays a preview of what the CitizenOne login page will look like to end users.

| From this page, you can add and configure the widgets that appear. There are four types of widgets:
| **Basic Login**: This is the standard login form with Email/Username, Password, Sign In and Create Account
| **Eeze Login**: This will display a QR code to allow for login and account creation using the CitizenOne Eeze mobile application
| **Identity Providers**: This will add a section to display the IDPs supported for login
| **Account Benefits**: This adds add a section that allows you to highlight some of the benefits of using a centralized CitizenOne login

.. _layouts_add_widget:

Adding a Widget to the Layout
***********

To add a Widget to the login page, select a Widget that hasn't been added and click the [**+ Add Widget**} button.

.. image:: ../images/layouts/addWidget.png
   :width: 500pt
   :alt: Adding a Widget to the Login page
   :align: center

Once a Widget has been added, it can now be configured.

.. _layouts_edit_widget:

Editing a Widget in the Layout
***********

To edit a Widget in the layout, click on the Widget in the preview and a configuration form for the Widget will appear.

.. _layouts_edit_widget_basic_login:

1. Basic Login Widget
~~~~~~~~~~~~~~~

.. image:: ../images/layouts/basicLogin.png
   :width: 500pt
   :alt: Configure the Basic Login Widget
   :align: center

The configuration options for the Basic Login Widget are:

1. **Width**: The number of Bootstrap columns on the page the widget spans
2. **Background**: The background colour of the widget
3. **Responsive Push**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-push'. If unsure, leave at 0 to disable.
4. **Responsive Pull**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-pull'. If unsure, leave at 0 to disable.
5. **Border**: If enables, a light border will appear around the widget

.. _layouts_edit_widget_eeze_login:

2. Eeze Login Widget
~~~~~~~~~~~~~~~

.. image:: ../images/layouts/eezeLogin.png
   :width: 500pt
   :alt: Configure the Eeze Login Widget
   :align: center

The configuration options for the Eeze Login Widget are:

1. **Width**: The number of Bootstrap columns on the page the widget spans
2. **Background**: The background colour of the widget
3. **Responsive Push**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-push'. If unsure, leave at 0 to disable.
4. **Responsive Pull**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-pull'. If unsure, leave at 0 to disable.
5. **Border**: If enables, a light border will appear around the widget

.. _layouts_edit_widget_identity_providers:

3. Identity Providers Widget
~~~~~~~~~~~~~~~

.. image:: ../images/layouts/eezeLogin.png
   :width: 500pt
   :alt: Configure the Identity Providers Widget
   :align: center

The configuration options for the Identity Providers Widget are:

1. **Width**: The number of Bootstrap columns on the page the widget spans
2. **Background**: The background colour of the widget
3. **Responsive Push**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-push'. If unsure, leave at 0 to disable.
4. **Responsive Pull**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-pull'. If unsure, leave at 0 to disable.
5. **Border**: If enables, a light border will appear around the widget
6. **Provider Width**: The width of each Identity Proivder's card on the login page

To add and configure a new Identity Provider, please refer to :ref:`Identity Providers on the Login Screen<identity_provider_login_screen>`

.. _layouts_edit_widget_account_benefits:

4. Account Benefits Widget
~~~~~~~~~~~~~~~

.. image:: ../images/layouts/accountBenefits.png
   :width: 500pt
   :alt: Configure the Account Benefits Widget
   :align: center

The configuration options for the Eeze Login Widget are:

1. **Width**: The number of Bootstrap columns on the page the widget spans
2. **Background**: The background colour of the widget
3. **Responsive Push**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-push'. If unsure, leave at 0 to disable.
4. **Responsive Pull**: Changes the order of columns for non-mobile views. See Bootstrap's 'col-md-pull'. If unsure, leave at 0 to disable.
5. **Border**: If enables, a light border will appear around the widget

.. _layouts_delete_widget:

Deleting a Widget in the Layout
***********

.. image:: ../images/layouts/deleteWidget.png
   :width: 500pt
   :alt: Deleting a Widget from the Login page
   :align: center

To delete a Widget from the login page, first click on the Widget from the preview layout to open the configuration form for that Widget.

In the top right of this form, click the [**Delete Widget**] button to remove the Widget.

.. _layouts_save:

Saving a Layout
*************************

Changes to the layout do not save automatically. When you are done making changes to the layout, click the [**Save All**] button at the bottom of the page.

.. _layouts_undo:

Undo Changes to a Layout
*************************

If you have made changes to the layout and have not saved them yet, click the [**Cancel All**] button at the bottom of the page to go back to the last saved layout.
