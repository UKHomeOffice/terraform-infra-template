#!/bin/bash

TF_VERSION=0.8.5

AWS_REGION=eu-west-1

VPC_ENV=env2

STATEFILE_BUCKET=terraform_state_location_key

STATEFILE_KEY_PREFIX="terraform_state_location_key"

ENVIRONMENT_PROFILE=aws-cloud-id

STORAGE_PROFILE=S3Storage

BRANCH=NA
TRACK=NA

# ==================================================
#  Find the system architecture
#  Needed to call the right terraform binary
# ==================================================

OSTYPE=`uname | tr [:upper:] [:lower:]`
ARCHITECTURE=`uname -m`
TERRAFORM_BIN=terraform-${TF_VERSION}.${OSTYPE}.${ARCHITECTURE}




# ====================================================
#  Find out if we are running inside AWS - use IAM
# ====================================================
AWS_DOMAIN_SUFFIX=env2.vpc.internal
RUNNING_HOST=`hostname -f`

if [ "${RUNNING_HOST/$AWS_DOMAIN_SUFFIX}" = "${RUNNING_HOST}" ] ; then
  echo INSIDE_AWS=false
else
  echo INSIDE_AWS=true
fi



# ==================================================
#  PLAY A LITTLE TRICK HERE 
#  Find out where the script is being run from
#    * Set the Terraform State file 
#    * Set the brach/track
# ==================================================
LOCATION=`pwd -P`
LAYER_1=`basename $LOCATION`

LAYER2_DIR=`dirname $LOCATION`
LAYER_2=`basename $LAYER2_DIR`

LAYER3_DIR=`dirname $LAYER2_DIR`
LAYER_3=`basename $LAYER3_DIR`

echo
echo "====================================================================================="
echo "WORKDIR:	$LOCATION"
echo "COMPONENT:	$LAYER_1"
echo "LAYER_2:	$LAYER_2"
echo "LAYER_3:	$LAYER_3"
echo "VPC_ENV:	$VPC_ENV"

if [ ${LAYER_3} == ${VPC_ENV} ]; then
   STATE_FILE_LOCATION=${STATEFILE_KEY_PREFIX}/vpc-${VPC_ENV}/${LAYER_2}/${LAYER_1}/terraform.tfstate
   TERRAFORM="../../../../../bin/${TERRAFORM_BIN}"
   if [ ${INSIDE_AWS} ] ; then
      echo Running inside AWS - using IAM provider
      rm provider.tf && ln -s ../../LINKABLE_TF_FILES/provider_iamrole.tf .
    fi
else
   STATE_FILE_LOCATION=${STATEFILE_KEY_PREFIX}/vpc-${VPC_ENV}/${LAYER_3}/${LAYER_2}/${LAYER_1}/terraform.tfstate
   BRANCH=`echo ${LAYER_1} | cut -d - -f1`
   TRACK=`echo ${LAYER_1}  | cut -d - -f2`
   TERRAFORM="../../../../../../bin/${TERRAFORM_BIN}"
   if [ ${INSIDE_AWS} ] ; then
      echo Running inside AWS - using IAM provider
      rm provider.tf && ln -s ../../../LINKABLE_TF_FILES/provider_iamrole.tf .
    fi
fi

echo "BRANCH:		${BRANCH}"
echo "TRACK:		${TRACK}"
echo "====================================================================================="
echo 

echo "TERRAFORM:	${TERRAFORM}"
${TERRAFORM} -version
echo 
