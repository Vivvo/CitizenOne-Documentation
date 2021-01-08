Authentication
================

Passwords
~~~~~~~~~~~
All passwords in CitizenOne are hashed and salted using algorithms conforming to `FIPS-140 <https://www.cse-cst.gc.ca/en/page/what-fips-140>`_ standards.

Sessions & JWT
~~~~~~~~~~~
Upon successful authentication, a user is issued a signed JSON Web Token(JWT) which is signed by CitizenOne's private key. The public key for verifying the JWT can be found at `<https://{C1_DOMAIN}/api/v1/authentication/.well-known/jwks.json>`_.

The JWT contains a key-value mapping of Claims that assert information about the current user and their session. The JWT body conforms to the following schema:

.. code-block:: JSON

    {
    "mfaRequired": {user must pass mfa},
    "isMfa": {session is mfa verified OR session started using did-auth},
    "isDidAuth": {session started using did-auth}
    "exp": {expiry},
    "jti": {unique session id},
    "iat": {time of issuance},
    "iss": {issuer},
    "sub": {subject/identityId}
    }

When issued to the browser, the JWT is split in to 3 parts. The header, payload, and signature. The header and signature are marked as httpOnly cookies to prevent `session hijacking <https://en.wikipedia.org/wiki/Session_hijacking>`_.

Upon any requests to CitizenOne the JWT signature is verified to ensure the user has a valid session. After a predetermined time period, the JWT is also re-authorized and the expiry is extended based on timeouts set in the environment configuration.

.. _multi-factor-authentication:

Multi-factor Authentication
=============

CitizenOne supports multi-factor authentication in the form of SMS and TOTP authenticators.

Eeze Authentication
~~~~~~~~~~

Users may use their Eeze profile on their mobile device to sign into CitizenOne.

Eeze is treated as an LoA2 Authenticator, so logging in with Eeze sets `isMfa` AND `isDidAuth` to true in the cookie.

.. code-block:: JSON

    {
    ...
    "isMfa": true,
    "isDidAuth": true
    ...
    }

When logged in with Eeze, adding additional MFA methods is unnecessary, so the option is removed from the user's Security view on their profile.

SMS multi-factor authentication
~~~~~~~~~~

Users with SMS 2fa enabled will be prompted for a 6 digit verification code upon successful password login. This 6 digit verificaion code will be sent to the users mobile device via a phone number they have specified.

These 6 digits codes are generated at time of authentication and are hashed and salted using the same method as passwords. Once a verification code is used it is deleted.

TOTP mutli-factor authentication
~~~~~~~~~~

TOTP stands for `Time-based One-time Password algorithm <https://en.wikipedia.org/wiki/Time-based_One-time_Password_algorithm>`_ and is an open standard supported by Apple, Google, and many other providers.

Users may configure TOTP by scanning a QR Code provided by CitizenOne. This QR Code contains a secret key that both the user's authenticator device and CitizenOne will use to derive a rolling 6-digit verification code. 

A user will scan the QR Code with any third-party TOTP authenticator app which will then derive the next 6-digit time based code. The user will enter this 6-digit code in to CitizenOne which will verify that it derived the same 6-digit code based on the secret and TOTP algorithm.
