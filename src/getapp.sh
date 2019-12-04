#!/bin/bash

usage="
USAGE: $0 destination-path
"

if [ "$1" == "" ];then
    echo "$usage"
    exit 1
fi
destination="$1"

if [ ! -d "$destination" ];then
    mkdir -p "$destination"
fi

pushd "$destination"

gitrepolist="
https://github.com/NicoPillon/MetaMEx
https://bitbucket.org/scilifelab-lts/shiny-apps-scrnaseq
https://github.com/royfrancis/nametagger
https://github.com/royfrancis/pophelperShiny
https://github.com/royfrancis/zage
"

for repo in $gitrepolist; do
    git clone $repo
done

echo "shiny apps have been downloaded to $destination"

popd
