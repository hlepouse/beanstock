CREATE OR REPLACE MODEL beanstock.m_loyer_linear_reg
OPTIONS (model_type='linear_reg', input_label_cols=['loyer']) AS
SELECT * FROM beanstock.loyer_clean
;

SELECT * FROM ML.EVALUATE(MODEL beanstock.m_loyer_linear_reg)
;