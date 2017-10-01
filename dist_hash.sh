#!/bin/sh

# TODO: Adicione -not -path "*/node_modules/*" e use o diretório atual
# 'client' is the directory to look for modificatons

function calc_hash() {
(find client -type f -print0 | \
  sort -z | \
  xargs -0 sha1sum; \
 find client \( -type f -o -type d \) \
 -print0 | \
 sort -z | \
   xargs -0 stat -c '%n %a') \
| sha1sum
}

if [[ $(< scripts/hash.txt) != "$(calc_hash)" ]]; then
  echo "[dist_hash.sh] This is an old build"
  make ARGS="true" bundle || exit # If true build the project again with webpack
  calc_hash > scripts/hash.txt
else
  echo "[dist_hash.sh] This is a latest build"
fi