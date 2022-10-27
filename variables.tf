variable "resource_group_name" {
  description = "Resource group name for resources created by this module"
  type        = string
}

variable "location" {
  description = "Azure Region in which to create resources"
  type        = string
}

variable "public_ssh_key" {
  description = "(Required) The Public Key which should be used for authentication, which needs to be at least 2048-bit and in ssh-rsa format. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "admin_username" {
  description = "(Required) The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "public_ip_allocation_method" {
  description = "(Required) Defines the allocation method for this IP address. Possible values are Static or Dynamic."
  type        = string
  default     = null
}

variable "public_ip_sku" {
  description = "(Optional) The SKU of the Public IP. Accepted values are Basic and Standard. Defaults to Basic."
  type        = string
  default     = "Basic"
}

variable "public_ip_availability_zone" {
  description = "(Optional) The availability zone to allocate the Public IP in. Possible values are Zone-Redundant, 1, 2, 3, and No-Zone. Defaults to Zone-Redundant."
  type        = string
  default     = null
}

variable "idle_timeout_in_minutes" {
  description = "(Optional) Specifies the timeout for the TCP idle connection. The value can be set between 4 and 30 minutes."
  type        = number
  default     = null
}

variable "domain_name_label" {
  description = "(Optional) Label for the Domain Name. Will be used to make up the FQDN. If a domain name label is specified, an A DNS record is created for the public IP in the Microsoft Azure DNS system."
  type        = string
  default     = null
}

variable "reverse_fqdn" {
  description = "(Optional) A fully qualified domain name that resolves to this public IP address. If the reverseFqdn is specified, then a PTR DNS record is created pointing from the IP address in the in-addr.arpa domain to the reverse FQDN."
  type        = string
  default     = null
}

variable "public_ip_prefix_id" {
  description = "(Optional) If specified then public IP address allocated will be provided from the public IP prefix resource."
  type        = string
  default     = null
}

variable "dns_servers" {
  description = "(Optional) A list of IP Addresses defining the DNS Servers which should be used for this Network Interface."
  type        = list(string)
  default     = null
}

variable "enable_ip_forwarding" {
  description = "(Optional) Should IP Forwarding be enabled? Defaults to false."
  type        = bool
  default     = null
}

variable "enable_accelerated_networking" {
  description = "(Optional) Should Accelerated Networking be enabled? Defaults to false."
  type        = bool
  default     = null
}

variable "internal_dns_name_label" {
  description = "(Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network."
  type        = string
  default     = null
}

variable "vm_name" {
  description = "(Required) The name of the Linux Virtual Machine. Changing this forces a new resource to be created."
  type        = string
}

variable "vm_size" {
  description = "(Required) The SKU which should be used for this Virtual Machine, such as Standard_F2."
  type        = string
  default     = null
}

variable "license_type" {
  description = "(Optional) Specifies the BYOL Type for this Virtual Machine. Possible values are RHEL_BYOS and SLES_BYOS."
  type        = string
  default     = null
}

variable "custom_data" {
  description = "(Optional) The Base64-Encoded Custom Data which should be used for this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "admin_password" {
  description = "(Optional) The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "allow_extension_operations" {
  description = "(Optional) Should Extension Operations be allowed on this Virtual Machine?"
  type        = string
  default     = null
}

variable "availability_set_id" {
  description = "(Optional) Specifies the ID of the Availability Set in which the Virtual Machine should exist. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "computer_name" {
  description = "(Optional) Specifies the Hostname which should be used for this Virtual Machine. If unspecified this defaults to the value for the name field. If the value of the name field is not a valid computer_name, then you must specify computer_name. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "dedicated_host_id" {
  description = "(Optional) The ID of a Dedicated Host where this machine should be run on."
  type        = string
  default     = null
}

variable "disable_password_authentication" {
  description = "(Optional) Should Password Authentication be disabled on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = true
}

variable "encryption_at_host_enabled" {
  description = "(Optional) Should all of the disks (including the temp disk) attached to this Virtual Machine be encrypted by enabling Encryption at Host?"
  type        = bool
  default     = null
}

variable "eviction_policy" {
  description = "(Optional) Specifies what should happen when the Virtual Machine is evicted for price reasons when using a Spot instance. At this time the only supported value is Deallocate. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "extensions_time_budget" {
  description = "(Optional) Specifies the duration allocated for all extensions to start. The time duration should be between 15 minutes and 120 minutes (inclusive) and should be specified in ISO 8601 format. Defaults to 90 minutes (PT1H30M)."
  type        = string
  default     = null
}

variable "max_bid_price" {
  description = "(Optional) The maximum price you're willing to pay for this Virtual Machine, in US Dollars; which must be greater than the current spot price. If this bid price falls below the current spot price the Virtual Machine will be evicted using the eviction_policy. Defaults to -1, which means that the Virtual Machine should not be evicted for price reasons."
  type        = string
  default     = null
}

variable "platform_fault_domain" {
  description = "(Optional) Specifies the Platform Fault Domain in which this Linux Virtual Machine should be created. Defaults to -1, which means this will be automatically assigned to a fault domain that best maintains balance across the available fault domains. Changing this forces a new Linux Virtual Machine to be created."
  type        = string
  default     = null
}

variable "priority" {
  description = "(Optional) Specifies the priority of this Virtual Machine. Possible values are Regular and Spot. Defaults to Regular. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "provision_vm_agent" {
  description = "(Optional) Should the Azure VM Agent be provisioned on this Virtual Machine? Defaults to true. Changing this forces a new resource to be created."
  type        = bool
  default     = null
}

variable "proximity_placement_group_id" {
  description = "(Optional) The ID of the Proximity Placement Group which the Virtual Machine should be assigned to."
  type        = string
  default     = null
}

variable "virtual_machine_scale_set_id" {
  description = "(Optional) Specifies the Orchestrated Virtual Machine Scale Set that this Virtual Machine should be created within. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "zone" {
  description = "(Optional) The Zone in which this Virtual Machine should be created. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "os_disk_caching" {
  description = "(Required) The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
  type        = string
  default     = null
}

variable "os_disk_storage_account_type" {
  description = "(Required) The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS and Premium_LRS. Changing this forces a new resource to be created."
  type        = string
}

variable "nic_name" {
  description = "(Required) The name of the Network Interface. Changing this forces a new resource to be created."
  type        = string
  default     = "dev-nic"
}

variable "ip_configuration_name" {
  description = "(Required) A name used for this IP Configuration."
  type        = string
  default     = null
}

variable "create_public_ip" {
  description = "Do you want to create a public ip for this VM?"
  type        = bool
}

variable "primary" {
  description = "(Optional) Is this the Primary IP Configuration? Must be true for the first ip_configuration when multiple are specified. Defaults to false."
  type        = bool
  default     = null
}

variable "public_ip_sku_tier" {
  description = "(Optional) The SKU Tier that should be used for the Public IP. Possible values are Regional and Global. Defaults to Regional."
  type        = string
  default     = null
}

variable "private_ip_address" {
  description = "(Optional) The Static IP Address which should be used."
  type        = string
  default     = null
}

variable "private_ip_address_version" {
  description = "(Optional) The IP Version to use. Possible values are IPv4 or IPv6. Defaults to IPv4."
  type        = string
  default     = null
}

variable "public_ip_address_version" {
  description = "(Optional) The IP Version to use, IPv6 or IPv4."
  type        = string
  default     = null
}

variable "private_ip_allocation_method" {
  description = "(Required) The allocation method used for the Private IP Address. Possible values are Dynamic and Static."
  type        = string
  default     = null
}

variable "public_ip_name" {
  description = "Name of the Public IP resource"
  type        = string
  default     = "public_ip"
}

variable "subnet_id" {
  description = "(Required) The NAME of the Subnet where this public Network Interface should be located in."
  type        = string
}

variable "image_name" {
  description = "The NAME of the image used for VM creation"
  type        = string
  default     = null
}

variable "image_resource_group_name" {
  description = "(Optional) The name of the REsource Group where the image is created"
  type        = string
  default     = null
}

variable "disk_encryption_set_id" {
  description = "(Optional) The ID of the Disk Encryption Set which should be used to Encrypt this OS Disk."
  type        = string
  default     = null
}

variable "os_disk_name" {
  description = "(Optional) The name which should be used for the Internal OS Disk. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "disk_size_gb" {
  description = "(Optional) The Size of the Internal OS Disk in GB, if you wish to vary from the size used in the image this Virtual Machine is sourced from."
  type        = number
  default     = null
}

variable "write_accelerator_enabled" {
  description = "(Optional) Should Write Accelerator be Enabled for this OS Disk? Defaults to false."
  type        = bool
  default     = null
}

variable "option" {
  description = "(Required) Specifies the Ephemeral Disk Settings for the OS Disk. At this time the only possible value is Local. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "image_publisher" {
  description = "(Optional) Specifies the publisher of the image used to create the virtual machines."
  type        = string
  default     = null
}

variable "image_offer" {
  description = "(Optional) Specifies the offer of the image used to create the virtual machines."
  type        = string
  default     = null
}

variable "image_sku" {
  description = "(Optional) Specifies the SKU of the image used to create the virtual machines."
  type        = string
  default     = null
}

variable "image_version" {
  description = "(Optional) Specifies the version of the image used to create the virtual machines."
  type        = string
  default     = null
}

variable "plan_name" {
  description = "(Required) Specifies the Name of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "plan_product" {
  description = "(Required) Specifies the Product of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "plan_publisher" {
  description = "(Required) Specifies the Publisher of the Marketplace Image this Virtual Machine should be created from. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "ultra_ssd_enabled" {
  description = "(Optional) Should the capacity to enable Data Disks of the UltraSSD_LRS storage account type be supported on this Virtual Machine? Defaults to false."
  type        = bool
  default     = null
}

variable "identity_ids" {
  description = "(Optional) A list of User Managed Identity ID's which should be assigned to the Linux Virtual Machine."
  type        = list(string)
  default     = null
}

variable "storage_account_uri" {
  description = "(Optional) The Primary/Secondary Endpoint for the Azure Storage Account which should be used to store Boot Diagnostics, including Console Output and Screenshots from the Hypervisor."
  type        = string
  default     = null
}

variable "identity_type" {
  description = "(Required) The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are SystemAssigned, UserAssigned and SystemAssigned, UserAssigned."
  type        = string
  default     = null
}

variable "key_vault_id" {
  description = "(Required) The ID of the Key Vault from which all Secrets should be sourced."
  type        = string
  default     = null
}

variable "url" {
  description = "(Required) The Secret URL of a Key Vault Certificate."
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags configuration map"
  type        = map(string)
  default     = {}
}

variable "vm_tags" {
  description = "Tags configuration map"
  type        = map(string)
  default     = {}
}

variable "nic_tags" {
  description = "Tags configuration map"
  type        = map(string)
  default     = {}
}

variable "public_ip_tags" {
  description = "Tags configuration map"
  type        = map(string)
  default     = {}
}