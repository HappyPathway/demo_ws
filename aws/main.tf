resource "tfe_variable" "instance_name" {
  key = "instance_name"
  value = "${var.instance_name}"
  category = "terraform"
  workspace_id = "${var.workspace_id}"
}

resource "tfe_variable" "instance_type" {
  key = "instance_type"
  value = "${var.instance_type}"
  category = "terraform"
  workspace_id = "${var.workspace_id}"
}

resource "tfe_variable" "key_name" {
  key = "key_name"
  value = "${var.key_name}"
  category = "terraform"
  workspace_id = "${var.workspace_id}"
}