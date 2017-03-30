# JUMPBOXES
resource "aws_instance" "instance" {
    ami                 = "${var.ami}"
    instance_type       = "${var.instance_type}"

    subnet_id              = "${element(var.subnets,count.index)}"
    vpc_security_group_ids = [ "${var.security_group_ids}" ]

    associate_public_ip_address = "${var.public_ip}"

    iam_instance_profile   = "${var.instance_profile}"

    key_name = "${var.ssh_key_name}"

    user_data = "${data.template_file.init.rendered}"

    tags {
        Name = "${var.role}${count.index}-${var.branch}-${var.track}-${var.env}-${var.vpc_env}"
        project = "${var.project}"
        env = "${var.env}"
        vpc = "${var.vpc_env}"
        role = "${var.role}"
        branch = "${var.branch}"
        track = "${var.track}"
        CostCentre = "${var.CostGroup}"
    }
    count = "${var.number_of_instances}"
}


# EBS Extra Disk comissioning
resource "aws_ebs_volume" "example" {
    availability_zone = "${var.aws_region}${element(var.zones,count.index)}"
    size              = "${var.extra_disk_size}"
    count             = "${var.number_of_instances}"
    encrypted         = true
    tags {
        Name = "${var.role}${count.index}-${var.branch}-${var.track}-${var.env}-${var.vpc_env}"
        project = "${var.project}"
        env = "${var.env}"
        vpc = "${var.vpc_env}"
        role = "${var.role}"
        branch = "${var.branch}"
        track = "${var.track}"
        CostCentre = "${var.CostGroup}"
    }
}

resource "aws_volume_attachment" "disk_attachment" {
  device_name = "/dev/sdh"
  volume_id = "${element(aws_ebs_volume.example.*.id,count.index)}"
  instance_id = "${element(aws_instance.instance.*.id,count.index)}"
  count = "${var.number_of_instances}"
}
