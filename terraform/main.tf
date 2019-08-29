

resource "aws_instance" "ec2" {
  ami           = "${data.aws_ami.packer_image.id}"
  instance_type = "${var.instance_type}"
  key_name = "2019-aws-class"
  tags = {
    Name = "${var.name}"
  }
}


data "aws_ami" "packer_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["example-ami-packer"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["218067254075"] # Canonical
}


output "publicIP" {
    value = "ubuntu@${aws_instance.ec2.public_ip}"
}
