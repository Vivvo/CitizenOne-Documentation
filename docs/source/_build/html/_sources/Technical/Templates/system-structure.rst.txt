****************
System Structure
****************

Architecture 
*******************

CitizenOne is composed of a number of services that are orchestrated to provide trust as a service.  This manual deals with the service that delivers the citizen facing web pages.

The front end component is made up of two parts.

1. The templates
2. The controllers

The controllers broker the logic to generate and deliver the html/javascript/css files to the client depending on the interaction in context. For example, during a login request the controller will assemble the templates required to capture the user credentials.
The controllers are also responsible to talk to the service layer, the service layer will invoke the right client to call out to other microservices when required.




.. sidebar:: Sidebar Title
    :subtitle: Optional Sidebar Subtitle

    Subsequent indented lines comprise
    the body of the sidebar, and are
    interpreted as body elements.

.. graphviz::

    digraph strucure {
    label = "logical layout";
    labelloc = "t"; 
       "template" -> "controller" -> "services" -> "clients" [color=blue]
    }

.. csv-table:: **Page Controller Relationships**
   :header: "Page Name", "Controllers", "Purpose"
   :widths: 20, 20, 60

   "create-account.html", "profileController", "account registration, high velocity federated creation"
   "dashboard.html", "dashBoardController", "service card management"
   "index.html", "loginContoller", "account login"
   "profile.html", "profileController", "manage profile"
   "reset-password-confirmation.html", "profileController", "account reset activities"
   "reset-password.html", "profileController", "account reset activities"
   "service-add.html ", "serviceCardController", "service card management"
   "service-card-back.html", "serviceCardController", "service card interactions"
   "service-linker.html", "serviceCardController", "service card enablement"
   "service-onboard.html", "serviceCardController", "service enrollment"

   