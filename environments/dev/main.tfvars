dns_domain = "devopsbymanju.shop."
env = "dev"
subnets = ["subnet-0a88a513542103904","subnet-058269c99acc7d807"]
vpc_id = "vpc-09e9165f3b993bf91"

# apps = {
#   frontend = {
#     instance_type = "t3.small"
#     ports = {
#       frontend = 80
#     }
#     alb = {
#       ports = 80
#       alb_internal = false
#     }
#     asg = {
#       min_size = 2
#       max_size = 5
#     }
#   }
#   auth-service = {
#     instance_type = "t3.small"
#     ports = {
#       auth-service = 8081
#     }
#     alb = {
#       ports = 8081
#       alb_internal = true
#     }
#     asg = {
#       min_size = 2
#       max_size = 5
#     }
#   }
#   portfolio-service = {
#     instance_type = "t3.small"
#     ports = {
#       portfolio-service = 8080
#     }
#     alb = {
#       ports = 8080
#       alb_internal = true
#     }
#     asg = {
#       min_size = 2
#       max_size = 5
#     }
#   }
#   analytics-service = {
#     instance_type = "t3.small"
#     ports = {
#       analytics-service = 8000
#     }
#     alb = {
#       ports = 8000
#       alb_internal = true
#     }
#     asg = {
#       min_size = 2
#       max_size = 5
#     }
#   }
# }

database = {
  postgresql = {
    allocated_storage = "10"
  }
}

