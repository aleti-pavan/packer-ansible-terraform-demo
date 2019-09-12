
variable region {
    description = "AWS Region"
    default = "us-east-1"
}

variable "stack" {
    description = "Name of the Stack"
    default = "terraform"
}

variable "vpc_cidr" {
    description = "CIDR of the VPC"
    default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    description = "Subnet CIDR blocks"
    type = "list"
    default = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24"]
}

variable "instances" {
     default = 1
     description = "No of instances"
}

variable "vm_size" {
    description = "Size of the VM"
    default = "t2.micro"
}

variable "ssh_key" {
    default = "~/.ssh/id_rsa.pub"
    description = "Path to the public key to be used for ssh access to the VM"
}

variable "sg_source" {
    default = ["0.0.0.0/0"]
    description = "source cidr for sg"
    type = "list"
}

variable "port_number" {
  description = "Remote tcp port to be used for access to the vms created via the nsg applied to the nics."
  default = ["22","3000","9090","9093","8080","80"]
  type = "list"
}
