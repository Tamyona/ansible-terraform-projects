variable region {
    type = string
    description = "Provide region"
}
variable key_name {
    type = string
    description = "Provide key_name"
}

# VPC
variable vpc_cidr {
    type = string
    description = "Provide VPC CIDR block"
}
variable subnet1 {
    type = string
    description = "Provide subnet-1 CIDR block"
}
variable subnet2 {
    type = string
    description = "Provide subnet-2 CIDR block"
}
variable subnet3 {
    type = string
    description = "Provide subnet-3 CIDR block"
}

# EC2
variable instance_type {
    type = string
    description = "Provide instance type"
}
variable instance_name {
    type = string
    description = "Provide instance name"
}

# SG
variable port {
    type = list
    description = "Provide subnet-3 CIDR block"
}

# RDS
variable db_name {
    type = string
    description = "Provide Database name"
}
variable db_user {
    type = string
    description = "Provide Database user"
    }
variable db_pass {
    type = string
    description = "Provide Database password"
}