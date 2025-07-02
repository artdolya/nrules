locals {
  api_dev_vars = [
    for line in split("\n", var.API_DEV) :
    {
      name  = split("=", line)[0]
      value = join("=", slice(split("=", line), 1, length(split("=", line))))
    }
    if length(trimspace(line)) > 0 && can(split("=", line)[1])
  ]
}

resource "kubernetes_namespace" "rulesengine" {
  metadata {
    name = "rulesengine-dev"
  }
}

module "mynginx" {
  source      = "git::https://github.com/artdolya/terraform.git//modules/kubernetes"
  name        = "mynginx"
  image       = "nginx"
  namespace   = kubernetes_namespace.rulesengine.metadata[0].name
  env_vars    = local.api_dev_vars
  port        = 80
  target_port = 800
}

output "mynginx_env_vars" {
  value = module.mynginx
}
