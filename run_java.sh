#!/bin/bash

set -e

_java_class="${1}.java"
_java_result=`javac $_java_class | java $1 > output.txt`


