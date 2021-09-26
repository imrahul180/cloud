
module "iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 5.0"

  projects = ops-rahul-kumar

  bindings = {
    "roles/logging.logWriter" = [
      "serviceAccount:<svc acount will go here>.iam.gserviceaccount.com",
    ]

    "roles/monitoring.metricWriter" = [
      "serviceAccount:<svc account will go here>.iam.gserviceaccount.com",
    ]

  }
}
