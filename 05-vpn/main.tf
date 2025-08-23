
resource "aws_key_pair" "vpn" {
  key_name   = "vpn"
  # you can paste the public key directly like this
  #public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOKY6q1uqnImivTh5qP6D3JT/+GbDXPCwBE52Pbj3m+e ADMIN@DESKTOP-FJHL3DG"
  public_key = file("~/openvpn.pub")
  # ~ means windows home directory
}


module "vpn" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  key_name = aws_key_pair.vpn.key_name
  name = "${var.project_name}-${var.environment}-vpn"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [data.aws_ssm_parameter.vpn_sg_id.value]
  # convert StringList to list and get first element
  #subnet_id = local.public_subnet_id
  subnet_id = element(split(",", data.aws_ssm_parameter.public_subnet_ids.value), 0)
  ami = data.aws_ami.ami_info.id
  
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-vpn"
    }
  )
}
