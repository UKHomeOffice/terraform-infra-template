Instructions on creating a new application stack.

In 01-terraform/aws/some_aws_account/env2/app-stack/

there is a file called 77_CREATE_NEW_APPSTACK.sh

There is a second of code as shown below.

# Link appstack specific components
    for tf_file in \
       env_appstack_elb.tf \
       env_appstack_sec_group.tf \
       env_appstack_gateway_ec2_instance.tf ;
    do
       ln -s "../../../LINKABLE_TF_FILES/"${tf_file} .
    done

To create you own stack with different servers or components. Create a file in the folder "01-terraform/aws/some_aws_account/env2/LINKABLE_TF_FILES/" which contains all your App stacks components. The reaosn why our script creats simlink to these files is so we can create multiples of this application stack in our jenkins job.

in "01-terraform/aws/some_aws_account/env2/LINKABLE_TF_FILES/env_appstack_gateway_ec2_instance.tf" shows an example of how we create a stand alone server

For each of your App stacks enviroments varable files "01-terraform/aws/some_aws_account/env2/dev/environment.tfvars" make sure the following references exit.

Example shown below.

app_ports = {
   feprx      	= "80"
   gateway      = "8080"
   rabbitmq  	  = "8081"
}
amis = {
   feprx        = "ami-405f7226"
   gateway      = "ami-405f7226"
   rabbitmq  	= "ami-405f7226"
}
number_of_instances = {
   feprx         = "3"
   gateway      = "1"
   rabbitmq  	= "1"
}
instance_types = {
   feprx         = "t2.medium"
   gateway      = "t2.medium"
   rabbitmq  	= "t2.medium"
}
extra_disk = {
   feprx        = "5"
   gateway      = "5"
   rabbitmq  	= "5"
}

in "env_appstack_sec_group.tf" file you will also need to update the security groups. for each server you making avaiable externally, you need to add the port to the security groups file.



