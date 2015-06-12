#!/bin/bash

test_class="${1}"
phase="test"

echo "Test class: ${test_class}"

if [ -e pom.xml ]; then
    echo "mvn test -Dtest=${test_class}"
    mvn test -Dtest=${test_class}
else
    # Test file
    echo "Finding test class..."
    file=`find . -name ${test_class}.groovy -or -name ${test_class}.java | head -n 1 | sed -E 's#^\./##'`


    echo "Found file: ${file}"

    if [ "${2}" == "debug" ]; then
        debug="-Dtest.debug=true"
    fi

    if [[ $file == src/test/groovy* ]]; then
        echo "Project is not a multi-project build."
    else
        # Project
        project=`echo ${file} |sed -e 's#/src/test/.*##'`

        dash_p=""
        if [ "${project}" != "" ]; then
            echo "Test lives in project: ${project}"
            dash_p="-p ${project}"
        else
            echo "Test lives in root project."
            project='.'
        fi
    fi

    echo "gradle ${dash_p} -Dtest.single=${test_class} ${phase}"
    gradle ${dash_p} -Dtest.reportFormat=html,xml -Dtest.single=${test_class} ${phase} ${debug}

    find ${project}/build -name "*${test_class}.xml"
fi
