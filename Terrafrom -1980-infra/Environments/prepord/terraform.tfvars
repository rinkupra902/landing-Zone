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
vnets = {
  vnet1 = {
        name                = "Star-network"
        location            = "japaneast"
        resource_group_name = "tech"
        address_space       = ["10.0.0.0/16"]
  }

  vnet2 = {
    name                = "Dev-network"
    location            = "japaneast"
    resource_group_name = "dev"
    address_space       = ["10.1.0.0/16"]
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
    virtual_network_name = "Dev-network"

    address_prefixes = ["10.1.1.0/24"]
  }
}

vms = {
  vm1 = {
    vm_name  = "test-vm1"
    location = "japaneast"
    nic_name = "vm-nic1"

    subnet_name          = "frontend-subnet"
    virtual_network_name = "Star-network"
    resource_group_name  = "tech"
    admin_username       = "ruser"
    admin_password       = "Dev@123"
    vm_size              = "Standard_B2ats_v2"
    
  }
  vm2 = {
    vm_name              = "test-vm2"
    location             = "japaneast"
    nic_name             = "vm-nic2"
    subnet_name          = "backend-subnet"
    virtual_network_name = "Dev-network"
    resource_group_name  = "dev"
    admin_username       = "ruser"
    admin_password       = "Dev@123"
    vm_size              ="Standard_B2ats_v2"


  }
}
