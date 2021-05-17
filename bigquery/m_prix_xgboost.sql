CREATE OR REPLACE MODEL beanstock.m_prix_xgboost
OPTIONS (model_type='BOOSTED_TREE_REGRESSOR', input_label_cols=['prix']) AS
SELECT * FROM beanstock.prix_clean
;

SELECT * FROM ML.EVALUATE(MODEL beanstock.m_prix_xgboost)
;