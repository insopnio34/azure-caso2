variable "vm_tamanyo" {
  type = string
  description = "Tamano de la maquina virtual"
  default = "Standard_B2s" # - 2 vcpu, 4 GiB de memoria 
}

variable "grupo_recursos" {
	type = string
	description = "grupo de recursos"
    default = "lpsc-grupo_vm"
}

