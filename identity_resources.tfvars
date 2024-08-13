root_parent_id = "a88fc306-040b-4873-8e02-9624f097a9fa"
root_id = "mgmt"
root_name = "sbuk"
deploy_core_landing_zones = true
deploy_corp_landing_zones = true
deploy_online_landing_zones = true
deploy_sap_landing_zones = false
deploy_demo_landing_zones = false
deploy_management_resources = true
deploy_diagnostics_for_mg = false
configure_management_resources = {
    settings = {
      ama = {
        enable_uami = true
        enable_vminsights_dcr = true
        enable_change_tracking_dcr = true
        enable_mdfc_defender_for_sql_dcr = true
        enable_mdfc_defender_for_sql_query_collection_for_security_research = true
      }
      log_analytics = {
        enabled = false
        config = {
          retention_in_days = 30
          enable_monitoring_for_vm = true
          enable_monitoring_for_vmss = true
          enable_sentinel = true
          enable_change_tracking = true
        }
      }
      security_center = {
        enabled = false
        config = {
          email_security_contact = "ranagreed@appnetwise.com"
          enable_defender_for_app_services = true
          enable_defender_for_arm = true
          enable_defender_for_containers = true
          enable_defender_for_cosmosdbs = true
          enable_defender_for_cspm = true
          enable_defender_for_key_vault = true
          enable_defender_for_oss_databases = true
          enable_defender_for_servers = true
          enable_defender_for_servers_vulnerability_assessments = true
          enable_defender_for_sql_servers = true
          enable_defender_for_sql_server_vms = true
          enable_defender_for_storage = true
        }
      }
    }
    location = ""
    tags = {}
    advanced = {}
  }
deploy_identity_resources = true
configure_identity_resources = {}
deploy_connectivity_resources = true
configure_connectivity_resources = {
    settings = {
      # Create two hub networks with hub mesh peering enabled
      # and link to DDoS protection plan if created
      hub_networks = [
        # {
        #   config = {
        #     address_space                   = ["10.100.0.0/22", ]
        #     location                        = "eastus" #var.primary_location
        #     link_to_ddos_protection_plan    =  false #var.enable_ddos_protection
        #     enable_hub_network_mesh_peering = true
        #   }
        # },
      ]
      vwan_hub_networks = [
        {
          enabled = false
          config = {
            address_prefix = "10.100.0.0/22"
            location       = "eastus" #var.primary_location
            sku            = ""
            routes         = []
            routing_intent = {
              enabled = true
              config = {
                routing_policies = [
                  {
                    name         = "InternetTrafficPolicy"
                    destinations = ["Internet"]
                  },
                ]
              }
            }
            expressroute_gateway = {
              enabled = false
              config = {
                scale_unit                    = 1
                allow_non_virtual_wan_traffic = false
              }
            }
            vpn_gateway = {
              enabled = false
              config = {
                bgp_settings       = []
                routing_preference = ""
                scale_unit         = 1
              }
            }
            azure_firewall = {
              enabled = true
              config = {
                enable_dns_proxy              = false
                dns_servers                   = []
                sku_tier                      = "Standard"
                base_policy_id                = ""
                private_ip_ranges             = []
                threat_intelligence_mode      = ""
                threat_intelligence_allowlist = {}
                availability_zones = {
                  zone_1 = true
                  zone_2 = false
                  zone_3 = false
                }
              }
            }
            spoke_virtual_network_resource_ids        = []
            secure_spoke_virtual_network_resource_ids = []
            enable_virtual_hub_connections            = true
          }
        },
        {
          enabled = false
          config = {
            address_prefix = "10.200.2.0/24"
            location       = "eastus2" #var.secondary_location
            sku            = ""
            routes         = [
              ]
            routing_intent = {
              enabled = true
              config = {
                routing_policies = [
                  {
                    name         = "InternetTrafficPolicy"
                    destinations = ["Internet"]
                  },
                ]
              }
            }
             expressroute_gateway = {
              enabled = false
              config = {
                scale_unit                    = 1
                allow_non_virtual_wan_traffic = false
              }
            }
            vpn_gateway = {
              enabled = false
              config = {
                bgp_settings       = []
                routing_preference = ""
                scale_unit         = 1
              }
            }
            azure_firewall = {
              enabled = false
              config = {
                enable_dns_proxy              = false
                dns_servers                   = []
                sku_tier                      = "Standard"
                base_policy_id                = ""
                private_ip_ranges             = []
                threat_intelligence_mode      = ""
                threat_intelligence_allowlist = {}
                availability_zones = {
                  zone_1 = true
                  zone_2 = false
                  zone_3 = false
                }
              }
            }
            spoke_virtual_network_resource_ids        = []
            secure_spoke_virtual_network_resource_ids = []
            enable_virtual_hub_connections            = true
          }
        },
        # The following virtual_hub_network entry is used to ensure
        # correct operation of logic for creating virtual hub
        # connections and DNS links when in a disabled state.
        # Should not create any resources.
        {
          enabled = false
          config = {
            address_prefix                            = "10.202.0.0/22"
            location                                  = "centralindia"
            spoke_virtual_network_resource_ids        = []
            secure_spoke_virtual_network_resource_ids = []
            enable_virtual_hub_connections            = true
          }
        },
      ]
      ddos_protection_plan = {
        enabled = false
      }
      dns = {
        enabled = false
        config = {
          enable_private_link_by_service = {
            # The following DNS zones are disabled in the test suite to test
            # functionality but also because these do not currently have
            # corresponding built-in policy definitions.
            azure_api_management                 = false
            azure_arc                            = false
            azure_backup                         = false
            azure_bot_service_bot                = false
            azure_bot_service_token              = false
            azure_cache_for_redis_enterprise     = false
            azure_data_explorer                  = false
            azure_data_health_data_services      = false
            azure_data_lake_file_system_gen2     = false
            azure_database_for_mariadb_server    = false
            azure_database_for_mysql_server      = false
            azure_database_for_postgresql_server = false
            azure_databricks                     = false
            azure_digital_twins                  = false
            azure_key_vault_managed_hsm          = false
            azure_kubernetes_service_management  = false
            azure_openai_service                 = false
            azure_purview_account                = false
            azure_purview_studio                 = false
            azure_relay_namespace                = false
            azure_sql_database_sqlserver         = false
            azure_synapse_analytics_dev          = false
            azure_synapse_analytics_sql          = false
            azure_synapse_studio                 = false
            azure_web_apps_static_sites          = false
            microsoft_power_bi                   = false
          }
          private_link_locations = []
          public_dns_zones       = []
          private_dns_zones = [
            "privatelink.blob.core.windows.net", # To test de-duplication of custom specified DNS zones as per issue #577
          ]
          enable_private_dns_zone_virtual_network_link_on_hubs   = true
          enable_private_dns_zone_virtual_network_link_on_spokes = true
          virtual_network_resource_ids_to_link                   = []
        }
      }
     }

}    
archetype_config_overrides = {}
subscription_id_overrides = {
    corp = ["2e1b9853-67a8-4fb5-a740-bc8c783b2f83"]
}
subscription_id_connectivity = "c83d2f33-3ce8-4997-8676-1a0467318e0a"
subscription_id_identity = "6e219f85-0dbe-4e11-ac40-ce485b0187cd"
subscription_id_management = "ea0a0669-7cd7-4792-aadb-8f128ca2dfef"
custom_landing_zones = {}
library_path = ""
template_file_variables = {}
default_location = "eastus"
default_tags = {}
disable_base_module_tags = false
create_duration_delay = {}
destroy_duration_delay = {}
custom_policy_roles = {}
disable_telemetry = false
strict_subscription_association = false
policy_non_compliance_message_enabled = true
policy_non_compliance_message_not_supported_definitions = []
policy_non_compliance_message_default_enabled = true
policy_non_compliance_message_default = "This resource {enforcementMode} be compliant with the assigned policy."
policy_non_compliance_message_enforcement_placeholder = "{enforcementMode}"
policy_non_compliance_message_enforced_replacement = "must"
policy_non_compliance_message_not_enforced_replacement = "should"
resource_custom_timeouts = {}