#!/bin/bash

test_class="${1}"
phase="test"
continuous='--continuous'
clean=""

# -p ./micro-services/task-manager test --tests com.tgt.warehouse.task.AssignTaskSpec

echo "Test class: ${test_class}"
echo "Test class: ${test_class}" 2>&1

if [ -e pom.xml ]; then
    echo "mvn test -Dtest=${test_class}"
    mvn test -Dtest=${test_class}
else
    # Test file
    echo "INFO: Finding test class..."
    file=`find . -name ${test_class}.groovy -or -name ${test_class}.java | head -n 1 | sed -E 's#^\./##'`

    if [[ "$file" =~ \/test\/integration\/ ]]; then
        echo "INFO: Integration test detected"
        phase=integrationTest
        continuous=''
        clean='clean'
    fi

    echo "Found file: ${file}"

    if [ "${2}" == "debug" ]; then
        debug="-Dtest.debug=true"
    fi


    if [[ $file == src/test/groovy* ]]; then
        echo "INFO: Project is not a multi-project build."
    else
        dash_project=""
        # Project
        project_folder=`echo ${file} |sed -e 's#/src/test/.*##'`
        project=`echo ${project_folder} |sed -e 's#/#:#g'`

        if [ "${project}" != "" ]; then
            echo "INFO: Test lives in project: ${project}"
            single_opt="${project}:${phase}.single"
            task="${project}:${phase}"
            dash_project="-p ${project_folder}"
        else
            echo "INFO: Test lives in root project."
            project_folder='.'
            task=${phase}
        fi
    fi

    # gradle -Dmicro-services:dci-osn-bridge:test.single=OsnCreateServiceSpec :micro-services:dci-osn-bridge:test

    #echo "gradle -D${single_opt}=${test_class} ${task}"
    #gradle ${continuous} -Dtest.reportFormat=html,xml -D${single_opt}=${test_class} ${clean} ${task} ${debug}
    #  gradle -p ... test --tests com.tgt.warehouse.task.AssignTaskSpec
    echo "gradle ${continuous} ${dash_project} -Dtest.reportFormat=html,xml ${phase} --tests "*${test_class}" ${clean} ${debug}"
    gradle -d ${continuous} ${dash_project} --info -Dtest.reportFormat=html,xml ${phase} --tests "*${test_class}" ${clean} ${debug}

    find ${project_folder}/build -name "*${test_class}.xml"
fi
