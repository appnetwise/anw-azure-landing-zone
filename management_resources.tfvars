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
        enabled = true
        config = {
          retention_in_days = 30
          enable_monitoring_for_vm = true
          enable_monitoring_for_vmss = true
          enable_sentinel = true
          enable_change_tracking = true
        }
      }
      security_center = {
        enabled = true
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
deploy_identity_resources = false
configure_identity_resources = {}
deploy_connectivity_resources = false
configure_connectivity_resources = {}
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
default_location = "east us"
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