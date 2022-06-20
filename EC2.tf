resource "aws_instance" "WP1" {
    ami = "ami-053c3bdd537bb9b58"
    instance_type = "t2.micro"
    # security_groups = [aws_security_group.app_security_group.id]
    vpc_security_group_ids = [aws_security_group.app_security_group.id]
    key_name = aws_key_pair.pub_priv_pair.key_name
    availability_zone = module.vpc.azs[0]
    subnet_id = module.vpc.private_subnets[0]
}

resource "aws_instance" "WP2" {
    ami = "ami-053c3bdd537bb9b58"
    instance_type = "t2.micro"
    # security_groups = [aws_security_group.app_security_group.id]
    vpc_security_group_ids = [aws_security_group.app_security_group.id]
    key_name = aws_key_pair.pub_priv_pair.key_name
    availability_zone = module.vpc.azs[1]
    subnet_id = module.vpc.private_subnets[1]
}

resource "aws_instance" "WP3" {
    ami = "ami-053c3bdd537bb9b58"
    instance_type = "t2.micro"
    # security_groups = [aws_security_group.app_security_group.id]
    vpc_security_group_ids = [aws_security_group.app_security_group.id]
    key_name = aws_key_pair.pub_priv_pair.key_name
    availability_zone = module.vpc.azs[2]
    subnet_id = module.vpc.public_subnets[2]

    tags = {
        name = "public"
    }
}