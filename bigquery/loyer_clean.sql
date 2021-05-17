CREATE OR REPLACE TABLE beanstock.loyer_clean AS
SELECT loyer_raw.code_postal, pieces, chambres, superficie, loyer, longitude, latitude
FROM beanstock.loyer_raw
LEFT JOIN beanstock.code_postal ON loyer_raw.code_postal = code_postal.code_postal
WHERE pieces <= 10 AND superficie >= 9 AND superficie >= pieces
;