provider "bigip" {
  address  = var.address
  username = var.username
  password = var.password
}

# download rpm
resource "null_resource" "download_as3" {
  provisioner "local-exec" {
    command = "wget ${var.as3_rpm_url}"
  }
}

# install rpm to BIG-IP
resource "null_resource" "install_as3" {
  provisioner "local-exec" {
    command = "./install_as3.sh ${var.address} admin:${var.password} ${var.as3_rpm}"
  }
  depends_on = [null_resource.download_as3]
}

# deploy application using as3
resource "bigip_as3" "nginx" {
  as3_json    = file("example1.json")
  tenant_name = "Sample_new"
  depends_on  = [null_resource.install_as3]
}

# Enable ASM module on BIG-IP
resource "bigip_sys_provision" "asm" {
  name        = "asm"
  full_path    = "/Common/asm"
  cpu_ratio    = 0
  disk_ratio   = 0
  level       = "nominal"
  memory_ratio = 0
  depends_on = [bigip_as3.nginx]
}
