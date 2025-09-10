variable "project_name" {
  description = "Project name prefix"
  type        = string
  default     = "hello-eks"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "tf_state_bucket" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = "CHANGE-ME-unique-tfstate-bucket"
}

variable "tf_lock_table" {
  description = "DynamoDB table for state locking"
  type        = string
  default     = "tf-state-locks"
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnets" {
  description = "Public subnets"
  type        = list(string)
  default     = ["10.20.1.0/24", "10.20.2.0/24"]
}

variable "eks_min_size" {
  type        = number
  default     = 1
}

variable "eks_max_size" {
  type        = number
  default     = 2
}

variable "eks_desired_size" {
  type        = number
  default     = 1
}

variable "eks_instance_type" {
  type        = string
  default     = "t3.medium"
}
