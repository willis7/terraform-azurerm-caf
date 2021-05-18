resource "azurerm_virtual_machine_extension" "domainJoin" {
  for_each = var.extension_name == "microsoft_azure_domainJoin" ? toset(["enabled"]) : toset([])
  name                       = "microsoft_azure_domainJoin"
  virtual_machine_id         = var.virtual_machine_id
  publisher                  = "Microsoft.Compute"
  type                       = "JsonADDomainExtension"
  type_handler_version       = try(var.extension.type_handler_version, "1.3")
  auto_upgrade_minor_version = try(var.extension.auto_upgrade_minor_version, true)
  
  lifecycle {
    ignore_changes = [
      "settings",
      "protected_settings",
    ]
  }

  settings = <<SETTINGS
    {
        "Name": "${var.extension.domain_name}",
        "OUPath": "${var.extension.ou_path}",
        "User": "${var.extension.user}",
        "Restart": "${var.extension.restart}",
        "Options": "${var.extension.options}"
    }
    
SETTINGS

  protected_settings = <<PROTECTED_SETTINGS
  {
         "Password": "${data.azurerm_key_vault_secret.wvd_client_secret.value}"
  }
PROTECTED_SETTINGS

  # tags {
  #   BUC             = "${var.tagBUC}"
  #   SupportGroup    = "${var.tagSupportGroup}"
  #   AppGroupEmail   = "${var.tagAppGroupEmail}"
  #   EnvironmentType = "${var.tagEnvironmentType}"
  #   CustomerCRMID   = "${var.tagCustomerCRMID}"
  # }
}

data "azurerm_key_vault_secret" "wvd_client_secret" {
name = format("%s-client-secret", var.extension.secret_prefix)
key_vault_id = var.keyvault_id
}