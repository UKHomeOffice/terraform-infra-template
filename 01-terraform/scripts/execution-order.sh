#!/bin/bash
# This file contains the list of terraform scripts to be run in the order they are to be run in.
# The list of scripts have been broken into two parts, 1 BASE and 2 OTHERS.  The purpose of BASE
# is to contain all the terraform scripts

# It 
#permanent/s3buckets
BASE=$(cat <<'EOL'
    permanent/eip.out
EOL
)

COMMON=$(cat <<'EOL'
    common/vpc
    common/sec-groups
    common/whitelist-sec-groups
    common/ssh-keys
    common/iam
    common/elb
    common/shared_components/prx-live
    common/shared_components/jb-live
EOL
)

DEV=$(cat <<'EOL'
    dev/sec-groups
    dev/whitelist-sec-groups
    dev/subnets
    dev/elb
    dev/shared-components/proxies-live
EOL
)

BASE_DIR="$(pwd)$(dirname $0)"
BASE_DIR=$(echo ${BASE_DIR} | sed 's/\.//')
BASE_DIR=$(echo ${BASE_DIR} | sed 's/scripts$//')
BASE_DIR=$(echo ${BASE_DIR} | sed 's/\/$//')

