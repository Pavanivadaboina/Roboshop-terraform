data "aws_ami" "centos" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "default" {
  name = "default"
}

variable "instance_type" {
  default = "t3.small"
}


resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]
  tags = {
    Name = "frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "frontend.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.private_ip]
}


resource "aws_instance" "mongo" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "mongodb"
  }
}

resource "aws_route53_record" "mongo" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "mongo.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mongo.private_ip]
}


resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "catalogue.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.catalogue.private_ip]
}


resource "aws_instance" "user" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "user.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.user.private_ip]
}


resource "aws_instance" "redis" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "redis.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.redis.private_ip]
}


resource "aws_instance" "cart" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "cart.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.cart.private_ip]
}


resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "mysql"
  }
}

resource "aws_route53_record" "mysql" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "mysql.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.mysql.private_ip]
}


resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "rabbitmq.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.rabbitmq.private_ip]
}


resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "shipping.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.shipping.private_ip]
}


resource "aws_instance" "payment" {
  ami           = data.aws_ami.centos.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.default.id]

  tags = {
    Name = "payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z01785992HNK9EWV1B0IH"
  name    = "payment.devopspractice.tech"
  type    = "A"
  ttl     = 30
  records = [aws_instance.payment.private_ip]
}
