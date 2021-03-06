variable "parent_id" {
  description = "parent cluster's id"
}

variable "network" {
  description = "parent cluster network self_link"
}

variable "region" {
  description = "region to build resources in"
}

// zone variables
variable "zones" {
  type = "list"
}

variable "cidr_blocks_by_zone" {
  description = "map of zones to their respective cidr blocks"
  type        = "map"
}

variable "failover_zones" {
  type = "map"
}

// instance configuration
variable "instances_per_zone" {
  default = "1"
}

variable "machine_type" {
  description = "Machine type of the instance to use"

  type    = "string"
  default = "f1-micro"
}

variable "disk_image" {
  description = "Disk image to use for this instance. See:
      https://cloud.google.com/compute/docs/images#image_families. (default:
      coreos/coreos-stable)"

  type    = "string"
  default = "coreos-cloud/coreos-stable"
}

variable "startup_script" {
  description = "Startup script path. This is set as the metadata startup
  script and is run at startup for each host."
}

// routing vars
variable "failover_ratio" {
  description = "ratio of failed instances before failing over to the backup pool"
  default = 0.8
}

variable "tcp_forwarding_rules" {
  description = "List of port/port-ranges which zone/region TCP forwarding rules
  should be created of."

  type = "list"
}

variable "udp_forwarding_rules" {
  description = "List of port/port-ranges which zone/region UDP forwarding
  rules should be created of."

  type = "list"
}

// firewall variables
variable "cluster_tags" {
  description = "map of cluster name -> instance tags in the cluster"
  type = "map"
}

variable "tcp_cluster_firewall" {
  description = "map of ports to open over tcp to other ports"
  type        = "map"
}

variable "udp_cluster_firewall" {
  description = "map of ports to open over udp to other ports"
  type        = "map"
}

variable "udp_range_firewall" {
  description = "map of cidr ranges to ports that should be open for them"
  default     = {}
}

variable "tcp_range_firewall" {
  description = "map of cidr ranges to ports that should be open for them"
  default     = {}
}

// internal variables
variable "_int_to_sequence" {
  description = "A map of comma delimited integers in a series. This is a hack,
      to make the api to this module nicer until terraform supports the ability to
      dynamically generate a sequence"

  default = {
    "0"  = ""
    "1"  = "0"
    "2"  = "0,1"
    "3"  = "0,1,2"
    "4"  = "0,1,2,3"
    "5"  = "0,1,2,3,4"
    "6"  = "0,1,2,3,4,5"
    "7"  = "0,1,2,3,4,5,6"
    "8"  = "0,1,2,3,4,5,6,7"
    "9"  = "0,1,2,3,4,5,6,7,8"
    "10" = "0,1,2,3,4,5,6,7,8,9"
  }
}

// internal variables
variable "_zones_to_region" {
  default = {
    "us-west1-a" = "us-west1"
    "us-west1-b" = "us-west1"

    "us-central1-a" = "us-central1"
    "us-central1-b" = "us-central1"
    "us-central1-c" = "us-central1"
    "us-central1-f" = "us-central1"

    "us-east1-b" = "us-east1"
    "us-east1-c" = "us-east1"
    "us-east1-d" = "us-east1"

    "europe-west1-b" = "europe-west1"
    "europe-west1-c" = "europe-west1"
    "europe-west1-d" = "europe-west1"

    "asia-east1-a" = "asia-east1"
    "asia-east1-b" = "asia-east1"
    "asia-east1-c" = "asia-east1"
  }
}
