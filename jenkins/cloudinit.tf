data "template_file" "jenkins_init" {
  template = "${file("scripts/jenkins_init.sh")}"

  vars {
    DEVICE          = "${var.instance_device_name}"
    JENKINS_VERSION = "${var.jenkins_version}"
  }
}

data "template_cloudinit_config" "cloudinit_jenkins" {

  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.jenkins_init.rendered}"
  }
}
