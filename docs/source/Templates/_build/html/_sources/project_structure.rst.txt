##################
Template Structure
##################

Assets
******

* icons - we used font awesome ([learn more here](https://fontawesome.com/how-to-use/on-the-web/referencing-icons/basic-use)), free icon library, but we did't find all needed icons there as such we have added missing icons to this folder as .svg 
* images - all images used in a project are contained here (logo etc.)
* Sass - all SCSS styles are here

Pages
*****

This folder contains main pages:
* `index` login
* `create-account` registration
* `reset-password` forgot password
* `reset-password-confirmation` 
* `dashboard` (my services)
* `service-add` (search and link services)
* `service-linker` (steps for linking the service)
* `service-onboard` (service onboarding)
* `service-card-back` (service card page for the linked service)
* `profile` 

Includes
********

Includes are small html components that we're importing to the pages. For example `header` is one of them,
it makes the code easier to maintain. Include is imported to the page, and when we want to make some changes,
we can just modify an include and the change will be visible on any page where the include is imported

Each page has a js function that loads all needed includes to the page:

.. code-block:: javascript
   :linenos:

   $(function(){
       $("#dashboard-navigation").load("../includes/dashboard-navigation.html");
       $(".serviceCard").load("../includes/service-card.html");
     });

and `<div>` element inside `html`, id will match includes name:

.. code-block:: html
   :linenos:

    <div id="dashboard-navigation"></div>

SCSS
****

Each page and include has its SCSS, so it makes it easy to maintain. SCSS files name match the HTML name:  `invoices.html = invoices.scss`.
You'll also see a few files that are not matching any HTML file:
* `index.scss` - this file is used to compile correct SCSS files, if you create a new SCSS you need to import, the stylesheet here, as`@import "invoices";` (use the name, .scss extension is not needed)
* `variables.scss` sass allows to use variables:  ex `$body-color: #20354E;` - defines body text color, if we change it

it will update the colour in each place that was used
    * `$body-color` - body text color
    * `$heading-color` - heading color
    * `$theme-primary` - used for primary color (background in a primary button, border in a secondary button)
    * `$theme-red` - error messages background
    * `$theme-green` - success messages
    * `$theme-primary-dark` - hover state for buttons
    * `$theme-primary-grey` - disabled elements
    * `$theme-background` - background color
    * `$theme-light-grey` - used as a background for some elements (ex. Create Account > Terms of Use)
    * `$theme-light-grey` - used for borders

* we used the bootstrap (free and open-source CSS framework - [read more](https://getbootstrap.com/docs/4.0/getting-started/introduction/)), but we overwrite bootstrap styles, and the changes are in a `global.scss`
* practical custom styles (that are NOT bootstrap overwrites) are defined in  `helpers.html` (e.g. layout stylings for pages, forms...)
* long and/or complex stylings of components should have their own stylesheet such as tables `tables.scss` or modals...

SCSS files are organized from top to the bottom, the best practice, to make any changes, is to find the right spot in a document, for example
 `service-card.scss` structure : .service-card; .card-title; .card-notification; .card-body;

 SCSS Style Guide
 ****************

 We followed a few rules in SCSS, they make the code easier to read and to maintain. They're best practices, but they're not breaking the code.

.. code-block:: html
   :linenos:

   .card-title {
        display: flex; (flexbox)
        align-items: baseline; (flexbox)
        justify-content: space-between; (flexbox)
        width: 12em; (width)
        height: 12em; (height)
        margin-bottom: 0.5em; (margin)
        padding: 0; (padding)
        background: transparent; (other)
        border: none; (other) 
    }

Not all declarations will always  be present, but the main rule is to keep flexbox declarations 
at the top (flex, width, height, margin, padding), and another styling lower in a block.

Webpack
*******

he code needs to be watched by Webpack, a new page must be added to the webpack.config.js, there is no need to add includes to the Webpack, when you open Webpack you'll see that each page is added there. You can copy the piece of code below, replace test with the name of the new HTML page and paste it to the webpack.config.js (currently line 102)

.. code-block:: html
   :linenos:

   new HtmlWebPackPlugin({
      template: './pages/test.html',
      filename: './test.html',
    }),

webpack will be watching created file.

Git-ignore
##########

In the project root there is a hidden file called **.git-ignore**, in this file are a list of files that will not be committed back to the source code repo when done.

.. code-block:: html
   :linenos:
   
   dist 
   node_modules
   .idea
   yarn.lock