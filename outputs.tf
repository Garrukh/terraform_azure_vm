output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "The ID of the Linux Virtual Machine."
}

output "private_ip_address" {
  value       = azurerm_linux_virtual_machine.vm.private_ip_address
  description = "The Primary Private IP Address assigned to this Virtual Machine."
}

output "private_ip_addresses" {
  value       = azurerm_linux_virtual_machine.vm.private_ip_addresses
  description = "A list of Private IP Addresses assigned to this Virtual Machine."
}

output "public_ip_address" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_address
  description = "The Primary Public IP Address assigned to this Virtual Machine."
}

output "public_ip_addresses" {
  value       = azurerm_linux_virtual_machine.vm.public_ip_addresses
  description = "A list of the Public IP Addresses assigned to this Virtual Machine."
}

output "virtual_machine_id" {
  value       = azurerm_linux_virtual_machine.vm.virtual_machine_id
  description = "A 128-bit identifier which uniquely identifies this Virtual Machine."
}

output "principal_id" {
  value       = var.identity_type != null ? azurerm_linux_virtual_machine.vm.identity[0].principal_id : null
  description = "The ID of the System Managed Service Principal."
}

output "tenant_id" {
  value       = var.identity_type != null ? azurerm_linux_virtual_machine.vm.identity[0].tenant_id : null
  description = "The ID of the Tenant the System Managed Service Principal is assigned in."
}

output "nic_id" {
  value       = azurerm_network_interface.nic.id
  description = "The ID of the Network Interface."
}

output "applied_dns_servers" {
  value       = azurerm_network_interface.nic.applied_dns_servers
  description = "If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set."
}

output "internal_domain_name_suffix" {
  value       = azurerm_network_interface.nic.internal_domain_name_suffix
  description = "Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal_domain_name_suffix."
}

output "mac_address" {
  value       = azurerm_network_interface.nic.mac_address
  description = "The Media Access Control (MAC) Address of the Network Interface."
}

output "public_ip_id" {
  value       = var.create_public_ip ? azurerm_public_ip.public_ip[0].id : null
  description = "The Public IP ID."
}

output "fqdn" {
  value       = var.create_public_ip ? azurerm_public_ip.public_ip[0].fqdn : null
  description = "Fully qualified domain name of the A DNS record associated with the public IP. domain_name_label must be specified to get the fqdn. This is the concatenation of the domain_name_label and the regionalized DNS zone"
}