data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "default" {
  name = "default"
}


variable "components" {

  frontend = {
    name = "frontend"
    instance_type = "t3.small"
  }

  mongo = {
    name = "mongo"
    instance_type = "t3.small"
  }

  cart = {
    name = "cart"
    instance_type = "t2.micro"
  }


  catalogue = {
    name = "catalogue"
    instance_type = "t3.small"
  }

  user = {
    name = "user"
    instance_type = "t3.small"
  }

  mysql = {
    name = "mysql"
    instance_type = "t3.small"
  }

  shipping = {
    name = "shipping"
    instance_type = "t3.small"
  }

  rabbitmq = {
    name = "rabbitmq"
    instance_type = "t3.small"
  }

  redis = {
    name = "redis"
    instance_type = "t3.small"
  }

  payment = {
    name = "payment"
    instance_type = "t3.small"
  }

}


resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centos.image_id
instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.default.id]
  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components

  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "${each.value["name"]}.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance[each.value["name"]].private_ip]
}


