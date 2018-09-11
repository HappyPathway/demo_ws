//--------------------------------------------------------------------
// Variables
variable "instance_name" {}
variable "instance_type" {}
variable "key_name" {}

//--------------------------------------------------------------------
// Modules
module "ec2_instance" {
	source  = "git::https://github.com/HappyPathway/terraform-aws-ec2-instance"
  version = "2.1.0"

  instance_name = "${var.instance_name}"
  instance_type = "${var.instance_type}"
  key_name = "${var.key_name}"
}

output "instance_id" {
  value = "${module.ec2_instance.instance_id}"
}

output "public_ip_address" {
  value = "${module.ec2_instance.public_ip_address}"
}

output "key_name" {
  value = "${module.ec2_instance.key_name}"
}

output "availability_zone" {
  value = "${module.ec2_instance.availability_zone}"
}
