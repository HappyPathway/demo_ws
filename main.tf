//--------------------------------------------------------------------
// Modules
variable "vault_token" {}
variable "vault_addr" {}
variable "oauth_token" {}
variable "github_org" {}
variable "oauth_token" {}
variable "organization" {}
variable "repo_name" {}


module "demo_workspace" {
  source  = "app.terraform.io/Darnold-Hashicorp/demo-workspace/tfe"
  version = "1.0.1"

  github_org = "${var.github_org}"
  oauth_token = "${var.oauth_token}"
  organization = "${var.organization}"
  repo_name = "${var.repo_name}"
  aws_vars = true
  azure_vars = false
	vault_vars = true
  vault_addr = "${var.vault_addr}"
  vault_token = "${var.vault_token}"
}
