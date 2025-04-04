variable "resource_group_name" {
  type    = string
  default = "rg-azfuncapp"
}

variable "location" {
  type    = string
  default = "East US"
}

variable "storage_account_name" {
  type    = string
  default = "sa-azfuncapp"
}

variable "app_service_plan_name" {
  type    = string
  default = "appservplanazfunc"
}

variable "function_app_name" {
  type    = string
  default = "fa-azfuncapp"
}
