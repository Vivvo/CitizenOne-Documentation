This module describes the CitizenOne sister application: Eeze. Eeze is a credential wallet that enables users to have quick and simple access to their online identity, and be completely in chaarge of provisioning information out to consuming services.

The application is totally standalone, but has features baked in specifically for use with the CitizenOne platform.

`Read more here. <https://eeze.io/#/home>`_

Accessing CitizenOne Service Cards
**********************************

- After logging into CitizenOne with Eeze, you'll be able to view a list of the available Service Cards from within the application.
.. note::
    The "Services" tab will only be displayed if the DID Document of the issuer contains a service endpoint of type "C1ServiceEndpoint".

    This is done by checking the Document for the correct type of endpoints, and then passing the found URL into the Account view, where it will make the request to retrieve the Service Cards.

.. image:: ./images/eeze-service-cards.gif
   :width: 200pt
   :align: center

- You will be presented with a list of Service Cards, under the "Services" tab when you click into the CitizenOne account card.
- Service Cards that you have favorited with your CitizenOne Identity will appear with a gold heart. This heart can be tapped to unlink the Service Card. Likewise, unfavorited Service Cards will be displayed with a gray heart, and can be tapped to favorite them.

.. image:: ./images/eeze-service-cards-linking.jpg
   :width: 200pt
   :align: center

- Tapping on a Service Card will authenticate your Identity with the issuer of the Service Card, and launch your preferred web browser to take you to the back of the Service Card, without needing to manually log in.
.. note::
    This is accomplished by performing DID authentication in the background, and then using the acquired token by inserting it, alongside the host of the provider, into a temporary document, which is launched in the browser, that POSTS to a consuming endpoint of the provider in order to set the session of the User. Then, using a `goto` which points to the back of the Service Card, the user is redirected and is able to access their CitizenOne profile.