#!/bin/sh

source="/home/rubin/Source/Projects/Session"
target="/home/rubin/Desktop/session-release"
name="session"
version="`session version | cut -d " "  -f 2 | cut -d "," -f 1`"
platforms="linux macosx windows"

for platform in $platforms; do
    mkdir -p "$target/$name-$version-$platform"
    cp -r "$source/doc" "$target/$name-$version-$platform/doc"
    rm -rf "$target/$name-$version-$platform/doc/.svn"
    cp -r "$source/sys/example" "$target/$name-$version-$platform/doc/example-sys-entry"
    rm -rf "$target/$name-$version-$platform/doc/example-sys-entry/.svn"
    rm -rf "$target/$name-$version-$platform/doc/install-*" 
    cp -r "$source/tpl" "$target/$name-$version-$platform/tpl"
    rm -rf "$target/$name-$version-$platform/tpl/.svn"
    cp "$source/src/session-$platform.sh" "$target/$name-$version-$platform"
    cp "$source/doc/install-$platform.txt" "$target/$name-$version-$platform"
    cd "$target"
    zip -r "$name-$version-$platform.zip" "$name-$version-$platform"
    cd -
    rm -rf "$target/$name-$version-$platform"
done
