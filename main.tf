variable "env" {}

data "template_file" "httpd_user_data" {
  template = file("./user_data.sh.tpl")

  vars = {
      package = "httpd"
  }
}


resource "aws_instance" "example" {
  ami                    = "ami-0f9ae750e8274075b"
  instance_type          = var.env == "production" ? "m5.large" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.example_ec2.id]

  user_data = data.template_file.httpd_user_data.rendered
}

output "example_public_dns" {
  value = aws_instance.example.public_dns
}

resource "aws_security_group" "example_ec2" {
  name = "example-ec2"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
