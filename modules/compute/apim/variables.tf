variable global_settings {}
variable settings {}

variable tags {
  type        = map
  description = "(Optional) A mapping of tags to assign to the resource."
  default     = {}
}

variable subnets {
  default = {}
}

variable diagnostic_profiles {
  default = {}
}

variable diagnostics {
  default = {}
}

variable private_endpoints {
  default = {}
}

variable resource_group {
  default = {}
}

variable base_tags {}