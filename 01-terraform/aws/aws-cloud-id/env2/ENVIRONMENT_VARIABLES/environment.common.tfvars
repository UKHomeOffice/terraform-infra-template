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
env       = "common"
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
   feprx         = 80
   srvprx       = 80
}
amis = {
   standard      = "ami-405f7226"
   jumpbox       = "ami-405f7226"
   vault         = "ami-405f7226"
   jenkins       = "ami-405f7226"
   iprx          = "ami-405f7226"
   srvprx        = "ami-405f7226"
   zabbix        = "ami-405f7226"
}
number_of_instances = {
   jumpbox       = "3"
   vault         = "1"
   jenkins       = "1"
   jenkins_slave = "3"
   iprx          = "3"
   srvprx       = "3"
   zabbix        = "1"
}
instance_types = {
   jumpbox       = "t2.nano"
   vault         = "t2.medium"
   jenkins       = "m4.xlarge"
   iprx          = "t2.medium"
   srvprx       = "t2.micro"
   zabbix        = "m4.large"
}
extra_disk = {
   jumpbox       = "3"
   vault         = "3"
   jenkins       = "30"
   iprx          = "5"
   srvprx       = "5"
   zabbix        = "5"
}

number_of_permanent_ips= "3"

application_subnets = [ "10.0/24","20.0/24","30.0/24" ]
