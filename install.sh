#!/usr/bin/env bash
for i in _*
do 
    source="${PWD}/$i"
    target="${HOME}/${i/_/.}"
#     if [ -h "${target}" -o -e "${target}" ]; then
#         echo "${target} already exists"       
#     else
        echo "Linking: ${target} -> ${source}"
        ln -sf ${source} ${target}
#    fi
done
