packer {
  required_plugins {
    docker = {
      version = ">= 1.1.4"
      source  = "github.com/hashicorp/docker"
    }
    puppet = {
      version = ">= 1.0.1"
      source  = "github.com/hashicorp/puppet"
    }
  }
}

variable "timezone" {
  type = string
}

variable "version" {
  type = string
}

variable "arch" {
  type = string
}

variable "image_name" {
  type = string
}

variable "repository" {
  type = string
}

source "docker" "base" {
  image    = "shinesolutions/the-works-buildenv:4.2.0"
  platform = "linux/${var.arch}"
  commit   = true
  run_command = [
    "--privileged",
    "-e",
    "container=docker",
    "-e",
    "LANG=en_US.UTF-8",
    "-e",
    "LC_ALL=en_US.UTF-8",
    "-e",
    "LC_CTYPE=en_US.UTF-8",
    "-v",
    "/sys/fs/cgroup:/sys/fs/cgroup",
    "-d",
    "-i",
    "-t",
    "{{.Image}}",
    "/usr/bin/bash",
  ]
  changes = [
    "ENV LANG UTF-8",
    "ENV LC_ALL en_US.UTF-8",
    "ENV LC_CTYPE en_US.UTF-8",
    "ENV TZ ${var.timezone}",
    "ENV PATH /opt/puppetlabs/puppet/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/bin",
    "EXPOSE 4502 4503 5432 5433",
  ]
}

build {
  sources = [
    "source.docker.base"
  ]

  provisioner "shell" {
    script = "provisioners/shell/init.sh"
  }

  provisioner "shell" {
    script = "provisioners/shell/python.sh"
  }

  provisioner "puppet-masterless" {
    prevent_sudo      = true
    puppet_bin_dir    = "/opt/puppetlabs/bin/"
    hiera_config_path = "conf/hiera.yaml"
    extra_arguments = [
      "--debug",
      "--include_legacy_facts",
      "--no-strict_variables",
    ]
    staging_directory = "/tmp/${var.image_name}/"
    manifest_file     = "provisioners/puppet/${var.image_name}.pp"
    module_paths = [
      "modules"
    ]
  }

  provisioner "shell" {
    inline = [
      "rm -fr /tmp/*"
    ]
  }

  post-processor "docker-tag" {
    repository = "${var.repository}/${var.image_name}"
    tags = [
      "latest",
      "${var.version}-${var.arch}"
    ]
  }
}
