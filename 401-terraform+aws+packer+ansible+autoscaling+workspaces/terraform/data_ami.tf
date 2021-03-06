# This will make terraform call aws api to get
# this value in the plan step.
# Plan will fail if it cant find a matching ami
# data <aws resource> <choosen name>

data "aws_ami" "app01_ami" {
  most_recent = true

  filter {
    name   = "name"
    # Filter by name generated by packer
    values = ["app01_ami-*"]
  }

  # You can add some more filters...
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["self"] # Or the aws account number
}

