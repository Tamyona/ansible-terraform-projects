variable region {
    default = "us-east-2"
    type = string 
    description = "provide a region"
}
variable key_name {
    default = "bastion-key"
}

# VPC
variable vpc_cidr {
    default = "10.0.0.0/16"
}
variable subnet1 {
    default = "10.0.1.0/24"
}
variable subnet2 {
    default = "10.0.2.0/24"
}
variable subnet3 {
    default = "10.0.3.0/24"
}

# EC2
variable instance_type {
    default = "t2.micro"
}
# variable instance_name {
#     default = "Project"
# }

# SG
variable port {
    default = [22, 80]
    type = list
}