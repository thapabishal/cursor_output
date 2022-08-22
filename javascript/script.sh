#!/bin/bash

set -e

current_path=`pwd`
echo ${current_path}

j_directory_path=`echo ${1} | awk -F '/' -v OFS='/' '{$NF=""; print $0}' `

j_file=`echo ${1} | awk -F '/' '{print $NF}'` 

script_dir=`cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd`

cd ${j_directory_path}

# Run and write result
node ${j_file} > ${script_dir}/output.txt 2>&1

