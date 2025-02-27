GRANT pg_monitor TO postgres;

SELECT pg_reload_conf();

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

ALTER SYSTEM SET shared_preload_libraries TO 'pg_stat_statements';
ALTER SYSTEM SET pg_stat_statements.track = all;

SELECT pg_reload_conf();

\c pmm_db

CREATE TABLE IF NOT EXISTS test_table (id SERIAL PRIMARY KEY, data TEXT);

INSERT INTO test_table (data) 
SELECT 'test data ' || generate_series(1, 1000);

SELECT * FROM test_table LIMIT 100;
SELECT COUNT(*) FROM test_table;
SELECT data FROM test_table WHERE id < 500;