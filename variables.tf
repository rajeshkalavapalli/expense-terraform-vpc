### tags related variables ###
variable "project_name" {
  type = string

}  # defalult input but no value 

variable "environment" {
  type = string
  default = "Dev"
}


variable "common_tags" {
  type = map
  
}



### vpc reated variables###
variable "vpc_cider" {
  type = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type = bool
  default = true
}

variable "vpc_tags" {
  type = map
  default = {} # not mandatory so used #
}

### internet gatway tags###
variable "ig_tags" {
  type = map
  default = {}
}

### public subnnet###
variable "public_subnet_cidrs" {
 type = list
    validation {
      condition = length(var.public_subnet_cidrs) ==2
      error_message = "please provide 2 valid public subnet cidr"
    }
}

variable "public_subnet_cidr_tags" {
    type = map
    default = {}
}

### private subnnet###
variable "private_subnet_cidrs" {
 type = list
    validation {
      condition = length(var.private_subnet_cidrs) ==2
      error_message = "please provide 2 valid private subnet cidr"
    }
}

variable "private_subnet_cidr_tags" {
    type = map
    default = {}
}

### database subnnet###
variable "database_subnet_cidrs" {
 type = list
    validation {
      condition = length(var.database_subnet_cidrs) ==2
      error_message = "please provide 2 valid database subnet cidr"
    }
}

variable "database_subnet_cidr_tags" {
    type = map
    default = {}
}

### natgatway tags ###
variable "natgatway_tags" {
  default = {}

}

##route table tags##

variable "public_route_table_tags" {
  default = {}
}

variable "private_route_table_tags" {
  default = {}
}

variable "database_route_table_tags" {
  default = {}
}

# peering ##
variable "is_peering_required" {
  type = bool
  default = false
}

variable "acceptor_vpc_id" {
  type = string
  default = ""
}

    
variable "database_subnet_group_tags" {
  default = {}
}