SELECT 
    SUM(CASE WHEN buy_cnt >= 2 THEN 1 ELSE 0 END) * 1.0 / COUNT(1) AS repurchase_rate
FROM (
    SELECT 
        get_json_object(line, '$.user_id') AS user_id,
        COUNT(1) AS buy_cnt
    FROM ods.user_behavior
    WHERE get_json_object(line, '$.behavior_type') = 'buy'
    GROUP BY get_json_object(line, '$.user_id')
) AS sub;
