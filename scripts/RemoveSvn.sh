#!/bin/bash
#
############

LAUNCH_DIR=$PWD

for SVN_DIR in $( find . -type d -name ".svn"  )
do
   echo "$SVN_DIR"
   rm -rf "$SVN_DIR"
done
