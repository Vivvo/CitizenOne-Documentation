#!/bin/bash

rsync -e ssh -azvp ./html/ root@143.110.210.25:/var/www/docs/

