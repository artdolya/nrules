variable "KUBE_HOST" {
  type        = string
  description = "server"
}

variable "KUBE_CLIENT_CERT_DATA" {
  type        = string
  description = "client-certificate-data"
}

variable "KUBE_CLIENT_KEY_DATA" {
  type        = string
  description = "client-key-data"
}

variable "KUBE_CLUSTER_CA_CERT_DATA" {
  type        = string
  description = "certificate-authority-data"
}

variable "KUBE_TOKEN" {
  type        = string
  description = "token"
}

variable "APP_VERSION" {
  type    = string
  default = "0.0.0"
}

variable "API_DEV" {
  type    = string
  default = ""
}
