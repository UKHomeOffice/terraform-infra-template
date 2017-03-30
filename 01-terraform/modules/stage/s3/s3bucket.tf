resource "aws_s3_bucket" "bucket" {
    bucket = "${var.bucket_name}"
    acl = "private"
    versioning {
        enabled = "${var.enable_versioning}"
    }

    
   policy = "${file("${path.module}/../../../policies/${var.policy_file}")}" 

    tags {
        Name      = "${var.bucket_name}"
        project   = "${var.project}"
        CostGroup = "${var.CostGroup}"
    } 

}

