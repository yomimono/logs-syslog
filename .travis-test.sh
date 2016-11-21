#!/bin/sh -x

export OPAMYES=1
eval `opam config env`
opam pin add -n mirage https://github.com/hannesm/mirage.git#no-opam
opam pin add -n functoria https://github.com/hannesm/functoria.git#no-opam
opam install mirage
cd example
mirage configure -t unix
make depend
make
