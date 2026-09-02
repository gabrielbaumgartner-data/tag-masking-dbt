{% macro generate_schema_name(custom_schema_name, node) %}
    {#
      Seeds must always land in RAW.
      Non-seed models should use the configured custom schema when present,
      otherwise fall back to the default target schema.
    #}

    {% if node.resource_type == 'seed' %}
        {{ 'RAW' }}
    {% elif custom_schema_name is not none and custom_schema_name | trim != '' %}
        {{ custom_schema_name | trim }}
    {% else %}
        {{ target.schema }}
    {% endif %}
{% endmacro %}

