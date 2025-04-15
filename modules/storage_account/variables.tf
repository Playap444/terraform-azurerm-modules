variable "environment" {
  type = string
}
variable "location" {
  type = string
}
variable "product" {
  type = string
}
variable "is_terraform" {
  type = bool
}
variable "rg_name" {
  type = string
}
variable "replication_type" {
  type    = string
  default = "LRS"
}