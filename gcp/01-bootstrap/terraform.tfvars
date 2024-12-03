##############
## VPC VARS ##
##############

vpc_name = "vpc-main" # Note: A random prefix will be automatically added to this name to ensure uniqueness
vpc_routing_mode = "GLOBAL" # Can be "REGIONAL" or "GLOBAL"
vpc_mtu = 1500 # Must be between 1460 and 1500, or set it to 0 for the default MTU
vpc_subnets = {
  "subnet-melbourne1" = {
    "ip_cidr_range" = "172.16.0.0/22", # 172.16.0.0/22 = 172.16.0.1 to 172.16.3.254 (1022 hosts)
    "region" = "australia-southeast2", 
    "private_ip_google_access" = "true"
  }, 
  "subnet-singapore1" = {
    "ip_cidr_range" = "172.20.0.0/22", # 172.20.0.0/22 = 172.20.0.1 to 172.20.3.254 (1022 hosts)
    "region" = "asia-southeast1", 
    "private_ip_google_access" = "true"
  },
  "subnet-tokyo1" = {
    "ip_cidr_range" = "172.24.0.0/22", # 172.24.0.0/22 = 172.24.0.1 to 172.24.3.254 (1022 hosts)
    "region" = "asia-northeast1", 
    "private_ip_google_access" = "true"
  }
}
