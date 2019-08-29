output "publicIp" {
    value = "${aws_instance.ec2.public_ip}"
}

output "curl" {
    value = "curl http://${aws_instance.ec2.public_ip}"
}

output "Login-with-Key" {
    value = "ssh -i ${aws_key_pair.sshkey.key_name} ubuntu@${aws_instance.ec2.public_ip}"
}
