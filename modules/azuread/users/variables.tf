variable "global_settings" {
  description = "Global settings object (see module README.md)"
}
variable "client_config" {
  description = "Client configuration object (see module README.md)."
}
variable "settings" {
  description = ""
  type = object({
    user_name             = string
    keyvault_key          = string
    secret_prefix         = optional(string)
    account_enabled       = optional(bool)
    city                  = optional(string)
    company_name          = optional(string)
    department            = optional(string)
    force_password_change = optional(bool)
    given_name            = optional(string)
    job_title             = optional(string)
    mail_nickname         = optional(string)
    mobile                = optional(string)
    postal_code           = optional(string)
    state                 = optional(string)
    street_address        = optional(string)
    surname               = optional(string)
    usage_location        = optional(string)
    password_policy = object({
      length         = number
      special        = bool
      upper          = bool
      number         = bool
      expire_in_days = number
      rotation = object({
        mins = number
      })
    })
    global_settings = optional(object({
      random_length = number
      passthrough   = bool
      use_slug      = bool
    }))
  })
}
variable "keyvaults" {}
variable "password_policy" {
  description = "Map to define the password policy to apply"
  default = {
    # Length of the password
    length  = 250
    special = false
    upper   = true
    number  = true

    # Define the number of days the password is valid. It must be more than the rotation frequency
    expire_in_days = 180
    rotation = {
      #
      # Set how often the password must be rotated. When passed the renewal time, running the terraform plan / apply will change to a new password
      # Only set one of the value
      #

      # mins   = 10     # only recommended for CI and demo
      # days   = 7
      months = 1
    }
  }
}