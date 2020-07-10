


variable "name" {
  type = string
}

variable "location" {
  type = string

}




variable "admin_email" {
  type = string
}








# Storage Account

variable "account_tier" {
  type = string
}

variable "account_replication_type" {
  type = string
}

variable "account_kind" {
  type = string
}


# Storage Account Key




variable "application_short_name" {
  type = string
}

variable "subscription_abbreviation" {
  type = string
}



variable "Environment" {
  type = string
}

variable "sku_name" {
  type = string
}


variable "tags" {
  default = {
    "key" = "value"
  }
}