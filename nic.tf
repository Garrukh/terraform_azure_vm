resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
  location            = var.location

  dns_servers                   = var.dns_servers
  enable_ip_forwarding          = var.enable_ip_forwarding
  enable_accelerated_networking = var.enable_accelerated_networking
  internal_dns_name_label       = var.internal_dns_name_label


  ip_configuration {
    name                          = var.ip_configuration_name
    private_ip_address_version    = var.private_ip_address_version != null ? var.private_ip_address_version : var.public_ip_address_version
    private_ip_address_allocation = var.private_ip_allocation_method != null ? var.private_ip_allocation_method : var.public_ip_allocation_method
    private_ip_address            = var.private_ip_address
    subnet_id                     = var.subnet_id
    public_ip_address_id          = var.create_public_ip ? azurerm_public_ip.public_ip[0].id : null
    primary                       = var.primary
  }

  tags = merge(var.tags, var.nic_tags)
}