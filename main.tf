

##################################################################################
# RESOURCES
##################################################################################


# INSTANCES #
resource "aws_instance" "nginx-move" {
  count                  = length(var.instance_names)
  ami                    = nonsensitive(data.aws_ssm_parameter.ami.value)
  instance_type          = var.aws_instance_instance_type
  subnet_id              = aws_subnet.subnet[(count.index % var.subnet_count)].id
  vpc_security_group_ids = [aws_security_group.nginx-sg.id]

  tags = {
    Name  = "${element(var.instance_names, count.index)}-${(count.index + 1)}"
    Env   = "Dev"
    Owner = "Dijah"
  }

  user_data = <<EOF
    #! /bin/bash
    sudo amazon-linux-extras install -y nginx1
    sudo service nginx start
    sudo rm /usr/share/nginx/html/index.html
    echo '<html><head><title>Terraform Start-Up Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">We did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
    EOF

}
