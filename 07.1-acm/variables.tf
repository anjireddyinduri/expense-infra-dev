
variable "project_name" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "common_tags" {
  default = {
    Project = "expense"
    Environment = "dev"
    Terraform = "true"
    Component = "app-alb"
  }
}

variable "zone_name" {
  default = "daws78ss.cloud"
}

variable "zone_id" {
  default = "Z08557603N7CT2N86ZSA"
}
