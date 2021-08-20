module "example" {
  source = "../"

  current_landingzone_key               = var.landingzone.key
  custom_role_definitions               = var.custom_role_definitions
  event_hub_auth_rules                  = var.event_hub_auth_rules
  event_hub_consumer_groups             = var.event_hub_consumer_groups
  event_hub_namespace_auth_rules        = var.event_hub_namespace_auth_rules
  event_hub_namespaces                  = var.event_hub_namespaces
  event_hubs                            = var.event_hubs
  global_settings                       = var.global_settings
  keyvault_access_policies              = var.keyvault_access_policies
  keyvault_certificate_issuers          = var.keyvault_certificate_issuers
  keyvaults                             = var.keyvaults
  log_analytics                         = var.log_analytics
  logged_aad_app_objectId               = var.logged_aad_app_objectId
  logged_user_objectId                  = var.logged_user_objectId
  managed_identities                    = var.managed_identities
  resource_groups                       = var.resource_groups
  role_mapping                          = var.role_mapping
  storage_accounts                      = var.storage_accounts
  subscription_billing_role_assignments = var.subscription_billing_role_assignments
  tags                                  = local.tags

  azuread = {
    azuread_api_permissions             = var.azuread_api_permissions
    azuread_applications                = var.azuread_applications
    azuread_apps                        = var.azuread_apps
    azuread_credentials                 = var.azuread_credentials
    azuread_groups                      = var.azuread_groups
    azuread_credential_policies         = var.azuread_credential_policies
    azuread_roles                       = var.azuread_roles
    azuread_service_principal_passwords = var.azuread_service_principal_passwords
    azuread_service_principals          = var.azuread_service_principals
    azuread_users                       = var.azuread_users
  }
  # # Defaulted, you can declare an override if you dont target Azure public
  # cloud = {
  #   acrLoginServerEndpoint                      = var.acrLoginServerEndpoint
  #   attestationEndpoint                         = var.attestationEndpoint
  #   azureDatalakeAnalyticsCatalogAndJobEndpoint = var.azureDatalakeAnalyticsCatalogAndJobEndpoint
  #   azureDatalakeStoreFileSystemEndpoint        = var.azureDatalakeStoreFileSystemEndpoint
  #   keyvaultDns                                 = var.keyvaultDns
  #   mariadbServerEndpoint                       = var.mariadbServerEndpoint
  #   mhsmDns                                     = var.mhsmDns
  #   mysqlServerEndpoint                         = var.mysqlServerEndpoint
  #   postgresqlServerEndpoint                    = var.postgresqlServerEndpoint
  #   sqlServerHostname                           = var.sqlServerHostname
  #   storageEndpoint                             = var.storageEndpoint
  #   storageSyncEndpoint                         = var.storageSyncEndpoint
  #   synapseAnalyticsEndpoint                    = var.synapseAnalyticsEndpoint
  #   activeDirectory                             = var.activeDirectory
  #   activeDirectoryDataLakeResourceId           = var.activeDirectoryDataLakeResourceId
  #   activeDirectoryGraphResourceId              = var.activeDirectoryGraphResourceId
  #   activeDirectoryResourceId                   = var.activeDirectoryResourceId
  #   appInsightsResourceId                       = var.appInsightsResourceId
  #   appInsightsTelemetryChannelResourceId       = var.appInsightsTelemetryChannelResourceId
  #   attestationResourceId                       = var.attestationResourceId
  #   azmirrorStorageAccountResourceId            = var.azmirrorStorageAccountResourceId
  #   batchResourceId                             = var.batchResourceId
  #   gallery                                     = var.gallery
  #   logAnalyticsResourceId                      = var.logAnalyticsResourceId
  #   management                                  = var.management
  #   mediaResourceId                             = var.mediaResourceId
  #   microsoftGraphResourceId                    = var.microsoftGraphResourceId
  #   ossrdbmsResourceId                          = var.ossrdbmsResourceId
  #   portal                                      = var.portal
  #   resourceManager                             = var.resourceManager
  #   sqlManagement                               = var.sqlManagement
  #   synapseAnalyticsResourceId                  = var.synapseAnalyticsResourceId
  #   vmImageAliasDoc                             = var.vmImageAliasDoc
  # }

  cognitive_services = {
    cognitive_services_account = var.cognitive_services_account
  }

  compute = {
    aks_clusters               = var.aks_clusters
    availability_sets          = var.availability_sets
    azure_container_registries = var.azure_container_registries
    bastion_hosts              = var.bastion_hosts
    container_groups           = var.container_groups
    dedicated_host_groups      = var.dedicated_host_groups
    dedicated_hosts            = var.dedicated_hosts
    proximity_placement_groups = var.proximity_placement_groups
    virtual_machine_scale_sets = var.virtual_machine_scale_sets
    virtual_machines           = var.virtual_machines
    wvd_applications           = var.wvd_applications
    wvd_application_groups     = var.wvd_application_groups
    wvd_host_pools             = var.wvd_host_pools
    wvd_workspaces             = var.wvd_workspaces
  }
  diagnostics = {
    diagnostic_event_hub_namespaces = var.diagnostic_event_hub_namespaces
    diagnostic_log_analytics        = var.diagnostic_log_analytics
    diagnostic_storage_accounts     = var.diagnostic_storage_accounts
    diagnostics_definition          = var.diagnostics_definition
    diagnostics_destinations        = var.diagnostics_destinations
  }
  database = {
    azurerm_redis_caches               = var.azurerm_redis_caches
    cosmos_dbs                         = var.cosmos_dbs
    databricks_workspaces              = var.databricks_workspaces
    machine_learning_workspaces        = var.machine_learning_workspaces
    mariadb_servers                    = var.mariadb_servers
    mssql_databases                    = var.mssql_databases
    mssql_elastic_pools                = var.mssql_elastic_pools
    mssql_failover_groups              = var.mssql_failover_groups
    mssql_managed_databases_backup_ltr = var.mssql_managed_databases_backup_ltr
    mssql_managed_databases_restore    = var.mssql_managed_databases_restore
    mssql_managed_instances            = var.mssql_managed_instances
    mssql_managed_instances_secondary  = var.mssql_managed_instances_secondary
    mssql_mi_administrators            = var.mssql_mi_administrators
    mssql_mi_failover_groups           = var.mssql_mi_failover_groups
    mssql_mi_secondary_tdes            = var.mssql_mi_secondary_tdes
    mssql_mi_tdes                      = var.mssql_mi_tdes
    mssql_servers                      = var.mssql_servers
    mysql_servers                      = var.mysql_servers
    postgresql_servers                 = var.postgresql_servers
    synapse_workspaces                 = var.synapse_workspaces
  }
  networking = {
    api_management                                          = var.api_managements
    application_gateway_applications                        = var.application_gateway_applications
    application_gateway_waf_policies                        = var.application_gateway_waf_policies
    application_gateways                                    = var.application_gateways
    application_security_groups                             = var.application_security_groups
    azurerm_firewall_application_rule_collection_definition = var.azurerm_firewall_application_rule_collection_definition
    azurerm_firewall_nat_rule_collection_definition         = var.azurerm_firewall_nat_rule_collection_definition
    azurerm_firewall_network_rule_collection_definition     = var.azurerm_firewall_network_rule_collection_definition
    azurerm_firewall_policies                               = var.azurerm_firewall_policies
    azurerm_firewall_policy_rule_collection_groups          = var.azurerm_firewall_policy_rule_collection_groups
    azurerm_firewalls                                       = var.azurerm_firewalls
    azurerm_routes                                          = var.azurerm_routes
    dns_zone_records                                        = var.dns_zone_records
    dns_zones                                               = var.dns_zones
    domain_name_registrations                               = var.domain_name_registrations
    express_route_circuit_authorizations                    = var.express_route_circuit_authorizations
    express_route_circuits                                  = var.express_route_circuits
    front_door_waf_policies                                 = var.front_door_waf_policies
    front_doors                                             = var.front_doors
    ip_groups                                               = var.ip_groups
    load_balancers                                          = var.load_balancers
    local_network_gateways                                  = var.local_network_gateways
    nat_gateways                                            = var.nat_gateways
    network_security_group_definition                       = var.network_security_group_definition
    network_watchers                                        = var.network_watchers
    private_dns                                             = var.private_dns
    private_endpoints                                       = var.private_endpoints
    public_ip_addresses                                     = var.public_ip_addresses
    route_tables                                            = var.route_tables
    vhub_peerings                                           = var.vhub_peerings
    virtual_hub_connections                                 = var.virtual_hub_connections
    virtual_hub_er_gateway_connections                      = var.virtual_hub_er_gateway_connections
    virtual_hub_route_tables                                = var.virtual_hub_route_tables
    virtual_hubs                                            = var.virtual_hubs
    virtual_network_gateway_connections                     = var.virtual_network_gateway_connections
    virtual_network_gateways                                = var.virtual_network_gateways
    virtual_wans                                            = var.virtual_wans
    vnet_peerings                                           = var.vnet_peerings
    vnets                                                   = var.vnets
    vpn_gateway_connections                                 = var.vpn_gateway_connections
    vpn_sites                                               = var.vpn_sites
  }

  security = {
    disk_encryption_sets          = var.disk_encryption_sets
    dynamic_keyvault_secrets      = var.dynamic_keyvault_secrets
    keyvault_certificate_issuers  = var.keyvault_certificate_issuers
    keyvault_certificate_requests = var.keyvault_certificate_requests
    keyvault_keys                 = var.keyvault_keys
    keyvault_certificates         = var.keyvault_certificates
    lighthouse_definitions        = var.lighthouse_definitions
  }
  shared_services = {
    consumption_budgets      = var.consumption_budgets
    image_definitions        = var.image_definitions
    monitor_action_groups    = var.monitor_action_groups
    monitoring               = var.monitoring
    packer_managed_identity  = var.packer_managed_identity
    packer_service_principal = var.packer_service_principal
    recovery_vaults          = var.recovery_vaults
    shared_image_galleries   = var.shared_image_galleries
  }
  storage = {
    netapp_accounts        = var.netapp_accounts
    storage_account_blobs  = var.storage_account_blobs
    storage_account_queues = var.storage_account_queues
  }
  webapp = {
    azurerm_application_insights = var.azurerm_application_insights
    app_service_environments     = var.app_service_environments
    app_service_plans            = var.app_service_plans
    app_services                 = var.app_services
  }

}
