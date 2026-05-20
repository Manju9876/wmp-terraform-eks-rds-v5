module "database" {
  for_each = var.database
  source   = "./modules/rds"

  component_name    = each.key
  allocated_storage = each.value["allocated_storage"]
  env               = var.env
  subnets           = var.subnets
}



module "eks" {
  depends_on = [module.database]
  source = "./modules/eks"

  env     = var.env
  subnets = var.subnets
}