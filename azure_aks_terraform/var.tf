variable "rgname" {
  type = string
  description = "resource group name"
}
variable "location" {
    type = string
    default = "Central India"  
}
variable "cluster_name" {
  type = string
}
variable "node_pool_name" {
  type = string
}
variable "k8_version" {
  type = string
  default = "1.29.7"
}
variable "node_count" {
  type = number
  default = 1
}
variable "vm_size" {
  type = string
  default = "standard_d2as_v4"
}