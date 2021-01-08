************
Style Sheets
************

Introduction
############

We styled the project using SCSS. SCSS is the premier CSS extension language and it's completely compatible with all versions of CSS. SCSS provides the ability to write maintainable, reusable, and extensible code, ultimately meaning that code is faster to develop and better structured than plain CSS. The main advantage of using SCSS is the ability to use programming functionality such as variables, functions, inheritance, and operators. The benefits of these functionalities are that the code is displayed more logically, making it easier to manage. SCSS is not read by the browser, it must be compiled to CSS. There are various automated options to do that and we chose Webpack. Webpack processes SASS code and transforms it into CSS. We can give it a large number of files (as you can see in the SASS folder) and it generates a single file. To preview the project the files need to be compiled. Use yarn (package manager) to compile and preview the project.

Steps to run the Templates
##########################

1. open the terminal and install yarn (make sure you're in the projects directory): `yarn install`
2. run yarn: `yarn start`
3. if the process was successful you'll see `Compiled successfully.` in a terminal
4. now you can preview the project in the browser:
   * login page: http://localhost:9000/
   * dashboard (my services): http://localhost:9000/dashboard.html
   * my profile: http://localhost:9000/profile.html
5. you can make changes to the project and you'll see your updates in a browser after refresh
    * if you can't see your changes, check if `yarn` is still running
    * you can restart the process by clicking `ctrl+c` (stops the process) and next `yarn start`
    * sometimes the browser needs a hard refresh: hold `shift` + click `refresh` (in a browser)
    * stop `yarn` when you're done work (`ctr + c`)