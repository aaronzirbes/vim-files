#!/bin/bash

# Get the upstream remote

mega_repo="git@github.com:bloomhealth/bloomhealth.git"
test_class="${1}"

echo 'Checking upstream remote...'
upstream=`git remote -v |grep 'upstream.*\(push\)' |cut -f2 |sed -e 's/ .*//'`
echo "Found ${upstream}."
if [ "${upstream}" == "${mega_repo}" ]; then
    # Gradle build
    echo "Detected bloom Mecca-Repo!"

    # Test file
    file=`find . -name ${test_class}.groovy`

    # Phase
    phase="build"

    # Project
    if [[ ${file} == plugins* ]] || [[ ${file} == webapps* ]]; then
        project=`echo ${file} |sed -e 's#/test/.*##' |sed -e 's#/grails-app/.*##' |sed -e 's#/src/.*##'`
    else
        project=`echo ${file} |sed -e 's#/src/main/.*##' |sed -e 's#/src/test/.*##'`
    fi

    # http://stackoverflow.com/questions/3618078/pipe-only-stderr-through-a-filter
    # The magic here:
    #     3>&1 1>&2 2>&3 3>&- 
    # swaps std err and std out

    root=`pwd -P`

    echo "gradle -p ${project} ${phase}"
    gradle -p ${project} ${phase} \
        |sed -e '/UP-TO-DATE/d' -e '/SKIPPED/d' 3>&1 1>&2 2>&3 3>&- \
        |sed \
            -e "s#${root}/[a-zA-Z0-9\/\.\-]*/#''&''#" \
            -e "s#${root}/##"

else
    echo "Assuming grails build."
    # Grails Build
    phase="package"

    # Normal Grails stuff
    echo "grails -Duser.timezone=UTC package"
    grails -Duser.timezone=UTC ${phase}
fi

