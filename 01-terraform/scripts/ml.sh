#!/bin/bash

DIRECTORY=`pwd`

account=BLAH

cd $DIRECTORY/../aws/$ACCOUNT/

for VPC in */ ; do
   cd $VPC/
 
   echo $VPC
 
   for env in */ ; do
     cd $env/

     echo $env

     for component in */ ; do

         cd $component

         echo runnung 0-CONFIGURE.sh for Env: $env and component $component

         echo `pwd`/0-CONFIGURE

     done
     cd ..
   done
   cd ..
done
