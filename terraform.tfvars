aws_instance_instance_type = "t2.micro"
vpc_cidr_block             = "10.0.0.0/16"
cidr_block                 = ["10.0.2.0/24", "10.0.1.0/24"]

egress = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

nginx_security_group = "nginx_sg"
subnet_count         = 2
instance_count       = 10

instance_names = ["dijah", "marie", "kone", "olu", "alade"]
#  $env:TF_VAR_region
# TF_VAR_instance_type