# E-commerce User Behavior Data Warehouse (电商用户行为数仓项目)

## 1. Tech Stack (技术栈)
- **Big Data Ecosystem**: Hadoop 3.3.6, Hive 3.1.3, Spark 3.3.3
- **Environment**: Docker, Ubuntu
- **Language**: SQL, Python (Data Generation)

## 2. Project Architecture (项目架构)
`Python (Data Generation)` -> `HDFS (Storage)` -> `Hive (ODS Layer)` -> `Hive (DWD/DWS Layer)` -> `Business Metrics`

## 3. Key Implementations (核心实现)
- **Data Ingestion**: Generated 100,000 JSON log records using Python and uploaded them to HDFS, loading them into an external Hive table.
- **JSON Parsing**: Utilized Hive's built-in `get_json_object` function to extract complex JSON fields on the fly.
- **Funnel Analysis**: Calculated the user conversion funnel (PV -> Cart -> Buy) using `COUNT(DISTINCT CASE WHEN ...)` to avoid duplicate counting.
  - *Result*: PV (60007) -> Cart (19881) -> Buy (9953).
- **Repurchase Rate**: Developed a subquery with conditional aggregation (`SUM(CASE WHEN)`) to calculate the repurchase rate, and applied `* 1.0` casting to resolve Hive's integer division truncation issue.

## 4. How to Run (如何运行)
1. Start the Docker cluster: `sudo docker compose up -d`
2. Enter Hive container: `sudo docker exec -it hive-server bash`
3. Run SQL scripts in the `sql/` directory.
