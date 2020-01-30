output "To_Access_NGINX" {
  value = "https://${aws_eip.f5.public_ip}:8080"
}

