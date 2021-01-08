Dynamic Identity Providers
==========================

Previously, any Identity Providers tenants wished to integrate with has to be hardcoded
within the config of the Vivvo-sp. However, making this easily configurable - without deployment -
was impossible.

Now, instead of storing the necessary provider data in static files, we are able to upload
Provider metadata directly to the Vivvo-sp through CitizenOne Management.

.. code-block:: mysql

    CREATE TABLE idp_metadata
    (
        provider_id     varchar(36)            not null primary key,
        provider_name   varchar(100)           not null,
        entity_id       varchar(255)           null,
        enabled         tinyint(1)             not null default 0,
        metadata        text                   null,
        metadata_url    varchar(255)           null,
        strategy        text                   not null,
        app_key         varchar(36)            null,
        api_key         varchar(36)            null,
        me_endpoint     varchar(255)           null,
        cookie_domain   varchar(255)           null,
        constraint      entity_id              unique (entity_id),
        constraint      provider_name_unique   unique (entity_id)
    );

- **provider_id**: Generated UUID on creation.
- **provider_name**: The name used to launch the Identity Provider flow, `e.g. ".../saml/launch/<provider_name>"`.
- **entity_id**: The entityID within the SAML Metadata, autopopulated when uploaded in Management.
- **enabled**: Allows use.
- **metadata**: The SAML metadata supplied by the Identity Provider.
- **metadata_url**: A URL to SAML metadata supplied by the Identity Provider. **Not yet implemented!**
- **strategy**: The method to use when kicking off the flow, either 'c1' or 'did-auth'.
- **app_key**: The ClientID (app_key) of the Identity Provider application.
- **api_key**: The Client Secret (api_key) of the Identity Provider application.
- **me_endpoint**: The endpoint at which the user's identity may be retrieved from the Identity Provider.
- **cookie_domain**: The domain of the Service Provider.