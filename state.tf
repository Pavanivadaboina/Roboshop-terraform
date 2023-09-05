terraform {
  backend "s3" {
    bucket = "devops-pavani7"
    key    = "roboshop/dev/terraform.tf.state"
    region = "us-east-1"
  }
}