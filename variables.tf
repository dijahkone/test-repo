variable "access_key" {
  type = string
  # default     = "AKIAQ5ZQRqwertyuio"
  description = "my access key"
}

variable "secret_key" {
  type        = string
  default     = "asdfghjkl"
  description = "my secret key"
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "This is the region"
}

variable "cidr_block" {
  type        = list(string)
  description = "this is subnet1 cidr block"
}

variable "vpc_cidr_block" {
  type        = string
  description = "This is the vpc cidr block"
}


# INSTANCES #

variable "aws_instance_instance_type" {
  type        = string
  description = "This is the instance type"
}



# SECURITY GROUPS #

variable "nginx_security_group" {
  type        = string
  description = "This is nginx sec group"
}

variable "egress" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })

  description = "description"
}

# variable "aws_cfg" {
#   type = object({
#     access_key   = string
#     secret_key     = string
#     skip_credentials_validation    = bool
#     skip_requesting_account_id = string
#   })

#   description = "description"
# }


# var.aws_cfg.access_key

variable "subnet_count" {
  type        = number
  description = "This is the subnet count number"
}

variable "instance_count" {
  type        = number
  description = "This is the instance count number"
}

variable "instance_names" {
  type        = list(string)
  description = "This is the instance count number"
}

