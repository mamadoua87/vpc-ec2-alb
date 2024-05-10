resource "aws_instance" "server1" {
    ami = "ami-0a699202e5027c10d"
    instance_type = var.INSTANT_TYPE
    vpc_security_group_ids = [ aws_security_group.sg1.id ]
    availability_zone = "${var.REGION}a"
    subnet_id = aws_subnet.private1.id
    user_data = file("code.sh")
    tags= {
      name = "var.ENVIRONMENT"
}
}

resource "aws_instance" "server2" {
    ami = "ami-0a699202e5027c10d"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ aws_security_group.sg1.id ]
    availability_zone = "us-east-1b"
    subnet_id = aws_subnet.private2.id
    user_data = file("code.sh")
    tags= {
      name = "webserver-2"
  }
}