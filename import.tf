import {
id = "sg-0ed29fbac1896bae6"
to = aws_security_group.bia-db

}

import {
id = "sg-0510f5760d3c3fe23"
to = aws_security_group.bia-web
}

import {
id = "sg-0a3030bef1680eade"
to = aws_security_group.bia-ec2
}

import {
id = "sg-08953fad6ab2aea84"
to = aws_security_group.bia-alb
}
