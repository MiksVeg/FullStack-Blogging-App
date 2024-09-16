resource "azurerm_resource_group" "rg1" {
    name = var.rgname
    location = var.location
}
resource "azurerm_kubernetes_cluster" "aks" {
  name = var.cluster_name
  kubernetes_version = var.k8_version
  location = var.location
  resource_group_name = var.rgname
  dns_prefix = var.cluster_name
  default_node_pool {
    name = var.node_pool_name
    node_count = var.node_count
    vm_size = var.vm_size
  }
  identity {
    type = "SystemAssigned"
  }
}
