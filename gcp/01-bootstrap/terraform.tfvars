##############
## VPC VARS ##
##############

vpc_name = "vpc-main" # Note: A random prefix will be automatically added to this name to ensure uniqueness
vpc_routing_mode = "GLOBAL" # Can be "REGIONAL" or "GLOBAL"
vpc_mtu = 1500 # Must be between 1460 and 1500, or set it to 0 for the default MTU
