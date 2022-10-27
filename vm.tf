data "azurerm_image" "custom_image" {
  count               = var.image_name != null ? 1 : 0
  name                = var.image_name
  resource_group_name = var.image_resource_group_name != null ? var.image_resource_group_name : var.resource_group_name
}

resource "azurerm_linux_virtual_machine" "vm" {

  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size
  admin_username        = var.admin_username
  license_type          = var.license_type
  network_interface_ids = [azurerm_network_interface.nic.id]

  custom_data = var.custom_data

  source_image_id = var.image_name != null ? data.azurerm_image.custom_image[0].id : null

  admin_password                  = var.admin_password
  allow_extension_operations      = var.allow_extension_operations
  availability_set_id             = var.availability_set_id
  computer_name                   = var.computer_name
  dedicated_host_id               = var.dedicated_host_id
  disable_password_authentication = var.disable_password_authentication
  encryption_at_host_enabled      = var.encryption_at_host_enabled
  eviction_policy                 = var.eviction_policy
  extensions_time_budget          = var.extensions_time_budget
  max_bid_price                   = var.max_bid_price
  platform_fault_domain           = var.platform_fault_domain
  priority                        = var.priority
  provision_vm_agent              = var.provision_vm_agent
  proximity_placement_group_id    = var.proximity_placement_group_id
  virtual_machine_scale_set_id    = var.virtual_machine_scale_set_id
  zone                            = var.zone

  os_disk {
    name                      = var.os_disk_name
    caching                   = var.os_disk_caching
    storage_account_type      = var.os_disk_storage_account_type
    disk_encryption_set_id    = var.disk_encryption_set_id
    disk_size_gb              = var.disk_size_gb
    write_accelerator_enabled = var.write_accelerator_enabled

    dynamic "diff_disk_settings" {
      for_each = var.option != null ? ["diff_disk_settings"] : []
      content {
        option = var.option
      }
    }
  }

  dynamic "source_image_reference" {
    for_each = var.image_publisher != null || var.image_offer != null || var.image_sku != null || var.image_version != null ? ["source_image_reference"] : []
    content {
      publisher = var.image_publisher
      offer     = var.image_offer
      sku       = var.image_sku
      version   = var.image_version
    }
  }

  dynamic "plan" {
    for_each = var.plan_name != null || var.plan_product != null || var.plan_publisher != null ? ["plan"] : []
    content {
      name      = var.plan_name
      product   = var.plan_product
      publisher = var.plan_publisher
    }
  }

  dynamic "admin_ssh_key" {
    for_each = var.public_ssh_key != null ? ["admin_ssh_key"] : []
    content {
      public_key = var.public_ssh_key
      username   = var.admin_username
    }
  }

  dynamic "additional_capabilities" {
    for_each = var.ultra_ssd_enabled != null ? ["additional_capabilities"] : []
    content {
      ultra_ssd_enabled = var.ultra_ssd_enabled
    }
  }

  dynamic "boot_diagnostics" {
    for_each = var.storage_account_uri != null ? ["boot_diagnostics"] : []
    content {
      storage_account_uri = var.storage_account_uri
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? ["identity"] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  dynamic "secret" {
    for_each = var.key_vault_id != null || var.url != null ? ["secret"] : []
    content {
      key_vault_id = var.key_vault_id

      certificate {
        url = var.url
      }
    }
  }

  tags = merge(var.tags, var.vm_tags)
}