#!/bin/bash

./0-TF-CONFIGURE.sh

source ./GLOBAL_VARIABLES.sh

${TERRAFORM} get

if [ $# == 1 ] && [ $1 == "-force" ]; then
    ${TERRAFORM} destroy -force \
          -var "branch=${BRANCH}" \
          -var "track=${TRACK}" \
          -var-file="./environment.tfvars"
else
    ${TERRAFORM} destroy \
          -var "branch=${BRANCH}" \
          -var "track=${TRACK}" \
          -var-file="./environment.tfvars"
fi
