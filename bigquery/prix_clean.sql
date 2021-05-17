CREATE OR REPLACE TABLE beanstock.prix_clean AS
SELECT prix_raw.code_postal, pieces, chambres, superficie, prix, longitude, latitude
FROM beanstock.prix_raw
LEFT JOIN beanstock.code_postal ON prix_raw.code_postal = code_postal.code_postal
WHERE prix > 10000 AND superficie >= 8 AND superficie >= pieces
;