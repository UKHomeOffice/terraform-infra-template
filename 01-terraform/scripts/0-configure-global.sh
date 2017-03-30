#!/bin/bash

########### Setup Terraform for all scripts ##############

TF_VERSION=0.8.5
OSTYPE=`uname | tr [:upper:] [:lower:]`
ARCHITECTURE=`uname -m`
TERRAFORM_BIN=terraform-${TF_VERSION}.${OSTYPE}.${ARCHITECTURE}

TERRAFORM="../../../../../bin/${TERRAFORM_BIN}"

echo "TERRAFORM:    ${TERRAFORM}"
${TERRAFORM} -version
echo 

########### Setup Terraform for all scripts ##############

source "$(dirname $0)/execution-order.sh"

function usage() {
    echo "usage: $0 [-r REGION] [-p AWS_PROFILE] [-b S3_BUCKET] [-e ENVIRONMENT] section"
    echo "       section must be one of:"
    echo "           DEV"
    echo "           TEST"
    echo "           PERFORMANCE"
}

while getopts "hr:p:b:e:" OPTION; do
    case "${OPTION}" in
        r)
            REGION="${OPTARG}"
            ;;
        p)
            PROFILE="${OPTARG}"
            ;;
        b)
            BUCKET="${OPTARG}"
            ;;
        e)
            ENV="${OPTARG}"
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
shift $((OPTIND-1))

REGION=${REGION:-eu-west-1}
PROFILE=${PROFILE:-aws-cloud-id}
BUCKET=${BUCKET:-aws-bucket-name}
ENV=${ENV:-env2}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
elif [ "${1}" == "TEST" ] || [ "${1}" == "DEV" ] || [ "${1}" == "PERFORMANCE" ] ; then
    SECTION="${1}"
else
    usage
    exit 1
fi


OLD_PWD=$(pwd)

EXECUTION_PARTS=$(echo -e "${BASE}\n${COMMON}\n${!SECTION}")

for part in ${EXECUTION_PARTS}; do

    echo "****************************************"
    echo "****************************************"
    echo "${BASE_DIR}/aws/${PROFILE}/${ENV}/${part}"
    SECTION=$(dirname ${part})
    COMPONENT=$(basename ${part})
    cd "${BASE_DIR}/aws/${PROFILE}/${ENV}/${part}"

    bash 0-TF-CONFIGURE.sh
    
    echo -e "providers-common-np/aws/vpc-env2/${SECTION}/${COMPONENT}/terraform.tfstate\n\n"
    cd ${OLD_PWD}

done

