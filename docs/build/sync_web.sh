#!/bin/bash

rsync -e ssh -azvp ./html/ root@docs.vivvo.com:/var/www/html/docs.vivvo.com/

