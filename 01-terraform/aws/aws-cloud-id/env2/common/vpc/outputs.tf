output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnet_ids" {
  value = [ "${module.vpc.public_subnet_ids}" ]
}

output "services_subnet_ids" {
  value = [ "${module.vpc.services_subnet_ids}" ]
}

output "rds_subnet_ids" {
  value = [ "${module.vpc.rds_subnet_ids}" ]
}

output "internal_zone_id" {
  value = "${module.vpc.internal_zone_id}"
}

output "route_nat_ids" {
  value = [ "${module.vpc.route_nat_ids}" ]
}

output "rds_sng_name" {
  value = [ "${module.vpc.rds_sng_name}" ]
}

output "vpc_enpoint_id" {
  value = [ "${module.vpc.vpc_endpoint_id}" ]
}
