{{ config(materialized='table') }}


ALTER TABLE {{ ref('env_facts_table') }}
ADD CONSTRAINT fk_fact_environment_data_date
FOREIGN KEY (date) REFERENCES {{ ref('date_dimension') }} (date);

ALTER TABLE {{ ref('env_facts_table') }}
ADD CONSTRAINT fk_fact_environment_data_city
FOREIGN KEY (city) REFERENCES {{ ref('city_dimension') }} (city)