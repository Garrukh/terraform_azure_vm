resource "azurerm_public_ip" "public_ip" {
  count = var.create_public_ip ? 1 : 0

  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku                     = var.public_ip_sku
  sku_tier                = var.public_ip_sku_tier
  allocation_method       = var.public_ip_allocation_method != null ? var.public_ip_allocation_method : var.private_ip_allocation_method
  availability_zone       = var.public_ip_availability_zone
  ip_version              = var.public_ip_address_version != null ? var.public_ip_address_version : var.private_ip_address_version
  idle_timeout_in_minutes = var.idle_timeout_in_minutes
  domain_name_label       = var.domain_name_label
  reverse_fqdn            = var.reverse_fqdn
  public_ip_prefix_id     = var.public_ip_prefix_id

  ip_tags = var.public_ip_tags
  tags    = merge(var.tags, var.public_ip_tags)
}