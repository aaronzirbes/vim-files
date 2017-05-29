#!/bin/bash

task="${1}"
run_class="${2}"
continuous='--continuous'

echo "Class: ${run_class}"
echo "Class: ${run_class}" 2>&1

# Test file
echo "INFO: Finding run class..."
file=`find . -name ${run_class}.groovy -or -name ${run_class}.java | head -n 1 | sed -E 's#^\./##'`

echo "Found file: ${file}"

if [ "${3}" == "debug" ]; then
    debug="-Dtest.debug=true"
fi

if [[ $file =~ ^src/(test|main)/(groovy|java).* ]]; then
    echo "INFO: Project is not a multi-project run."
else
    # Project
    project_folder=`echo ${file} |sed -e 's#/src/main/.*##' |sed -e 's#/src/test/.*##'`
    project=`echo ${project_folder} |sed -e 's#/#:#g' -e 's/^/:/'`
    echo "project_folder: ${project_folder}"
    echo "project: ${project}"

    if [ "${project}" != "" ]; then
        echo "INFO: Test lives in project: ${project}"
        task="${project}:${task}"
    else
        echo "INFO: Test lives in root project."
        task=${task}
    fi
fi

echo "gradle ${continuous} ${task} ${debug}"
gradle ${continuous} ${task} ${debug}

