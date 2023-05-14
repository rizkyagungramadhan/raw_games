#!/bin/bash

#For print all until the filename
#tree=$(tree -tf --noreport -I '*~' --charset ascii $1 |
#       sed -e 's/| \+/  /g' -e 's/[|`]-\+/ */g' -e 's:\(* \)\(\(.*/\)\([^/]\+\)\):\1[\4](\2):g')
#
#printf "# Project tree\n\n${tree}"

tree=$(tree -d --noreport -I '*~' --charset ascii $1 |
       sed -e 's/\/[^\/]*\//\//g' -e 's/^/  /')

printf "# Project tree\n\n${tree}"


