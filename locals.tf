locals "team_members" {
    teams = {
        dev_team = "${var.tfe_user}-dev"
        ops_team = "${var.tfe_user}-ops"
        admin_team = "${var.tfe_user}"
    }
}