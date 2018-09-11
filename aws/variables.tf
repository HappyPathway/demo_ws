variable "instance_name" {
  type = "string"
  default = "EC2Demo"
  description = "name of ec2 instance. Instance will be tagged with this name"
}

variable "instance_type" {
  default = "m4.large"
  description = "AWS EC2 Instance Type"
  type = "string"
}

variable "key_name" {
  type = "string"
  description = "Name of AWS Key Pair"
}

variable "public_key" {
  type = "string"
  default = "~/.ssh/id_rsa.pub"
  description = "Path to public key for AWS Key Pair"
}

variable "workspace_id" {
  type = "string"
  description = "ID of TFE Workspace"
}
