resource "aws_instance" "server" {
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  ami                         = data.aws_ami.ubuntu.id
  key_name                    = aws_key_pair.key.key_name
  instance_type               = "t2.micro"
  associate_public_ip_address = false
  monitoring                  = true
  user_data                   = data.template_cloudinit_config.cfg.rendered

  provisioner "remote-exec" {
    inline = [
      "cd /opt",
      "sudo mkdir app"
    ]
    connection {
      host        = self.public_dns
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/${var.key_path}")
    }
  }

  provisioner "file" {
    source      = "${path.module}/../app/"
    destination = "/opt/app"
    connection {
      host        = self.public_dns
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("${path.module}/${var.key_path}")
    }
  }
}

data "aws_iam_policy_document" "ec2_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "ec2-instance-role"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_key_pair" "key" {
  key_name   = "${local.service_name}-key"
  public_key = file("${path.module}/${var.key_path}.pub")
}

data "template_file" "cfg_script" {
  template = file("${path.module}/config.tpl.yml")
  vars = {
    LOG_FILE_NAME = "cloud_init_logs"
  }
}

data "template_file" "userdata" {
  template = file("${path.module}/userdata.sh")
  vars = {
    LOG_FILE_NAME = "cloud_init_logs"
  }
}

data "template_cloudinit_config" "cfg" {
  part {
    filename     = "init.cfg"
    content_type = "text/cloud-config"
    content      = data.template_file.cfg_script.rendered
  }
  part {
    filename     = "userdata.sh"
    content_type = "text/x-shellscript"
    content      = data.template_file.userdata.rendered
  }
}