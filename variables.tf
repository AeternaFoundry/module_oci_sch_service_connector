variable "sch_service_connectors" {
  description = <<EOT
Map of sch_service_connectors, attributes below
Required:
    - compartment_id
    - display_name
    - source (block):
        - config_map (optional)
        - cursor (optional, block):
            - kind (optional)
        - kind (required)
        - log_sources (optional, block):
            - compartment_id (optional)
            - log_group_id (optional)
            - log_id (optional)
        - monitoring_sources (optional, block):
            - compartment_id (optional)
            - namespace_details (optional, block):
                - kind (required)
                - namespaces (required, block):
                    - metrics (required, block):
                        - kind (required)
                    - namespace (required)
        - plugin_name (optional)
        - stream_id (optional)
    - target (block):
        - batch_rollover_size_in_mbs (optional)
        - batch_rollover_time_in_ms (optional)
        - batch_size_in_kbs (optional)
        - batch_size_in_num (optional)
        - batch_time_in_sec (optional)
        - bucket (optional)
        - compartment_id (optional)
        - dimensions (optional, block):
            - dimension_value (optional, block):
                - kind (required)
                - path (optional)
                - value (optional)
            - name (optional)
        - enable_formatted_messaging (optional)
        - function_id (optional)
        - kind (required)
        - log_group_id (optional)
        - log_source_identifier (optional)
        - metric (optional)
        - metric_namespace (optional)
        - namespace (optional)
        - object_name_prefix (optional)
        - stream_id (optional)
        - topic_id (optional)
Optional:
    - defined_tags
    - description
    - freeform_tags
    - state
    - tasks (block):
        - batch_size_in_kbs (optional)
        - batch_time_in_sec (optional)
        - condition (optional)
        - function_id (optional)
        - kind (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    compartment_id = string
    display_name   = string
    defined_tags   = optional(map(string))
    description    = optional(string)
    freeform_tags  = optional(map(string))
    state          = optional(string)
    source = object({
      config_map = optional(string)
      cursor = optional(object({
        kind = optional(string)
      }))
      kind = string
      log_sources = optional(list(object({
        compartment_id = optional(string)
        log_group_id   = optional(string)
        log_id         = optional(string)
      })))
      monitoring_sources = optional(list(object({
        compartment_id = optional(string)
        namespace_details = optional(object({
          kind = string
          namespaces = list(object({
            metrics = object({
              kind = string
            })
            namespace = string
          }))
        }))
      })))
      plugin_name = optional(string)
      stream_id   = optional(string)
    })
    target = object({
      batch_rollover_size_in_mbs = optional(number)
      batch_rollover_time_in_ms  = optional(number)
      batch_size_in_kbs          = optional(number)
      batch_size_in_num          = optional(number)
      batch_time_in_sec          = optional(number)
      bucket                     = optional(string)
      compartment_id             = optional(string)
      dimensions = optional(list(object({
        dimension_value = optional(object({
          kind  = string
          path  = optional(string)
          value = optional(string)
        }))
        name = optional(string)
      })))
      enable_formatted_messaging = optional(bool)
      function_id                = optional(string)
      kind                       = string
      log_group_id               = optional(string)
      log_source_identifier      = optional(string)
      metric                     = optional(string)
      metric_namespace           = optional(string)
      namespace                  = optional(string)
      object_name_prefix         = optional(string)
      stream_id                  = optional(string)
      topic_id                   = optional(string)
    })
    tasks = optional(list(object({
      batch_size_in_kbs = optional(number)
      batch_time_in_sec = optional(number)
      condition         = optional(string)
      function_id       = optional(string)
      kind              = string
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        v.source.monitoring_sources == null || alltrue([for item in v.source.monitoring_sources : (item.namespace_details == null || (length(item.namespace_details.namespaces) >= 1))])
      )
    ])
    error_message = "Each namespaces list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        contains([for v in ["logging", "monitoring", "plugin", "streaming"] : lower(v)], lower(v.source.kind))
      )
    ])
    error_message = "must be one of: \"logging\", \"monitoring\", \"plugin\", \"streaming\""
  }
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        v.source.monitoring_sources == null || alltrue([for item in v.source.monitoring_sources : (item.namespace_details == null || (contains([for v in ["selected"] : lower(v)], lower(item.namespace_details.kind))))])
      )
    ])
    error_message = "must be one of: \"selected\""
  }
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        contains([for v in ["functions", "loggingAnalytics", "monitoring", "notifications", "objectStorage", "streaming"] : lower(v)], lower(v.target.kind))
      )
    ])
    error_message = "must be one of: \"functions\", \"loggingAnalytics\", \"monitoring\", \"notifications\", \"objectStorage\", \"streaming\""
  }
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        v.target.dimensions == null || alltrue([for item in v.target.dimensions : (item.dimension_value == null || (contains([for v in ["jmesPath", "static"] : lower(v)], lower(item.dimension_value.kind))))])
      )
    ])
    error_message = "must be one of: \"jmesPath\", \"static\""
  }
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        v.tasks == null || alltrue([for item in v.tasks : (contains([for v in ["function", "logRule"] : lower(v)], lower(item.kind)))])
      )
    ])
    error_message = "must be one of: \"function\", \"logRule\""
  }
  validation {
    condition = alltrue([
      for k, v in var.sch_service_connectors : (
        v.state == null || (contains([for v in ["INACTIVE", "ACTIVE"] : lower(v)], lower(v.state)))
      )
    ])
    error_message = "must be one of: \"INACTIVE\", \"ACTIVE\""
  }
}

