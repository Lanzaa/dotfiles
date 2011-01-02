#!/usr/bin/env bash

link () {
    count=$((count + 1))
    echo "Linking: $1 -> $2"
    ln -sf ${source} ${target}
}

nolink () {
    echo "Not Linking: $1"
}

count=$((0))

for i in _*
do 
    source="${PWD}/$i"
    target="${HOME}/${i/_/.}"
    if [ -h "${target}" ]; then
        # Find out where it links to
        current="$(readlink ${target})"
        if [ "${current}" == "${source}" ]; then
            nolink ${target}
        else
            link ${target} ${source}
        fi
    else
        link ${target} ${source}
    fi
done

echo "Relinked ${count} file(s)."
