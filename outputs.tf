output "sch_service_connectors_id" {
  description = "Map of id values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no id are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.id if v.id != null && length(v.id) > 0 }
}
output "sch_service_connectors_compartment_id" {
  description = "Map of compartment_id values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no compartment_id are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.compartment_id if v.compartment_id != null && length(v.compartment_id) > 0 }
}
output "sch_service_connectors_defined_tags" {
  description = "Map of defined_tags values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no defined_tags are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.defined_tags if v.defined_tags != null && length(v.defined_tags) > 0 }
}
output "sch_service_connectors_description" {
  description = "Map of description values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no description are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.description if v.description != null && length(v.description) > 0 }
}
output "sch_service_connectors_display_name" {
  description = "Map of display_name values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no display_name are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "sch_service_connectors_freeform_tags" {
  description = "Map of freeform_tags values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no freeform_tags are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.freeform_tags if v.freeform_tags != null && length(v.freeform_tags) > 0 }
}
output "sch_service_connectors_lifecycle_details" {
  description = "Map of lifecycle_details values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no lifecycle_details are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.lifecycle_details if v.lifecycle_details != null && length(v.lifecycle_details) > 0 }
}
output "sch_service_connectors_lifecyle_details" {
  description = "Map of lifecyle_details values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no lifecyle_details are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.lifecyle_details if v.lifecyle_details != null && length(v.lifecyle_details) > 0 }
}
output "sch_service_connectors_source" {
  description = "Map of source values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no source are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => one(v.source) if v.source != null && length(v.source) > 0 }
}
output "sch_service_connectors_state" {
  description = "Map of state values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no state are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.state if v.state != null && length(v.state) > 0 }
}
output "sch_service_connectors_system_tags" {
  description = "Map of system_tags values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no system_tags are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.system_tags if v.system_tags != null && length(v.system_tags) > 0 }
}
output "sch_service_connectors_target" {
  description = "Map of target values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no target are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => one(v.target) if v.target != null && length(v.target) > 0 }
}
output "sch_service_connectors_tasks" {
  description = "Map of tasks values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no tasks are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.tasks if v.tasks != null && length(v.tasks) > 0 }
}
output "sch_service_connectors_time_created" {
  description = "Map of time_created values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no time_created are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.time_created if v.time_created != null && length(v.time_created) > 0 }
}
output "sch_service_connectors_time_updated" {
  description = "Map of time_updated values across all sch_service_connectors, keyed the same as var.sch_service_connectors except keys with no time_updated are omitted"
  value       = { for k, v in oci_sch_service_connector.sch_service_connectors : k => v.time_updated if v.time_updated != null && length(v.time_updated) > 0 }
}

