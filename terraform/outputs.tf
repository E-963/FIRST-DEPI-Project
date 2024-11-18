output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.demo.id
}

output "demo_instance_public_ip" {
  value = aws_instance.demo.public_ip
}

output "test_instance_public_ip" {
  value = aws_instance.test.public_ip
}

output "inst_instance_public_ip" {
  value = aws_instance.inst.public_ip
}

output "instance_dns_name" {
  description = "The DNS name of the EC2 instance"
  value       = aws_instance.demo.public_dns
}