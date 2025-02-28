GRANT pg_monitor TO postgres;

SELECT pg_reload_conf();

CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

ALTER SYSTEM SET shared_preload_libraries TO 'pg_stat_statements';
ALTER SYSTEM SET pg_stat_statements.track = all;

SELECT pg_reload_conf();
