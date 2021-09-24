variable "vpc_cidr" {
  type        = string
  description = "vpc cidr block"
}

variable "tags" {
  type        = map(any)
  description = "key value pairs for vpc resources"
}

variable "subnet_settings" {
  type = map(object({
    subnet_cidr       = string
    availability_zone = string
  }))
}