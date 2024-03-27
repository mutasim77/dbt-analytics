{% macro convert_to_string(column_name) %}
    CAST({{ column_name }} AS STRING)
{% endmacro %}
