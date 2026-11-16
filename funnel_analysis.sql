-- 漏斗分析 SQL
USE ods;

SELECT 
    COUNT(DISTINCT CASE WHEN get_json_object(line, '$.behavior_type') = 'pv' THEN get_json_object(line, '$.user_id') END) AS pv_users,
    COUNT(DISTINCT CASE WHEN get_json_object(line, '$.behavior_type') = 'cart' THEN get_json_object(line, '$.user_id') END) AS cart_users,
    COUNT(DISTINCT CASE WHEN get_json_object(line, '$.behavior_type') = 'buy' THEN get_json_object(line, '$.user_id') END) AS buy_users
FROM user_behavior;
