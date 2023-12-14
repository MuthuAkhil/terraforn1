variable "cluster_name" {
  type = string
}

variable "aws_region" {
  type = string
}

# variable "profile" {
#   type = string
# }

variable "ecr_name" {
  type    = string
  default = null
}

#variables.tf


variable "health_check_path" {
  default = "/index"
}

variable "create_module" {
  type    = bool
  default = false
}

variable "key_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "min_size" {
  type = string
}

variable "max_size" {
  type = string
}

variable "desired_capacity" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "private_subnet_name" {
  type = string
}

variable "public_subnet_name" {
  type        = string
  description = "(optional) describe your variable"
}



variable "tgname" {
  type = string
}

variable "STAGE_ICE9_PORT" {
  type    = string
  default = "80"
}

variable "ssl_policy" {
  type        = string
  description = "(optional) describe your variable"
}

variable "certificate_arn" {
  type        = string
  description = "(optional) describe your variable"
}

variable "alb_name" {
  type        = string
  description = "(optional) describe your variable"
}

####Container Definition#####


variable "FLUENTBIT_REPO_URI" {
  type    = string
  default = ""
}

variable "FLUENTBIT_TAG" {
  type    = string
  default = ""
}

/*variable "SERVICE_PORT" {
  type = string
}*/

variable "SERVICE_PORT_8000" {
  type        = string
  default     = ""
  description = "description"
}

variable "SERVICE_PORT_8100" {
  type        = string
  default     = ""
  description = "description"
}

variable "SERVICE_PORT_8200" {
  type        = string
  default     = ""
  description = "description"
}

variable "SERVICE_PORT_8300" {
  type        = string
  default     = ""
  description = "description"
}

variable "SERVICE_PORT_8400" {
  type        = string
  default     = ""
  description = "description"
}

variable "SERVICE_PORT_80" {
  type        = string
  default     = ""
  description = "description"
}

variable "BUILD_PORT80" {
  type        = string
  default     = ""
  description = "description"
}

variable "BUILD_PORT8000" {
  type        = string
  default     = ""
  description = "description"
}

variable "BUILD_PORT8100" {
  type        = string
  default     = ""
  description = "description"
}

variable "BUILD_PORT8200" {
  type        = string
  default     = ""
  description = "description"
}

variable "BUILD_PORT8300" {
  type        = string
  default     = ""
  description = "description"
}

variable "BUILD_PORT8400" {
  type        = string
  default     = ""
  description = "description"
}

variable "TASK_CPU_LIMIT" {
  type    = number
  default = "256"
}

variable "TASK_MEMORY_LIMIT" {
  type    = number
  default = "256"
}

# variable "AWS_SECRET_ACCESS_KEY" {
#   type        = string
#   //default     = ""
#   description = "description"
# }

# variable "AWS_ACCESS_KEY_ID" {
#   type        = string
#   //default     = ""
#   description = "description"
# }

variable "ES_LOG_HOST" {
  type    = string
  default = ""
}

variable "ecr_name_testing" {
  type    = string
  default = null
}

variable "ecr_name_staging" {
  type    = string
  default = null
}

variable "app_name" {
  type    = string
  default = null
}
