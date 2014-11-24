#!/bin/bash

test_class="${1}"
phase="test"

# Test file
file=`find . -name ${test_class}.groovy | head -n 1 | sed -E 's#^\./##'`

if [ "${2}" == "debug" ]; then
    debug="-Dtest.debug=true"
fi

# Project
project=`echo ${file} |sed -e 's#/src/test/.*##'`

echo "gradle -p ${project} -Dtest.single=${test_class} ${phase}"
gradle -p ${project} -Dtest.reportFormat=html,xml -Dtest.single=${test_class} ${phase} ${debug}

find ${project}/build -name "*${test_class}.xml"
