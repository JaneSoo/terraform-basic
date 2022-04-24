variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "bucket_tag" {
  description = "Value of bucket tag for s3"
  type        = string
  default     = "MyExampleBucket"
}
