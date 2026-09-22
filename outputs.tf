output "vm_public_ip" {
  value = data.azurerm_public_ip.existing.ip_address
}