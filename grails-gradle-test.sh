#!/bin/bash

# Get the upstream remote

mega_repo="git@github.com:bloomhealth/bloomhealth.git"

upstream=`git remote -v |grep 'upstream.*\(push\)' |cut -f2 |sed -e 's/ .*//'`
if [ "${upstream}" == "${mega_repo}" ]; then
    # Gradle build

    # Test file
    file=`find . -name $1.groovy`

    # Phase
    phase="test"
    if ( echo "${file}" |grep -q -E '(bloom-domain|consumer)/test/unit'); then
        phase="grailsTestUnit"
    elif ( echo "${file}" | grep -q -E '(bloom-domain|consumer)/test/integration'); then
        phase="grailsTestIntegration"
    fi

    # Project
    project=`echo ${file} | awk -F / '{print $2 "/" $3 }'`

    echo "gradle -p ${project} -Dtest.single=${1} ${phase}"
    gradle -p ${project} -Dtest.single=${1} ${phase}

else
    phase="integration"
    file=`find test/unit -name $1.groovy`
    if [ "$file" != "" ]; then
        phase="unit"
    fi

    # Normal Grails stuff
    echo "grails -Duser.timezone=UTC test-app ${phase}: ${1}"
    grails -Duser.timezone=UTC test-app ${phase}: ${1}
fi
