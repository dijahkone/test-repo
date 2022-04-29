output "instance_publicip" {
  value       = aws_instance.nginx-move.*.public_ip
  sensitive   = false
  description = "Instance Public IP Address"
}

output "instance_amiid" {
  value       = aws_instance.nginx-move.*.id
  sensitive   = false
  description = "ami id of first ec2"
}

# output "public_dns_name" {
#   value       = aws_instance.nginx-move[0].public_dns
#   sensitive   = false
#   description = "description"

# }

# output "vpc_id" {
#   value       = "this is the vpc id ${aws_vpc.vpc.id}"
#   sensitive   = false
#   description = "description"

# }

# output "azs" {
#   value       = data.aws_availability_zones.available.names
#   sensitive   = false
#   description = "description"

# }

# output "lb_public_dns" {
#   value = aws_lb.lb1.dns_name
# }


output "aws_alb_public_dns" {
  value = aws_lb.lb1.dns_name
}

