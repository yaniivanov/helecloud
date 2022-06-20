resource "tls_private_key" "hcwp" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}

resource "aws_key_pair" "pub_priv_pair" {
    key_name = "helecloud_keypair"
    public_key = tls_private_key.hcwp.public_key_openssh
  
}