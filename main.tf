//--------------------------------------------------------------------
// Modules
variable "vault_token" {}
variable "vault_addr" {}
variable "oauth_token" {}
variable "github_org" {}
variable "organization" {}
variable "repo_name" {}


module "demo_workspace" {
  source  = "app.terraform.io/Darnold-Hashicorp/demo-workspace/tfe"
  version = "1.2.0"

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

module "admin_team" {
    organization = "${var.organization}"
    team_name = "${var.organization}-admin"
    source = "./modules/teams"
    workspace_ids = [
        "${var.workspace_id}"
    ]
    team_permissions = "admin"
    members = "${local.teams.admin_team}"
}

module "ops_team" {
    organization = "${var.organization}"
    team_name = "${var.organization}-ops"
    source = "./modules/teams"
    workspace_ids = [
        "${var.workspace_id}"
    ]
    team_permissions = "write"
    members = "${local.teams.ops_team}"
}

module "dev_team" {
    organization = "${var.organization}"
    team_name = "${var.organization}-dev"
    source = "./modules/teams"
    workspace_ids = [
        "${var.workspace_id}"
    ]
    team_permissions = "read"
    members = "${local.teams.dev_team}"
}

output "workspace_id" {
  value = "${module.demo_workspace.workspace_id}"
}

output "tfe_workspace_url" {
  value = "https://app.terraform.io/app/${var.organization}/${var.repo_name}"
}

output "github_repo" {
	value = "https://github.com/${var.github_org}/${var.repo_name}.git"
}
