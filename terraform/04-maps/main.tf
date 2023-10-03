variable "users" {
  default = {
    krasi    = { country : "Bulgaria", city : "Sofia", department : "IT" },
    petkan   = { country : "Serbia", city : "Belgrad", department : "IT" },
    divaka   = { country : "Greece", city : "Athens", department : "IT" },
    prostaka = { country : "Croatia", city : "Zagreb", department : "IT" }
  }
}

provider "aws" {
  region = "us-east-1"
  //version = "~> 2.46" (No longer necessary)
}

resource "aws_iam_user" "my_iam_user" {
  #count = length(var.names)
  #name  = var.names[count.index]
  for_each = var.users
  name     = each.key
  tags = {
    #country: each.value
    country : each.value.country
    city : each.value.city
    department : each.value.department

  }
}