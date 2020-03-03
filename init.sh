#!/bin/bash

if [ $1 == 1 ]
then
    echo "create"
    ocamlc -c syntax.mli
    ocamlc -c syntax.ml
    ocamlc -c core.mli
    ocamlc -c core.ml
    ocamlc -c main.ml 
    ocamlc -o f syntax.cmo core.cmo main.cmo
else
    echo "remove"
    rm -f *cm* f
fi

