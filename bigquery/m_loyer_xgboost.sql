CREATE OR REPLACE MODEL beanstock.m_loyer_xgboost
OPTIONS (model_type='BOOSTED_TREE_REGRESSOR', input_label_cols=['loyer']) AS
SELECT * FROM beanstock.loyer_clean
;

SELECT * FROM ML.EVALUATE(MODEL beanstock.m_loyer_xgboost)
;