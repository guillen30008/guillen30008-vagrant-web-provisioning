#!/usr/bin/env bash
set -e

sudo apt-get update -y
sudo apt-get install -y postgresql postgresql-contrib

sudo sed -i "s/^#\?listen_addresses.*/listen_addresses = '*'/" /etc/postgresql/*/main/postgresql.conf
echo "host    all             all             192.168.56.10/32        md5" | sudo tee -a /etc/postgresql/*/main/pg_hba.conf > /dev/null

sudo systemctl enable postgresql
sudo systemctl restart postgresql

sudo -u postgres psql -v ON_ERROR_STOP=1 <<'SQL'
DO $$
BEGIN
   IF NOT EXISTS (SELECT FROM pg_roles WHERE rolname = 'appuser') THEN
      CREATE ROLE appuser LOGIN PASSWORD 'appsecret';
   END IF;
END$$;

CREATE DATABASE appdb OWNER appuser;
\connect appdb

CREATE TABLE IF NOT EXISTS productos(
  id SERIAL PRIMARY KEY,
  nombre VARCHAR(50),
  precio NUMERIC(10,2)
);

INSERT INTO productos(nombre, precio) VALUES
('Galleta choco', 3500),
('Galleta avena', 3000)
ON CONFLICT DO NOTHING;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO appuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO appuser;
SQL
