module "azuremr_resource_group" {
  source         = "../../modules/azurerm_resource_group"
  resource_group = var.rgs
}
module "azurerm_virtual_network" {
  depends_on      = [module.azuremr_resource_group]
  source          = "../../modules/azurerm_virtual_network"
  virtual_network = var.vnets
}
module "azurerm_subnets" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../modules/azurerm_subnets"
  subnet_id  = var.snets
}

module "azurerm_virtual_machine" {
  depends_on = [ module.azurerm_subnets ]
  source          = "../../modules/azurerm_virtual_machine"
  virtual_machine = var.vms

}
