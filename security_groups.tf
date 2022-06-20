
resource "aws_security_group" "alb_sg" {
  name        = "Allow HTTP traffic to ALB"
  description = "Allow HTTP traffic for load balancer"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "inbound HTTP traffic"
      from_port        = 80
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      to_port          = 80
    }
  ]

  egress = [
    {
      description      = "outbound HTTP traffic"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]


}


resource "aws_security_group" "db_security_group" {
  name        = "Allow DB traffic"
  description = "Allow DB traffic to DB"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow DB traffic"
      from_port        = 3306
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      to_port          = 3306
    }
  ]

  egress = [
    {
      description      = "outbound rule"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

}

resource "aws_security_group" "app_security_group" {
  name        = "Allow HTTP traffic from alb to ec2"
  description = "Allow HTTP traffic from alb to ec2"
  vpc_id      = module.vpc.vpc_id

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description      = "allow HTTP traffic"
      from_port        = 80
      protocol         = "tcp"
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
      to_port          = 80
    }
  ]

  egress = [
    {
      description      = "outbound HTTP rule"
      from_port        = 0
      to_port          = 0
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

}
