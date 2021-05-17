CREATE OR REPLACE TABLE beanstock.code_postal_clean AS
SELECT code_postal, ST_GEOGPOINT(longitude, latitude) emplacement
FROM beanstock.code_postal_raw
;