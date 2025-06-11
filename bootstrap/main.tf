module "kind_cluster" {
  source = "github.com/den-vasyliev/tf-kind-cluster"
}

module "flux_bootstrap" {
  source = "github.com/den-vasyliev/tf-fluxcd-flux-bootstrap"
  github_repository = "${var.github_org}/${var.github_repository}"
  private_key = module.tls_private_key.private_key_pem
  # config_path = module.kind_cluster.kubeconfig
  github_token = var.github_token
}

module "tls_private_key"{ 
  source = "github.com/den-vasyliev/tf-hashicorp-tls-keys"
  algorithm = "RSA"
}

module "github_repository" {
    source = "github.com/den-vasyliev/tf-github-repository"
    github_owner = var.github_org
    github_token = var.github_token
    repository_name = var.github_repository
    public_key_openssh = module.tls_private_key.public_key_openssh
    public_key_openssh_title = "flux0"
}