#!/bin/bash

# JS
js=\
$(find . -name '*.js' \
-not -path "*/dist/*" \
-not -path "*/node_modules/*" \
-not -path "*/uglifyjs_cache/*" \
| xargs wc -l)

echo -n "JavaScript "
echo $js 'de linhas' \
| grep -o '.\{0,5\}total.\{0,10\}'

# Vue
vue=\
$(find . -name '*.vue' \
-not -path "*/node_modules/*" \
| xargs wc -l)

echo -n "Vue.js "
echo $vue 'de linhas' \
| grep -o '.\{0,4\}total.\{0,10\}'

# Stylus
styl=\
$(find . -name '*.styl' \
-not -path "*/node_modules/*" \
| xargs wc -l)

echo -n "Stylus "
echo $styl 'de linhas' \
| grep -o '.\{0,4\}total.\{0,10\}'

# Shell Script
sh=\
$(find . -name '*.sh' \
-not -path "*/node_modules/*" \
| xargs wc -l)

echo -n "Shell "
echo $sh 'de linhas' \
| grep -o '.\{0,4\}total.\{0,10\}'

# YML
yml=\
$(find . -name '*.yml' \
-not -path "*/node_modules/*" \
| xargs wc -l)

echo -n "YML "
echo $yml 'de linhas' \
| grep -o '.\{0,3\}total.\{0,10\}'

