variable "port" {
  type    = string
}
variable "tgname" {
  type    = string  
}
variable "vpc_id" {
  type    = string  
}
variable "health_check_path" {
  type    = string  
}
variable "aws_alb_arn" {
  type    = string  
}
variable "deregistration_delay" {
  type = number
  default = 60
}
variable "certificate_arn" {
  type = string
}

variable "ssl_policy" {
  type = string
}