variable "project" {
    type = string
}

variable "environment" {
    type = string
}

variable "vpc_cidr" {
    type = list
    default = "10.0.0.0/16"
}