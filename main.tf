provider "scaleway" {
  organization = "${var.organization}"
  token        = "${var.token}"
  region       = "${var.region}"
}

data "scaleway_image" "wave_tf" {
  architecture = "x86_64"
  name = "Ubuntu Bionic"
}
resource "scaleway_ip" "ip" {
  server = "${scaleway_server.wave_tf.id}"
}

resource "scaleway_server" "wave_tf" {
  name = "wave_tf"
  image = "${data.scaleway_image.wave_tf.id}"
  type = "START1-S"
}

resource "scaleway_volume" "wave_tf" {
  name = "wave_tf"
  size_in_gb = 50
  type = "l_ssd"
}
