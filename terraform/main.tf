resource "aws_key_pair" "sshkey" {
  key_name   = "${var.stack}-key"
  public_key = "${file("${var.ssh_key}")}"
}

resource "aws_instance" "ec2" {
  ami           = "${data.aws_ami.packer_image.id}"
  instance_type = "${var.vm_size}"
  subnet_id = "${aws_subnet.subnet[0].id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.sg.id}"]
  key_name = "${aws_key_pair.sshkey.key_name}"
  tags = {
    Name = "${var.stack}-growlerfriday"
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
