#variable para configurar la localizacion donde tendremos los recursos
variable "localizacion" {
  type = string
  description = "Region de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

variable "storage_account" {
	type = string
	description = "Nombre para la storage account"
    default = "storelpscvm"
}


variable "public_key_path" {
  type = string
  description = "Ruta para la clave publica de acceso a las instancias"
  default = "/home/lorena/.ssh/id_rsa.pub" # o la ruta correspondiente
}

variable "ssh_user" {
	type = string
	description = "Usuario para hacer ssh"
    default = "ansible"
}