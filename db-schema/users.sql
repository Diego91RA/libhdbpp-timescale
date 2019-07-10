-- Roles
CREATE ROLE readonly;
CREATE ROLE readwrite;

-- Permissions - readonly
GRANT CONNECT ON DATABASE hdb TO readonly;
GRANT USAGE ON SCHEMA public TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly;

-- Permissions - readwrite
GRANT CONNECT ON DATABASE hdb TO readwrite;
GRANT USAGE ON SCHEMA public TO readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA public TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT USAGE ON SEQUENCES TO readwrite;

-- Users
CREATE ROLE hdb_cfg_man WITH LOGIN PASSWORD 'hdbpp';
GRANT readwrite TO hdb_cfg_man;

CREATE ROLE hdb_event_sub WITH LOGIN PASSWORD 'hdbpp';
GRANT readwrite TO hdb_event_sub;

CREATE ROLE hdb_java_reporter WITH LOGIN PASSWORD 'hdbpp';
GRANT readonly TO hdb_java_reporter;