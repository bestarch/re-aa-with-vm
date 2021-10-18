
variable "location_us" {
  type        = list(any)
  default     = ["East US"]
  description = "US Region where resource would be deployed"
}

variable "location_apj" {
  type        = list(any)
  default     = ["East Asia"]
  description = "APAC Region where resource would be deployed"
}

variable "location_ind" {
  type        = list(any)
  default     = ["West India"]
  description = "India Region where resource would be deployed"
}

variable "cidr" {
  type        = list(any)
  description = "cidr"
}

variable "cidr_vm" {
  type        = list(any)
  description = "cidr"
}

variable "prefix" {
  type = string
}

variable "resource_name" {
  type        = string
  description = "resource name"
}

variable "resource_name_2" {
  type        = string
  description = "resource name 2"
}

variable "tags" {
  type = map(any)
}

variable "password" {
  type        = string
  description = "password for SSHing to VM"
}

variable "username" {
  type        = string
  description = "username for SSHing to VM"
}

variable "subscription_id" {
  type        = string
  description = "subscription id"
}


