variable "public_ip_variables" {
    type = map(object({

      name = string
      location=string
      resource_group_name=string
      
    }))
}