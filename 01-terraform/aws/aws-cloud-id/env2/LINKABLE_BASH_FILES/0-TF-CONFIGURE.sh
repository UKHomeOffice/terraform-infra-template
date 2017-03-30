#!/bin/bash

source ./GLOBAL_VARIABLES.sh

echo "CONFIGURING STATE_FILE:	${STATE_FILE_LOCATION}"
echo

${TERRAFORM} remote config \
            -backend=s3 \
            -backend-config="bucket=${STATEFILE_BUCKET}" \
            -backend-config="key=${STATE_FILE_LOCATION}" \
            -backend-config="region=${AWS_REGION}" \
            -backend-config="profile=${ENVIRONMENT_PROFILE}"

