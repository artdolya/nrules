module "utilities" {
  source = "git::https://github.com/artdolya/terraform.git//tools"
}

provider "aws" {
  default_tags {
    tags = merge({
      TerraformVersion = module.utilities.terraform_version
      Created          = module.utilities.timestamp
      ProjectName      = "cact"
      Version          = var.APP_VERSION
      ManagedBy        = "Terraform"
    })
  }

  ignore_tags {
    keys = ["Created", "Version", "TerraformVersion"]
  }
}

provider "kubernetes" {
  host = var.KUBE_HOST

  client_certificate     = base64decode(var.KUBE_CLIENT_CERT_DATA)
  client_key             = base64decode(var.KUBE_CLIENT_KEY_DATA)
  cluster_ca_certificate = base64decode(var.KUBE_CLUSTER_CA_CERT_DATA)
  token                  = var.KUBE_TOKEN
}
