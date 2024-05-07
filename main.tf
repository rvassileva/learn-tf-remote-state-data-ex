data "terraform_remote_state" "vpc-config" {
  backend = "s3"

  config = {
    bucket = "tf-remote-state-example-76"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "random_pet" "server" {
  length    = 2
  separator = "-"
}

resource "aws_instance" "web-server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = data.terraform_remote_state.vpc-config.outputs.subnet_id

  tags = {
    Name = "web-server-${random_pet.server.id}"
  }
}


