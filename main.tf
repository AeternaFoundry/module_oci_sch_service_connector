resource "oci_sch_service_connector" "sch_service_connectors" {
  for_each = var.sch_service_connectors

  compartment_id = each.value.compartment_id
  display_name   = each.value.display_name
  defined_tags   = each.value.defined_tags
  description    = each.value.description
  freeform_tags  = each.value.freeform_tags
  state          = each.value.state

  source {
    config_map = each.value.source.config_map
    dynamic "cursor" {
      for_each = each.value.source.cursor != null ? [each.value.source.cursor] : []
      content {
        kind = cursor.value.kind
      }
    }
    kind = each.value.source.kind
    dynamic "log_sources" {
      for_each = each.value.source.log_sources != null ? each.value.source.log_sources : []
      content {
        compartment_id = log_sources.value.compartment_id
        log_group_id   = log_sources.value.log_group_id
        log_id         = log_sources.value.log_id
      }
    }
    dynamic "monitoring_sources" {
      for_each = each.value.source.monitoring_sources != null ? each.value.source.monitoring_sources : []
      content {
        compartment_id = monitoring_sources.value.compartment_id
        dynamic "namespace_details" {
          for_each = monitoring_sources.value.namespace_details != null ? [monitoring_sources.value.namespace_details] : []
          content {
            kind = namespace_details.value.kind
            dynamic "namespaces" {
              for_each = namespace_details.value.namespaces
              content {
                metrics {
                  kind = namespaces.value.metrics.kind
                }
                namespace = namespaces.value.namespace
              }
            }
          }
        }
      }
    }
    plugin_name = each.value.source.plugin_name
    stream_id   = each.value.source.stream_id
  }

  target {
    batch_rollover_size_in_mbs = each.value.target.batch_rollover_size_in_mbs
    batch_rollover_time_in_ms  = each.value.target.batch_rollover_time_in_ms
    batch_size_in_kbs          = each.value.target.batch_size_in_kbs
    batch_size_in_num          = each.value.target.batch_size_in_num
    batch_time_in_sec          = each.value.target.batch_time_in_sec
    bucket                     = each.value.target.bucket
    compartment_id             = each.value.target.compartment_id
    dynamic "dimensions" {
      for_each = each.value.target.dimensions != null ? each.value.target.dimensions : []
      content {
        dynamic "dimension_value" {
          for_each = dimensions.value.dimension_value != null ? [dimensions.value.dimension_value] : []
          content {
            kind  = dimension_value.value.kind
            path  = dimension_value.value.path
            value = dimension_value.value.value
          }
        }
        name = dimensions.value.name
      }
    }
    enable_formatted_messaging = each.value.target.enable_formatted_messaging
    function_id                = each.value.target.function_id
    kind                       = each.value.target.kind
    log_group_id               = each.value.target.log_group_id
    log_source_identifier      = each.value.target.log_source_identifier
    metric                     = each.value.target.metric
    metric_namespace           = each.value.target.metric_namespace
    namespace                  = each.value.target.namespace
    object_name_prefix         = each.value.target.object_name_prefix
    stream_id                  = each.value.target.stream_id
    topic_id                   = each.value.target.topic_id
  }

  dynamic "tasks" {
    for_each = each.value.tasks != null ? each.value.tasks : []
    content {
      batch_size_in_kbs = tasks.value.batch_size_in_kbs
      batch_time_in_sec = tasks.value.batch_time_in_sec
      condition         = tasks.value.condition
      function_id       = tasks.value.function_id
      kind              = tasks.value.kind
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

