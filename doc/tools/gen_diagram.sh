#!/bin/sh

#
# Requires the pyreverse command, included in the pylint package.
# Requires the dot command, included in the graphviz package.
#

DIR=pyreverse_diagram

if [ ! -d "src" ] ; then
	echo "Run this from the top of the source tree, i.e. in the parent of src."
	exit 1
fi

if [ -z "$(which pyreverse 2>/dev/null || :)" ] ; then
	echo "Can't find the pyreverse program"
	exit 1
fi

if [ "$1" != "-u" ] ; then
	(
		[ -d "$DIR" ] || mkdir "$DIR"
		rm -f "$DIR"/*
		cd src
		pyreverse --project="s2" *.py model/*.py model/service/*.py model/os/*.py
		mv *.dot ../"$DIR"
	)
fi

cd src
cat ../"$DIR"/classes_s2.dot | 
	sed ' s/: NoneType//g' | 
	dot -Tpng > ../"$DIR"/s2-class-diagram.png
