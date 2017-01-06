# Variables -----------------------------

variable "aws_account_id" {}

variable "aws_profile" {}

variable "aws_region" {}

variable "availability_zone" {}

variable "sql_user" {}

variable "sql_password" {}

variable "sql_url" {}

variable "system_name" {}

variable "datomic_license" {}

variable "transactor_key_name" {}

variable "transactor_ami" {}


# Providers -----------------------------

provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

# Modules -----------------------------

module "staging_datomic" {
  source             = "./modules/datomic"
  aws_region         = "${var.aws_region}"
  availability_zones = ["${var.availability_zone}"]
  system_name        = "${var.system_name}"
  datomic_license    = "${var.datomic_license}"
  key_name           = "${var.transactor_key_name}"
  ami                = "${var.transactor_ami}"

  memcached_uri    = ""
  sql_url          = "${var.sql_url}"
  sql_user         = "${var.sql_user}"
  sql_password     = "${var.sql_password}"
}