output "EC2_Private_IP" {
  value = module.aws-components.aws_instance_private_ip
}