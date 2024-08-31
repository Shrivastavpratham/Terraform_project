variable "cidr" {
  default = "10.0.0.0/16"
}

variable "subnet1cidr" {
  default = "10.0.0.0/24"
}

variable "subnet2cidr" {
  default = "10.0.1.0/24"
}

variable "instance" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "0c55b159cbfafe1f0"
}