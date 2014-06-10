#!/bin/bash

# Get the upstream remote

mega_repo="git@github.com:bloomhealth/bloomhealth.git"
test_class="${1}"

upstream=`git remote -v |grep 'upstream.*\(push\)' |cut -f2 |sed -e 's/ .*//'`
if [ "${upstream}" == "${mega_repo}" ]; then
    # Gradle build

    # Test file
    file=`find . -name ${test_class}.groovy | head -n 1 | sed -E 's#^\./##'`

    if [ "${2}" == "debug" ]; then
        debug="-Dtest.debug=true"
    fi

    # Phase
    echo "Determining test phase for ${file}"
    phase="test"
    if ( echo "${file}" |grep -q -E '(plugins|webapps)/.*/test/unit'); then
        phase="grailsTestUnit"
    elif ( echo "${file}" | grep -q -E '(plugins|webapps)/.*/test/integration'); then
        phase="grailsTestIntegration"
    fi

    # Project
    if [[ ${file} == plugins* ]] || [[ ${file} == webapps* ]]; then
        project=`echo ${file} |sed -e 's#/test/.*##'`
    else
        project=`echo ${file} |sed -e 's#/src/test/.*##'`
    fi

    echo "gradle -p ${project} -Dtest.single=${test_class} ${phase}"
    gradle -p ${project} -Dtest.reportFormat=html,xml -Dtest.single=${test_class} ${phase} ${debug}

    find ${project}/build -name "*${test_class}.xml"

else
    phase="integration"
    file=`find test/unit -name ${test_class}.groovy`
    if [ "$file" != "" ]; then
        phase="unit"
    fi

    # Normal Grails stuff
    echo "grails -Duser.timezone=UTC test-app ${phase}: ${test_class}"
    grails -Duser.timezone=UTC test-app ${phase}: ${test_class}
fi
