{% macro get_current_date()%}
    CURRENT_DATE()
{% endmacro%}

{% macro upper_case(data)%}
    UPPER('{{data}}')
{% endmacro%}