variable "iam_user_name_prefix" {
  
  default = "my_iam_user"
  
}

provider "aws" {
  region = "us-east-1"
  //version = "~> 2.46" (No longer necessary)
}

resource "aws_iam_user" "my_iam_user" {
  count = 3
  name  = "${var.iam_user_name_prefix}_${count.index}"
}