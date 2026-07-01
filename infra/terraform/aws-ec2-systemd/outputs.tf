output "public_ip" {
  value = aws_instance.app.public_ip
}

output "app_url" {
  value = "http://${aws_instance.app.public_ip}:8080"
}

output "ssh_command" {
  value = "ssh ubuntu@${aws_instance.app.public_ip}"
}
