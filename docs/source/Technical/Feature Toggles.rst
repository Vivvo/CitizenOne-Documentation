Feature Toggles
================

A feature toggle is a technique in software development that attempts to provide an alternative to maintaining multiple branches in source code, such that a software feature can be tested even before it is completed and ready for release. Feature toggle is used to hide, enable or disable the feature during runtime.

Management Application
~~~~~~~~~~~~~~~~~~~~~~
System Administrators have access to the Feature Toggles page. Here they can create new toggles, turn them on and off and assign them to users. An active toggle with no usernames is active for every user. Multiple usernames should be comma-delimited.

HTML Templates
~~~~~~~~~~~~~~

Show different UI elements when a toggle is on/off.

.. code-block::

    <toggles feature="my-feature-toggle">
        <ng-template #active>
          <!-- This is what the user sees when the toggle is active. -->
        </ng-template>
        <ng-template #else>
          <!-- This is what the user sees when the toggle is not active. -->
        </ng-template>
    </toggles>


Typescript
~~~~~~~~~~

Execute different Angular Controller code if a toggle is on/off.

.. code-block::

    this.toggleService.toggleWrapper('my-feature-toggle', (): Observable<any> => {
              // Run this function if the toggle is active
            },
            (): Observable<any> => {
              // Run this function if the toggle is not active
            }
          )

Angular Routes
~~~~~~~~~~~~~~

Guard an angular route depending on if a toggle is on/off.

.. code-block::

    {
        path: 'featureToggles',
        pathMatch: 'full',
        component: TogglesComponent,
        canActivate: [HasAccessGuard, FeatureToggleGuard],
        data: {requiredRoles: ['SYSTEM_ADMIN'], feature: 'feature-toggles'}
    }
