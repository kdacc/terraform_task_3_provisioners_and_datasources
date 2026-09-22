resource "null_resource" "example" {
  connection {
    type = "ssh"
    host = data.azurerm_public_ip.existing.ip_address
    user = "azureuser"
  }

  provisioner "file" {
    source      = "index.html"
    destination = "/tmp/index.html"
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx",
      "sudo mv /tmp/index.html /var/www/html/index.html",
      "sudo systemctl restart nginx",
      "sudo systemctl enable nginx"
    ]
  }
}