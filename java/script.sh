#!/bin/bash

set -e

j_directory_path=`echo ${1} | awk -F '/' -v OFS='/' '{$NF=""; print $0}' `

j_file=`echo ${1} | awk -F '/' '{print $NF}' | sed 's/.java//'` 

script_dir=`cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd`

# Compile and write result
javac ${1} > ${script_dir}/output.txt 2>&1

# Run and wirte result
java -cp ${j_directory_path} ${j_file} >> ${script_dir}/output.txt 2>&1

