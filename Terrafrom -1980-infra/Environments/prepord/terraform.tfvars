rgs = {
  rg1 = {
    name     = "tech"
    location = "japaneast"
  }
  rg2 = {
    name     = "dev"
    location = "japaneast"
  }
}

vnts = {
  vnet1 = {
    name                = "Star-network"
    address_space       = ["10.0.0.0/16"]
    location            = "japaneast"
    resource_group_name = "tech"
  }
}

snets = {
  snet1 = {
    name                 = "frontend-subnet"
    resource_group_name  = "tech"
    virtual_network_name = "Star-network"
    address_prefixes     = ["10.0.1.0/24"]
  }

  snet2 = {
    name                 = "backend-subnet"
    resource_group_name  = "dev"
    virtual_network_name = "Star-network"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

vms = {
  vm1 = {
    vm_name     = "test_vm1"
    location            = "japaneast"
    nic_name            = "vm1-nic1"

    subnet_name    = "backend"
    virtual_network_name = "my-vnet"
    resource_group_name = "tech"
    admin_username      = "ruser"
    admin_password      = "Dev@123"
    vm_size             = "Standard_B1s"
  }
  vm2 = {
  vm_name            = "test_vm1"
    location            = "japaneast"
    nic_name            = "vm1-nic2"
    subnet_name          = "backend"
    virtual_network_name = "my-vnet"
    resource_group_name = "dev"
    admin_username      = "ruser"
    admin_password      = "Dev@123"
    vm_size             = "Standard_B1s"
  }
}
