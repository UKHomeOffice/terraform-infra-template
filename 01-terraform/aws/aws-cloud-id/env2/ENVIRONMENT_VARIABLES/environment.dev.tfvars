# GLOBAL VARIABLES FOR THE ACCOUNT
aws_region           = "eu-west-1"

aws_profile          = "aws-cloud-id"
aws_bucket           = "aws-bucket-name"

statefile_key_prefix = "terraform_state_location_key"

route53_main         = "example.io"
route53_main_zone_id = "XXXXXXXXXXXXXX"

ssl_certificate_arn  = "arn:aws:acm:eu-west-1:XXXXXXXXXXXX:certificate/XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"

# Module versions to use
modversion           = "stage"

providers_key_prefix = "terraform_state_location_key"

# ======================
#   Tagging and Naming
# ======================
env       = "dev"
vpc_env   = "env2"
project   = "example"
CostGroup = "payers name"
Owner     = "owners name"

# ========================
#  Network and High Avail
# ========================
cidr_prefix          = "10.1"
number_of_zones      = "3"

# =================================
#  Environment master SSH key
# =================================
ssh_key_name   = "keyname-env2"
ssh_access_key = "SSH-key here"



# ============================
# SPECIFIC SETTINGS
# ============================
app_ports = {
   feprx      	= "80"
   gateway      = "8080"
   rabbitmq  	= "8081"
}
amis = {
   feprx        = "ami-405f7226"
   gateway      = "ami-405f7226"
   rabbitmq  	= "ami-405f7226"
}
number_of_instances = {
   feprx        = "3"
   gateway      = "1"
   rabbitmq  	= "1"
}
instance_types = {
   feprx        = "t2.medium"
   gateway      = "t2.medium"
   rabbitmq  	= "t2.medium"
}
extra_disk = {
   feprx        = "5"
   gateway      = "5"
   rabbitmq  	= "5"
}

application_subnets = [ "11.0/24","21.0/24","31.0/24" ]
