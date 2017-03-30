# Template for initial configuration bash script
data "template_file" "init" {
    template = "${file("${path.module}/../../../../user_data/${var.user_data_file}")}"

}
