variable "region1" {
  description = "Region 1"
  type = string
  default = "ap-south-1"
}
variable "region2" {
  description = "Region 2"
  type = string
  default = "us-east-1"
}
variable "auto_accept_shared_attachments" {
  description = "Whether resource attachment requests are automatically accepted."
  type = string
  default = "disable"
}

variable "default_route_table_association" {
  description = "Whether resource attachments are automatically associated with the default association route table."
  type = string
  default = "enable"
}

variable "default_route_table_propagation" {
  description = "Whether resource attachments automatically propagate routes to the default propagation route table."
  type = string
  default = "enable"
}

variable "transit_gateway_cidr_blocks" {
  description = "Whether resource attachment requests are automatically accepted."
  type = string
  default = "10.10.6.0/24"
}

variable "allow_external_principals" {
  description = "Indicates whether principals outside your organization can be associated with a resource share."
  type = bool
  default = true
}