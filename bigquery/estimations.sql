WITH
superficies AS (
    SELECT superficie FROM UNNEST(GENERATE_ARRAY(10, 100)) AS superficie
),
inputs AS (
    SELECT maillage_code_postal.code_postal, NULL pieces, NULL chambres, superficie, longitude, latitude, geometry
    FROM beanstock.maillage_code_postal
    CROSS JOIN superficies
    LEFT JOIN beanstock.codes_postaux_clean ON codes_postaux_clean.code_postal = maillage_code_postal.code_postal
),
predicted_loyer AS (
    SELECT *
    FROM ML.PREDICT(MODEL beanstock.m_loyer_xgboost, (SELECT * FROM inputs))
),
predicted_prix AS (
    SELECT *
    FROM ML.PREDICT(MODEL beanstock.m_prix_xgboost, (SELECT * FROM inputs))
)
SELECT inputs.code_postal, inputs.superficie, predicted_loyer.predicted_loyer, predicted_prix.predicted_prix, predicted_loyer.predicted_loyer * 12 / predicted_prix.predicted_prix * 100 rendement
FROM inputs
LEFT JOIN predicted_loyer ON inputs.code_postal = predicted_loyer.code_postal AND inputs.superficie = predicted_loyer.superficie
LEFT JOIN predicted_prix ON inputs.code_postal = predicted_prix.code_postal AND inputs.superficie = predicted_prix.superficie